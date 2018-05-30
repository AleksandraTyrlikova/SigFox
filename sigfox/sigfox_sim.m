clear all
timespan = 600*1000; % интервал между появлениями сообщений в ms 
timeinterval = 10; % дискрет времени в ms 
nrofslots = timespan/timeinterval;% число дискретов времени

freqspan = 125*1000; % полоса для SigFox в герцах 125khz
freqinterval = 100; % одна полоса в SigFox hz
nrofchannels = ceil(freqspan / freqinterval);% число частотных каналов в SigFox


%interval = 10;%??
nrofpackets = 3;% число копий сообщения
packetduration = 1840;% длительность пакета в милисекундах (23 байта = 1840 ms)
%maxnrofdevices = 10000;
%devicestepsize = maxnrofdevices / interval;
% results = zeros(maxnrofdevices/devicestepsize, 2);


%nrofdevices = devicestepsize:devicestepsize:maxnrofdevices;
nrofdevices =[100 500 1000 5000 10000]% массив для количесва устройств
results = zeros(length( nrofdevices), 3);% массив для формирования результатов

for index =1:length( nrofdevices) % цикл по числу устройств   
    nr=nrofdevices(index)% число устройств
    ft = zeros(nrofslots, nrofchannels);% массив для хранения результатов по временным слотам
                                        % и по частотным каналам. Сколько
                                        % раз использовали данный слот
    ft2 = zeros(nrofslots, nrofchannels);% массив для хранения результатов по временным слотам
                                        % и по частотным каналам. Номер
                                        % последнего конечного устройсва,
                                        % который использовал данный слот
    colission = zeros(nr, nrofpackets);% массив для рассчета коллизий 

    freq = randi([1 nrofchannels], [nr nrofpackets]);% случайный выбор для каждого абонента частотного 
    % канала в диапазоне [1 nrofchannels] для каждого из nr абонентов выбор
    % делается nrofpackets раз. Формируется массив freq в строке с номером
    % i в первом столбце частотный канал для первой копии...в столбце с
    % номером nrofpackets частотный канал для последней копии.
    time = randi([1 nrofslots - (packetduration*nrofpackets)/timeinterval], [nr 1]);% случайный выбор для каждого абонента частотного 
    % временного слота в диапазоне [1 nrofslots - (packetduration*nrofpackets)/timeinterval] для каждого из nr абонентов выбор
    % делается 1 раз. Формируется массив time в строке с номером
    % i в первом столбце записывается временной слот для i абонента (так
    % как время передачи для всех копий одинаково, а частоты разные.
    for i = 1:nr % анализ массивов time и freq для определения конфликтов
        time_offset = time(i, 1); % время передачи для i конечного устройства 
        for p = 1:nrofpackets % цикл по комиям    
            for k = -1:1:1 % расматриваем 3 канала с нижней частотой с текущей частотой и с верхней 
                % частотой 
                if (freq(i, p)+k<1) | (freq(i, p)+k>nrofchannels)
                    continue % Если канал лежит на границе, то перехой к следующей копиее 
                end
                for j = 1:packetduration/timeinterval % двигаемся по времени передачи пакета
                   %freq(i, 1)
                   if j+time_offset > nrofslots 
                       continue % вышли за границы timespan
                   end
                  
                   if  ft(j+time_offset, freq(i, p)+k) == 0 % данный частотно временной слот еще не использовался
                       ft(j+time_offset, freq(i, p)+k) = 1; % устанавливаем счетчик использования частотного временного слота
                                                            % в единицу 
                       ft2(j+time_offset,freq(i, p)+k) = i; % помечаем, что данный частотното временной слот использовал 
                                                            % i конечное устройсво
                   else % данный частотно временной слот используется повторно (?? надо подсчтывать SINR)
                        ft(j+time_offset, freq(i, p)+k) = ft(j+time_offset, freq(i, p)+k) + 1; % увеличивается счетчик использования слота
                        colission(i, p) = 1; % помечаем, что для i конечного устройсва конфликт
                        colission(ft2(j+time_offset,freq(i, p)+k), p) = 1; % у устройства которое до этого
                        % передовало в этом слоте тоже конфликт
                   end
                end % конец движения по очередной копие        
            end% конец цикла по соседним частотным подканалам 
            time_offset = time_offset + packetduration/timeinterval;
        end % конец цикла по комиям    
    end % конец цикла по абонентам
    
    results(index, 1) = sum(sum(colission));
    fail = sum(colission, 2) == nrofpackets;% вычисляем число абонентов у которых все копии попали в конфликт
    results(index, 2) = sum(fail);
    results(index, 3) = 1-sum(sum(fail))/nr;% вычисляем PDR = 1 - (чисоло абонентов у которых все копии 
    % попали в конфликьт)/общее число абонентов)
    
    results(index, 1)
    results(index, 2)

end


%figure1 = figure();
plot(nrofdevices,results(:, 3),'-o');
hold on


