rm -rf tmp
mkdir tmp
./waf --run=lorawan-example-tracing_fix_distance --command-template="%s --randomSeed=12354 --nEndDevices=1 --nGateways=1 --discRadius=500.0 --totalTime=60000 --nRuns=1 --drCalcMethodIndex=2 --drCalcFixedDRIndex=5 --usPacketSize=21--usDataPeriod=600 --usConfirmedData=0 --dsDataGenerate=0 --verbose=0 --stdcout=0 --tracePhyTransmissions=1 --tracePhyStates=1 --traceMacPackets=1 --traceMacStates=1 --outputFileNamePrefix=tmp/d"
python3 parse_phytx_trace.py tmp/*trace-phy-tx.csv

rm -rf tmp
mkdir tmp
./waf --run=lorawan-example-tracing_fix_distance --command-template="%s --randomSeed=12354 --nEndDevices=1 --nGateways=1 --discRadius=1000.0 --totalTime=60000 --nRuns=1 --drCalcMethodIndex=2 --drCalcFixedDRIndex=5 --usPacketSize=21--usDataPeriod=600 --usConfirmedData=0 --dsDataGenerate=0 --verbose=0 --stdcout=0 --tracePhyTransmissions=1 --tracePhyStates=1 --traceMacPackets=1 --traceMacStates=1 --outputFileNamePrefix=tmp/d"
python3 parse_phytx_trace.py tmp/*trace-phy-tx.csv

rm -rf tmp
mkdir tmp
./waf --run=lorawan-example-tracing_fix_distance --command-template="%s --randomSeed=12354 --nEndDevices=1 --nGateways=1 --discRadius=1500.0 --totalTime=60000 --nRuns=1 --drCalcMethodIndex=2 --drCalcFixedDRIndex=5 --usPacketSize=21--usDataPeriod=600 --usConfirmedData=0 --dsDataGenerate=0 --verbose=0 --stdcout=0 --tracePhyTransmissions=1 --tracePhyStates=1 --traceMacPackets=1 --traceMacStates=1 --outputFileNamePrefix=tmp/d"
python3 parse_phytx_trace.py tmp/*trace-phy-tx.csv

rm -rf tmp
mkdir tmp
./waf --run=lorawan-example-tracing_fix_distance --command-template="%s --randomSeed=12354 --nEndDevices=1 --nGateways=1 --discRadius=2000.0 --totalTime=60000 --nRuns=1 --drCalcMethodIndex=2 --drCalcFixedDRIndex=5 --usPacketSize=21--usDataPeriod=600 --usConfirmedData=0 --dsDataGenerate=0 --verbose=0 --stdcout=0 --tracePhyTransmissions=1 --tracePhyStates=1 --traceMacPackets=1 --traceMacStates=1 --outputFileNamePrefix=tmp/d"
python3 parse_phytx_trace.py tmp/*trace-phy-tx.csv

rm -rf tmp
mkdir tmp
./waf --run=lorawan-example-tracing_fix_distance --command-template="%s --randomSeed=12354 --nEndDevices=1 --nGateways=1 --discRadius=2500.0 --totalTime=60000 --nRuns=1 --drCalcMethodIndex=2 --drCalcFixedDRIndex=5 --usPacketSize=21--usDataPeriod=600 --usConfirmedData=0 --dsDataGenerate=0 --verbose=0 --stdcout=0 --tracePhyTransmissions=1 --tracePhyStates=1 --traceMacPackets=1 --traceMacStates=1 --outputFileNamePrefix=tmp/d"
python3 parse_phytx_trace.py tmp/*trace-phy-tx.csv

rm -rf tmp
mkdir tmp
./waf --run=lorawan-example-tracing_fix_distance --command-template="%s --randomSeed=12354 --nEndDevices=1 --nGateways=1 --discRadius=3500.0 --totalTime=60000 --nRuns=1 --drCalcMethodIndex=2 --drCalcFixedDRIndex=5 --usPacketSize=21--usDataPeriod=600 --usConfirmedData=0 --dsDataGenerate=0 --verbose=0 --stdcout=0 --tracePhyTransmissions=1 --tracePhyStates=1 --traceMacPackets=1 --traceMacStates=1 --outputFileNamePrefix=tmp/d"
python3 parse_phytx_trace.py tmp/*trace-phy-tx.csv

rm -rf tmp
mkdir tmp
./waf --run=lorawan-example-tracing_fix_distance --command-template="%s --randomSeed=12354 --nEndDevices=1 --nGateways=1 --discRadius=4000.0 --totalTime=60000 --nRuns=1 --drCalcMethodIndex=2 --drCalcFixedDRIndex=5 --usPacketSize=21--usDataPeriod=600 --usConfirmedData=0 --dsDataGenerate=0 --verbose=0 --stdcout=0 --tracePhyTransmissions=1 --tracePhyStates=1 --traceMacPackets=1 --traceMacStates=1 --outputFileNamePrefix=tmp/d"
python3 parse_phytx_trace.py tmp/*trace-phy-tx.csv


