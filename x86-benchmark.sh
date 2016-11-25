#!/bin/sh
 
echo "About to run Compress test for LZF impls on Calgary corpus files"

# -Djapex.warmupTime=1 \
# -Djapex.runTime=30 \
RUNITER=50
java -server -cp lib/japex/\* \
 -Xmx20480M \
 -Djava.awt.headless=true \
 -Djapex.runsPerDriver=1 \
 -Djapex.numberOfThreads=160 \
 -Djapex.reportsDirectory=reports/x86-compress \
 -Djapex.plotGroupSize=9 \
 -Djapex.inputDir="testdata/calgary" \
 -Djapex.runIterations=$RUNITER \
 -Djapex.warmupIterations=10 \
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
 -Djapex.runIterations=$RUNITER \
 -Djapex.warmupIterations=10 \
 com.sun.japex.Japex \
 cfg/x86-decompress.xml

echo "Done!";

