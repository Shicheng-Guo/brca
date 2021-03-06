BiocManager::install("methVisual")
library("methVisual")
library(methVisual)
library(Biostrings)
library(gridBase) 
library(ca)
library(sqldf)
library(plotrix)
ps.options(pointsize=12)
options(width=60)
library(methVisual)  
dir.create("//mcrfnas2/bigdata/Genetic/Projects/shg047/methylation/brca/19B0731C_MethylTarget/sortbam/BiqAnalyzer/")
setwd("//mcrfnas2/bigdata/Genetic/Projects/shg047/methylation/brca/19B0731C_MethylTarget/sortbam/BiqAnalyzer/")
makeLocalExpDir(dataPath="/examples/BiqAnalyzer",localDir="//mcrfnas2/bigdata/Genetic/Projects/shg047/methylation/brca/19B0731C_MethylTarget/sortbam/BiqAnalyzer/")
methData <-MethDataInput("PathFileTab.txt")
methData
refseq <- selectRefSeq("Master_Sequence.txt")
QCdata <- MethylQC(refseq, methData,makeChange=TRUE,identity=80,conversion=90)
QCdata
methData <- MethAlignNW( refseq , QCdata)
methData
plotAbsMethyl(methData,real=TRUE)
MethLollipops(methData)
Cooccurrence(methData,file="Cooccurrence.pdf")
summery <- matrixSNP(methData)
plotMatrixSNP(summery,methData)
methFisherTest(methData, c(2,3,5), c(1,4,6))
methWhitneyUTest(methData, c(2,3,5), c(1,4,6))
heatMapMeth(methData)
methCA(methData)

