clear all
nrofdevices =[100 500 1000 5000 10000];% ������ ��� ��������� ���������
PDR_lora=[0.9015    0.7760    0.6926    0.4183    0.2970];
%PDR_sigfox=[1.0000    1.0000    1.0000    0.9750    0.8630];
PDR_sigfox=[1.0000    1.0000    0.9960    0.7798    0.3901];


plot( nrofdevices, PDR_lora,'-+',nrofdevices,PDR_sigfox,'-*')
%+ ���A - c ����� ������ ���������������� per 0.01
%* ��� SiGFOX





