rm -rf tmp
mkdir tmp
./waf --run=lorawan-example-tracing --command-template="%s --randomSeed=12354 --nEndDevices=100 --nGateways=1 --discRadius=6100.0 --totalTime=6000 --nRuns=1 --drCalcMethodIndex=2 --drCalcFixedDRIndex=1 --usPacketSize=21--usDataPeriod=600 --usConfirmedData=0 --dsDataGenerate=0 --verbose=0 --stdcout=0 --tracePhyTransmissions=1 --tracePhyStates=1 --traceMacPackets=1 --traceMacStates=1 --outputFileNamePrefix=tmp/d_100_fp_5"
python3 parse_phytx_trace.py tmp/*trace-phy-tx.csv


rm -rf tmp
mkdir tmp
./waf --run=lorawan-example-tracing --command-template="%s --randomSeed=12354 --nEndDevices=1000 --nGateways=1 --discRadius=6100.0 --totalTime=6000 --nRuns=1 --drCalcMethodIndex=2 --drCalcFixedDRIndex=1 --usPacketSize=21--usDataPeriod=600 --usConfirmedData=0 --dsDataGenerate=0 --verbose=0 --stdcout=0 --tracePhyTransmissions=1 --tracePhyStates=1 --traceMacPackets=1 --traceMacStates=1 --outputFileNamePrefix=tmp/d_50_fp_5"
python3 parse_phytx_trace.py tmp/*trace-phy-tx.csv
