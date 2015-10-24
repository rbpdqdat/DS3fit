#Data Science - Getting and Cleaning Data Project
##Goal is to merge multiple datasets and create a merged dataset and then a set with averages for each activity and subject.

#data sets

>features.txt
>features_info
test: >subject_test.txt >X_test.txt >y_test.txt
train: >subject_test.txt >X_test.txt >y_test.txt

###subject_test.txt
Test subject denoted by a number
###X_test.txt
columns of results based on the type of test
###y_test.txt
type of activity being performed by the subject
###features.txt
The name of the specific sensor data type (feature list use as column_names of the X_test)
###README.txt
Describes in more detail the data and also provides a list of what activity is associated with what number

#Work performed by 'run_analysis.R' script
A function was created to read in the above datasets.  
1) The features DF was used as the colnames of the xDAta dataframe.  
2) The activity labels were read in and then transformed into the written activity type.
3) The xLabels (activty) dataframe was merged to the xData dataframe via cbind.  
4) The subject list dataframe was added via cbind as well.  

The function was called using 'test' string to perform the work on the test dataset
Then the function was called using 'train' string to perform the work on the train dataset

####Merging 'test' and 'train' datasets
The two dataframes were merged into one data set

The columns containing 'Subject','Activity','mean', or 'std' put into an new dataframe
A new tidyset was created with the average of each of the above columns by categories of Subject and Activity

### References

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

[2] http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

