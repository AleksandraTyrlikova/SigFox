clear all
lambda=1/600;
alfa=1.;
t=[70.91 127.49 226.30 452.61 905.22 1810.43]/1000; % ������������ ������� d ��������
nrofdevices =[100 500 1000 5000 10000]% ������ ��� ��������� ���������
for index=1:length(nrofdevices)
    n=nrofdevices(index);
    n_t=1./t/sum(1./t)*n; % ����������� ��������� �� �������
    baund_pdr(index)=sum(n_t/n.*exp(-alfa*n_t.*lambda.*t));
end
plot( nrofdevices,  baund_pdr,'-+')
baund_pdr