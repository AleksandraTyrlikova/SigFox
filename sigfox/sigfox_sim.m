clear all
timespan = 600*1000; % �������� ����� ����������� ��������� � ms 
timeinterval = 10; % ������� ������� � ms 
nrofslots = timespan/timeinterval;% ����� ��������� �������

freqspan = 125*1000; % ������ ��� SigFox � ������ 125khz
freqinterval = 100; % ���� ������ � SigFox hz
nrofchannels = ceil(freqspan / freqinterval);% ����� ��������� ������� � SigFox


%interval = 10;%??
nrofpackets = 3;% ����� ����� ���������
packetduration = 1840;% ������������ ������ � ������������ (23 ����� = 1840 ms)
%maxnrofdevices = 10000;
%devicestepsize = maxnrofdevices / interval;
% results = zeros(maxnrofdevices/devicestepsize, 2);


%nrofdevices = devicestepsize:devicestepsize:maxnrofdevices;
nrofdevices =[100 500 1000 5000 10000]% ������ ��� ��������� ���������
results = zeros(length( nrofdevices), 3);% ������ ��� ������������ �����������

for index =1:length( nrofdevices) % ���� �� ����� ���������   
    nr=nrofdevices(index)% ����� ���������
    ft = zeros(nrofslots, nrofchannels);% ������ ��� �������� ����������� �� ��������� ������
                                        % � �� ��������� �������. �������
                                        % ��� ������������ ������ ����
    ft2 = zeros(nrofslots, nrofchannels);% ������ ��� �������� ����������� �� ��������� ������
                                        % � �� ��������� �������. �����
                                        % ���������� ��������� ���������,
                                        % ������� ����������� ������ ����
    colission = zeros(nr, nrofpackets);% ������ ��� �������� �������� 

    freq = randi([1 nrofchannels], [nr nrofpackets]);% ��������� ����� ��� ������� �������� ���������� 
    % ������ � ��������� [1 nrofchannels] ��� ������� �� nr ��������� �����
    % �������� nrofpackets ���. ����������� ������ freq � ������ � �������
    % i � ������ ������� ��������� ����� ��� ������ �����...� ������� �
    % ������� nrofpackets ��������� ����� ��� ��������� �����.
    time = randi([1 nrofslots - (packetduration*nrofpackets)/timeinterval], [nr 1]);% ��������� ����� ��� ������� �������� ���������� 
    % ���������� ����� � ��������� [1 nrofslots - (packetduration*nrofpackets)/timeinterval] ��� ������� �� nr ��������� �����
    % �������� 1 ���. ����������� ������ time � ������ � �������
    % i � ������ ������� ������������ ��������� ���� ��� i �������� (���
    % ��� ����� �������� ��� ���� ����� ���������, � ������� ������.
    for i = 1:nr % ������ �������� time � freq ��� ����������� ����������
        time_offset = time(i, 1); % ����� �������� ��� i ��������� ���������� 
        for p = 1:nrofpackets % ���� �� ������    
            for k = -1:1:1 % ������������ 3 ������ � ������ �������� � ������� �������� � � ������� 
                % �������� 
                if (freq(i, p)+k<1) | (freq(i, p)+k>nrofchannels)
                    continue % ���� ����� ����� �� �������, �� ������� � ��������� ������ 
                end
                for j = 1:packetduration/timeinterval % ��������� �� ������� �������� ������
                   %freq(i, 1)
                   if j+time_offset > nrofslots 
                       continue % ����� �� ������� timespan
                   end
                  
                   if  ft(j+time_offset, freq(i, p)+k) == 0 % ������ �������� ��������� ���� ��� �� �������������
                       ft(j+time_offset, freq(i, p)+k) = 1; % ������������� ������� ������������� ���������� ���������� �����
                                                            % � ������� 
                       ft2(j+time_offset,freq(i, p)+k) = i; % ��������, ��� ������ ���������� ��������� ���� ����������� 
                                                            % i �������� ���������
                   else % ������ �������� ��������� ���� ������������ �������� (?? ���� ����������� SINR)
                        ft(j+time_offset, freq(i, p)+k) = ft(j+time_offset, freq(i, p)+k) + 1; % ������������� ������� ������������� �����
                        colission(i, p) = 1; % ��������, ��� ��� i ��������� ��������� ��������
                        colission(ft2(j+time_offset,freq(i, p)+k), p) = 1; % � ���������� ������� �� �����
                        % ���������� � ���� ����� ���� ��������
                   end
                end % ����� �������� �� ��������� �����        
            end% ����� ����� �� �������� ��������� ���������� 
            time_offset = time_offset + packetduration/timeinterval;
        end % ����� ����� �� ������    
    end % ����� ����� �� ���������
    
    results(index, 1) = sum(sum(colission));
    fail = sum(colission, 2) == nrofpackets;% ��������� ����� ��������� � ������� ��� ����� ������ � ��������
    results(index, 2) = sum(fail);
    results(index, 3) = 1-sum(sum(fail))/nr;% ��������� PDR = 1 - (������ ��������� � ������� ��� ����� 
    % ������ � ���������)/����� ����� ���������)
    
    results(index, 1)
    results(index, 2)

end


%figure1 = figure();
plot(nrofdevices,results(:, 3),'-o');
hold on


