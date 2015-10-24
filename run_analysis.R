#set the working directory
setwd("/Users/RB/DataScience/data/R33/UCIDataset/")

fitData <- function(dataName) {
  #Reading in feature list and all sets of data in the test directory 
  features <- read.table("features.txt", header = F, stringsAsFactors = F, na.strings="?")
  #create the filenames so the function can work with either train or test
  xtest <- paste(dataName,"/X_",dataName,".txt",sep="")
  xlabels <- paste(dataName,"/y_",dataName,".txt",sep="")
  subject <- paste(dataName,"/subject_",dataName,".txt",sep="")
  #create dataframes for each of the files
  xData <- read.table(xtest, header = F, stringsAsFactors = F, na.strings="?")
  xLabels <- read.csv(xlabels, header = F, stringsAsFactors = F, na.strings="?")
  xSubject <- read.csv(subject, header = F, stringsAsFactors = F, na.strings = "?")

  # rename the columns with the features set
  colnames(xData) <- features$V2

  #create a new column for activity type changing the number to the named activity
  xLabels$V1 <- ifelse(xLabels$V1 ==1, "WALKING",ifelse(xLabels$V1 ==2,"WALKING_UPSTAIRS",
                      ifelse(xLabels$V1 ==3, "WALKING_DOWNSTAIRS",ifelse(xLabels$V1 == 4,"SITTING",
                      ifelse(xLabels$V1 ==5, "STANDING","LAYING")))))                                                       
#add the activity & testSubject column to the test dataframe
  xDF <- cbind(xLabels,xData)
  colnames(xDF)[colnames(xDF) == 'V1' ] <- 'Activity'
  xDF <- cbind(xSubject,xDF)
  colnames(xDF)[colnames(xDF) == 'V1' ] <- 'Subject'
  return(xDF)
}

testDF <- fitData("test")
trainDF <- fitData("train")
combineDF <- rbind(trainDF,testDF)

#create new datafram with only the standard devitations and means
#grepl returns the logical value and only returns the columns where 
# TRUE  is returned
stdmeanDF <- combineDF[,grepl('std|mean',names(combineDF))]
names(stdmeanDF) <- gsub("-","",names(stdmeanDF))
names(stdmeanDF) <- gsub("\\(","",names(stdmeanDF))
names(stdmeanDF) <- gsub("\\)","",names(stdmeanDF))
head(stdmeanDF,5)

#created a dataset with the average of each variable for each activity 
# and each subject
library(plyr)
tidyset <- ddply(combineDF, c("Subject", "Activity"), colwise(mean))


