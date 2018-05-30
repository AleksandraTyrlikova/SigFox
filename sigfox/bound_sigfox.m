clear all
timespan = 600*1000; % интервал между появлениями сообщений в ms 
packetduration = 1840;% длительность пакета в милисекундах (23 байта = 1840 ms)
freqspan = 125*1000; % полоса для SigFox в герцах 125khz
freqinterval = 100; % одна полоса в SigFox hz
nrofpackets = 3;
nrofdevices =[100 500 1000 5000 10000]% массив для количесва устройств
bound=1-(1-exp(-4.*nrofpackets*nrofdevices*2*freqinterval*packetduration/ (timespan *freqspan))).^nrofpackets;
plot(nrofdevices,bound,'-*');
bound