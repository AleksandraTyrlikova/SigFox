clear all
timespan = 600*1000; % �������� ����� ����������� ��������� � ms 
packetduration = 1840;% ������������ ������ � ������������ (23 ����� = 1840 ms)
freqspan = 125*1000; % ������ ��� SigFox � ������ 125khz
freqinterval = 100; % ���� ������ � SigFox hz
nrofpackets = 3;
nrofdevices =[100 500 1000 5000 10000]% ������ ��� ��������� ���������
bound=1-(1-exp(-4.*nrofpackets*nrofdevices*2*freqinterval*packetduration/ (timespan *freqspan))).^nrofpackets;
plot(nrofdevices,bound,'-*');
bound