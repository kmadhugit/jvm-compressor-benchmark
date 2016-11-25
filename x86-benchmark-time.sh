#!/bin/sh
 
echo "About to run Compress test for LZF impls on Calgary corpus files"


RUNTIME=10

# -Djapex.runIterations=300 \
# -Djapex.warmupIterations=10 \
# -Djapex.warmupTime=5 \

java -server -cp lib/japex/\* \
 -Xmx20480M \
 -Djava.awt.headless=true \
 -Djapex.runsPerDriver=1 \
 -Djapex.numberOfThreads=160 \
 -Djapex.reportsDirectory=reports/x86-compress \
 -Djapex.plotGroupSize=9 \
 -Djapex.inputDir="testdata/calgary" \
 -Djapex.warmupIterations=10 \
 -Djapex.runTime=$RUNTIME \
 com.sun.japex.Japex \
 cfg/x86-compress.xml

java -server -cp lib/japex/\* \
 -Xmx20480M \
 -Djava.awt.headless=true \
 -Djapex.runsPerDriver=1 \
 -Djapex.numberOfThreads=160 \
 -Djapex.reportsDirectory=reports/x86-decompress \
 -Djapex.plotGroupSize=9 \
 -Djapex.inputDir="testdata/calgary" \
 -Djapex.warmupIterations=10 \
 -Djapex.runTime=$RUNTIME \
 com.sun.japex.Japex \
 cfg/x86-decompress.xml

echo "Done!";

