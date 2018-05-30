%CF=7 CR=1 
alfa=-30.2580;
beta=0.2857;
SNRdB=-12:0.1:-8;
BER=10.^(alfa*exp(beta*SNRdB))
semilogy(SNRdB,BER,'b')
grid on
hold on
%CF=8 CR=1 
alfa=-77.1002;
beta=0.2993;
BER=10.^(alfa*exp(beta*SNRdB))
semilogy(SNRdB,BER,'r')