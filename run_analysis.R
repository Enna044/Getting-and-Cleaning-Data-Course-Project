##Getting and Cleaning Data Course Project

### 1. Download and open files
url1<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if (!file.exists("data.zip")){
  download.file(url1,"data.zip")}
if (!file.exists("UCI HAR Dataset")){
  unzip("data.zip")}

## 2. Read the files on UCI HAR Dataset
act_lab<-read.table("./UCI HAR Dataset/activity_labels.txt")
feat<-read.table("./UCI HAR Dataset/features.txt")
sub_tr<-read.table("./UCI HAR Dataset/train/subject_train.txt")
xtrain<-read.table("./UCI HAR Dataset/train/x_train.txt")
ytrain<-read.table("./UCI HAR Dataset/train/y_train.txt")
sub_te<-read.table("./UCI HAR Dataset/test/subject_test.txt")
xtest<-read.table("./UCI HAR Dataset/test/x_test.txt")
ytest<-read.table("./UCI HAR Dataset/test/y_test.txt")

## 3. Merge the 6 files, to make just 2 tables, and remove the datasets
train<-cbind(sub_tr, ytrain, xtrain)
test<-cbind(sub_te, ytest, xtest)
data<-rbind(train,test)
rm(sub_tr,ytrain,xtrain,sub_te,ytest,xtest,train,test)
colnom<-as.character(feat[,2])
colnames(data)<-c("Subject", "Y", colnom)

## 4. Filter the data database to have only those names with mean() and std(), excluding meanFreq()
feat_ms<-feat[grep(".*mean.*|.*std.*",feat[,2]),2]
feat_ms_n<-feat_ms[!grepl("Freq", feat_ms)]
feat_ms_n<-as.character(feat_ms_n)
colnom2<-c("Subject","Y",feat_ms_n)
data_n<-data[,colnom2]
rm(data,feat_ms)

## 5. Rename activities
data_n$Activity<-act_lab[match(data_n$Y, act_lab$V1),2]
data_n[2]<-NULL
data_n<-data_n[c(1,68,2:67)]

## 6. Calculate the mean for each subject and activity, saving it on a matrix
dmean<-matrix(,180,68)
for (i in 1:30){
    sub<-subset(data_n, Subject==i)
    for (j in 1:6){
        act=levels(droplevels(act_lab[j,2]))
        act2<-subset(sub,Activity==act,select = c(3:68))
        mean<-as.vector(apply(act2,2,mean))
        mean<-c(i,act,mean)
        dmean[6*(i-1)+j,]<-c(mean)
    }
}

## 7. Convert the matrix to a dataframe and change the column names. Then transform it to txt
dmean<-data.frame(dmean)
colnames(dmean)<-c(colnom2)
write.table(dmean, "Samsung_TidyData.txt", sep = "")
write.table(data_n, "base_limp.txt", sep = "")
