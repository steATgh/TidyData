run_analysis <- function (){
  
  ## read data
  dataTest <- data.frame(read.table("./test/X_test.txt"))
  dataTestY <-data.frame(read.table("./test/Y_test.txt"))

  dataTrain <- data.frame(read.table("./train/X_train.txt"))
  dataTrainY <-data.frame(read.table("./train/Y_train.txt"))
  
  dataFeatures <- read.table("features.txt")
  dataFeatures <- c("activity",as.character(dataFeatures[,2]))
  
  dataTest <- cbind(dataTestY, dataTest)
  dataTrain <- cbind(dataTrainY, dataTrain)
  
  ## Merging of the training and the test sets, resulting in one joined data set
  data <- rbind(dataTest,dataTrain)

  ## name variables
  colnames(data)<-as.character(dataFeatures)

  ## filter all columns, which are not mean and std. 
  filter <- dataFeatures[c(1,grep("mean()", dataFeatures),grep("std()", dataFeatures))]
  data <- data[,filter]
  
  ## relable activities
  dataLabels <- data.frame(read.table("activity_labels.txt"))
  dataLabels <-dataLabels[[2]]
  c<-as.character(1:length(data[["activity"]]))
  for (r in 1:length(data[["activity"]])){c[r] <- as.character(dataLabels[data[r,"activity"]])}
  data[["activity"]] <- c
  
  ## calculate mean for each variable for each activity
  tidyData<-matrix(nrow=length(dataLabels), ncol=ncol(data))
  for (a in 1:length(dataLabels)){
    tidyData[a,1] <- as.character(dataLabels[a])
    for (c in 2:ncol(data)){
      tidyData[a,c]<-mean(data[data[["activity"]] == dataLabels[a],c])
    }
  }
  ## name columns 
  colnames(tidyData)<-as.character(names(data))
  
  ## save tidy data set
  write.table(tidyData, file="tidyData.txt")
  
}