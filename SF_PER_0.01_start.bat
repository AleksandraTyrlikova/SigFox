rm -rf tmp
mkdir tmp
./waf --run=lorawan-example-tracing --command-template="%s --randomSeed=12354 --nEndDevices=100 --nGateways=1 --discRadius=6100.0 --totalTime=6000 --nRuns=1 --drCalcPerLimit=0.01 --drCalcMethodIndex=1 --drCalcFixedDRIndex=0 --usPacketSize=21--usDataPeriod=600 --usConfirmedData=0 --dsDataGenerate=0 --verbose=0 --stdcout=0 --tracePhyTransmissions=1 --tracePhyStates=1 --traceMacPackets=1 --traceMacStates=1 --outputFileNamePrefix=tmp/d"
python3 parse_phytx_trace.py tmp/*trace-phy-tx.csv

rm -rf tmp
mkdir tmp
./waf --run=lorawan-example-tracing --command-template="%s --randomSeed=12354 --nEndDevices=500 --nGateways=1 --discRadius=6100.0 --totalTime=6000 --nRuns=1 --drCalcPerLimit=0.01 --drCalcMethodIndex=1 --drCalcFixedDRIndex=0 --usPacketSize=21--usDataPeriod=600 --usConfirmedData=0 --dsDataGenerate=0 --verbose=0 --stdcout=0 --tracePhyTransmissions=1 --tracePhyStates=1 --traceMacPackets=1 --traceMacStates=1 --outputFileNamePrefix=tmp/d"
python3 parse_phytx_trace.py tmp/*trace-phy-tx.csv


rm -rf tmp
mkdir tmp
./waf --run=lorawan-example-tracing --command-template="%s --randomSeed=12354 --nEndDevices=1000 --nGateways=1 --discRadius=6100.0 --totalTime=6000 --nRuns=1 --drCalcPerLimit=0.01 --drCalcMethodIndex=1 --drCalcFixedDRIndex=0 --usPacketSize=21--usDataPeriod=600 --usConfirmedData=0 --dsDataGenerate=0 --verbose=0 --stdcout=0 --tracePhyTransmissions=1 --tracePhyStates=1 --traceMacPackets=1 --traceMacStates=1 --outputFileNamePrefix=tmp/d"
python3 parse_phytx_trace.py tmp/*trace-phy-tx.csv

rm -rf tmp
mkdir tmp
./waf --run=lorawan-example-tracing --command-template="%s --randomSeed=12354 --nEndDevices=5000 --nGateways=1 --discRadius=6100.0 --totalTime=6000 --nRuns=1 --drCalcPerLimit=0.01 --drCalcMethodIndex=1 --drCalcFixedDRIndex=0 --usPacketSize=21--usDataPeriod=600 --usConfirmedData=0 --dsDataGenerate=0 --verbose=0 --stdcout=0 --tracePhyTransmissions=1 --tracePhyStates=1 --traceMacPackets=1 --traceMacStates=1 --outputFileNamePrefix=tmp/d"
python3 parse_phytx_trace.py tmp/*trace-phy-tx.csv

rm -rf tmp
mkdir tmp
./waf --run=lorawan-example-tracing --command-template="%s --randomSeed=12354 --nEndDevices=10000 --nGateways=1 --discRadius=6100.0 --totalTime=6000 --nRuns=1 --drCalcPerLimit=0.01 --drCalcMethodIndex=1 --drCalcFixedDRIndex=0 --usPacketSize=21--usDataPeriod=600 --usConfirmedData=0 --dsDataGenerate=0 --verbose=0 --stdcout=0 --tracePhyTransmissions=1 --tracePhyStates=1 --traceMacPackets=1 --traceMacStates=1 --outputFileNamePrefix=tmp/d"
python3 parse_phytx_trace.py tmp/*trace-phy-tx.csv
