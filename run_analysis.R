library(stringr)

##read feature file and get only mean and std features

feature=read.table("UCI_HAR_Dataset//features.txt")
feature[1,]

feature_mean_sd=feature[str_detect(feature$V2,"-mean\\(\\)") | str_detect(feature$V2,"std\\(\\)"),]
feature_list=feature_mean_sd[,"V1"]
f_name=feature_mean_sd[,"V2"]

########read test files and handle it
##read test file
test=read.table("UCI_HAR_Dataset/test/X_test.txt")
test[1,]

##extract only mean and std features
test2=test[,feature_list]
names(test2)=f_name

##read test activity and combine it with test file
test_act=read.table("UCI_HAR_Dataset/test/y_test.txt")

test3 = cbind(test2,test_act)
names(test3)[67]="activity"
test3[1,]

##read test subject and combine it with test file
test_sub=read.table("UCI_HAR_Dataset/test/subject_test.txt")

test4 = cbind(test3,test_sub)
names(test4)[68]="subject"
test4[1,]

########read tain files and handle it
##read train file
train=read.table("UCI_HAR_Dataset/train/X_train.txt")
train[1,]

##extract only mean and std features
train2=train[,feature_list]
names(train2)=f_name

##read train activity and combine it with train file
train_act=read.table("UCI_HAR_Dataset/train/y_train.txt")

train3 = cbind(train2,train_act)
names(train3)[67]="activity"
train3[1,]

##read train subject and combine it with train file
train_sub=read.table("UCI_HAR_Dataset/train/subject_train.txt")

train4 = cbind(train3,train_sub)
names(train4)[68]="subject"
train4[1,]

##combine test and train
comb=rbind(test4,train4)

## get average of each variable for each activity and each subject
melt = melt(comb, id=c("activity","subject"),measure.vars=f_name)

final = dcast(melt, activity + subject ~ variable, mean)  

## write to a file
write.table(final, file="final_tidy.txt",row.name=FALSE)





