library(dplyr)
metadata <- read.csv('dataAnalysis/readsAbundance.csv') #read readsabundance into metadata
str(metadata) #summary of metadata
library(ggplot2) #import
ggplot(metadata) + #this plots the ratios reads mapped to total reads
  geom_point(aes(x = sample, y = readsMappedToSample/totalReads)) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

sortedMetadata <- arrange(metadata, sample) #makes a new dataframe based on the alphabetatized sample column

sortedMetadata #prints dataframe

metadataSampleSummary <- read.csv('dataAnalysis/sampleSummary.csv') #reads sampleSummary into r file

metadataSampleSummary #prints data frame

sortedMetadataSampleSummary <- arrange(metadataSampleSummary, sample) #makes a new sorted dataframe based upon the alphabetized sample column

sortedMetadataSampleSummary #prints dataframe

compiledData <- merge(sortedMetadata[, 2:4], sortedMetadataSampleSummary[, c("sample", "month")]) #compiles data needed into a data frame

compiledData #prints the dataframe

compiledDataByMonth <- arrange(compiledData, month) #creates a new datafram in which the data is sorted by the month in which it was collected

compiledDataByMonth #prints the dataframe

ggplot(compiledDataByMonth) +  #gives a scatter plot of the ratio based upon what month it was sampled in
  geom_point(aes(x = month, y = readsMappedToSample/totalReads)) +
  theme(axis.text.x = element_text(angle = 0, hjust = 0.5))
