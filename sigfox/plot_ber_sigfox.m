
SNRdB=-1:0.1:11;
SNR=10.^(SNRdB/10);
BER=0.5*erfc(sqrt(SNR))

semilogy(SNRdB,BER,'r')
grid ON
