## Course Project for Getting and Cleaning Data
## Assumption for use this script:
##      1. The working directory has already set to the folder which contains relevant data files
        
        ## Load library used in this script
        library(plyr)
        library(dplyr)

        ## Read data files for the activity labels and measurment features with descriptive name
        activity_labels <- read.table("activity_labels.txt")
        features <- read.table("features.txt")
        
        ## Merges the training and the test sets
        X <- rbind(read.table("./train/X_train.txt"), read.table("./test/X_test.txt"))
        y <- rbind(read.table("./train/y_train.txt"), read.table("./test/y_test.txt"))
        subject <- rbind(read.table("./train/subject_train.txt"), read.table("./test/subject_test.txt"))
        
        ## Create dataframe with one column contains descriptive name of activity
        activity <- join(y, activity_labels, by = "V1") %>% transmute(activity = V2)
        
        ## Give descriptive name for the header of dataframe 'subject'
        names(subject) <- "subject"
        
        ## Give descriptive names for the header of dataframe X
        names(X) <- features[, 2]
        
        ## Extracts only the measurements on the mean and standard devication for each measurement
        ## Select the column in the data_set which column name contains 'mean()' or 'std()'
        X <- X[, grep(".+(mean\\(\\)|std\\(\\)).*", names(X), invert = FALSE)]
        
        ## Add subject and activity information for each observations
        ## Merge activity, subject and X into one big data set
        ## Generate second, independent tidy data set with the average of each variable for each 
        ## activity and each subject
        data_set <- cbind(subject, activity, X) %>%
                    group_by(subject, activity) %>%
                    summarise_all(mean)
        
        ## Write the data_set into the file named as 'data_set.csv'
        write.table(data_set, file ="data_set.txt", row.names = FALSE)

        
        