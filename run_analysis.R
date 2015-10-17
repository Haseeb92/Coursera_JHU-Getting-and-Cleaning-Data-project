# Load required packages
library(dplyr)
library(reshape2)



# Loads required data and assigns column names
loadData <- function() {

    activity_labels <<- read.table('./UCI HAR Dataset/activity_labels.txt')[,2]
    names(activity_labels) <- 'Activity.Label'
    features <<- read.table('./UCI HAR Dataset/features.txt')[,2]
    
    X_test <<- read.table('./UCI HAR Dataset/test/X_test.txt', 
                          col.names = features)
    subject_test <<- read.table('./UCI HAR Dataset/test/subject_test.txt',
                               col.names = 'Subject.ID')
    y_test <<- read.table('./UCI HAR Dataset/test/y_test.txt', 
                         col.names = 'Activity.ID')
    
    X_train <<- read.table('./UCI HAR Dataset/train/X_train.txt',
                           col.names = features)
    subject_train <<- read.table('./UCI HAR Dataset/train/subject_train.txt',
                                 col.names = 'Subject.ID')
    y_train <<- read.table('./UCI HAR Dataset/train/y_train.txt',
                           col.names = 'Activity.ID')
}


# Selects columns on means and standard deviation of the measurements
extractSelectedColumns <- function() {
  
  extract_features <- grep('mean|std', features, ignore.case = T)
  X_test <<- select(X_test, extract_features)
  X_train <<- select(X_train, extract_features)
}


# Assembles independent tables of X_test and X_train by attaching 
# respective Subject IDs, Activity IDs and Activity names to measurement
# tables.
assembleChiefTables <- function() {
  
    y_test <<- cbind(y_test, 
                     'Activity.Label' = activity_labels[y_test$Activity.ID])
    X_test <<- cbind(subject_test, y_test, X_test)
    
    y_train <<- cbind(y_train, 
                     'Activity.Label' = activity_labels[y_train$Activity.ID])
    X_train <<- cbind(subject_train, y_train, X_train)
}


# Merges the independent X_test and X_train tables into a single data frame
mergeTables <- function() {
  
    mergedData <<- rbind(X_test, X_train)
}


# Reshapes the data to get means for each variable of each subject, activity
# combination. It then further reshapes the data into a long data format.
# It writes the final long data table to a text file.
tidyData <- function() {
  
    id_labels <- c('Subject.ID', 'Activity.ID', 'Activity.Label')
    data_labels <- setdiff(colnames(mergedData), id_labels)
    
    meltData <- melt(mergedData, id_labels)
    tidy_data_wide <-dcast(meltData, 
                       Subject.ID + Activity.ID + Activity.Label ~ variable, mean)
    
    tidy_data_long <- reshape(tidy_data_wide, varying = data_labels, 
                               v.names = 'Mean.Value', timevar = 'Variable.Name',
                               times = data_labels, direction = 'long', 
                               idvar = c('Subject.ID', 'Activity.ID'))
    
    write.table(tidy_data_long, file = './TidyData_Long_Format.txt', row.names = F)
}


# Runs the independent functions to analyse the data
run_analysis <- function() {
    
    loadData()
    extractSelectedColumns()
    assembleChiefTables()
    mergeTables()
    tidyData()
}
# Runs the main function 'run_analysis'
run_analysis()