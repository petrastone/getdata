    # You should create one R script called run_analysis.R that does the following.
    # 
    # Merges the training and the test sets to create one data set.
    # Extracts only the measurements on the mean and standard deviation for each measurement.
    # Uses descriptive activity names to name the activities in the data set
    # Appropriately labels the data set with descriptive variable names.
    # From the data set in step 4, creates a second, independent tidy data set 
    # with the average of each variable for each activity and each subject.

    # Necessary packages
    require(rapportools)
    require(dplyr)
    
    # Values of the 561 Features (561 cols)
    data.train.features <- read.table('UCI HAR Dataset/train/X_train.txt')
    data.test.features <- read.table('UCI HAR Dataset/test/X_test.txt')
    dim(data.test.features)
    
    # Activity Ids for each row ( 1 col)
    data.train.activity <- read.csv('UCI HAR Dataset/train/y_train.txt', header = FALSE, sep = ' ')
    data.test.activity <- read.csv('UCI HAR Dataset/test/y_test.txt', header = FALSE, sep = ' ')
    dim(data.test.activity)
    
    # Subject Ids for each row ( 1 col)
    data.train.subject <- read.csv('UCI HAR Dataset/train/subject_train.txt',header = FALSE, sep = ' ')
    data.test.subject <- read.csv('UCI HAR Dataset/test/subject_test.txt',header = FALSE, sep = ' ')
    dim(data.test.subject)
    
    # Merge the 3 tables
    data.train <-  data.frame(data.train.subject, data.train.activity, data.train.features)
    data.test <-  data.frame(data.test.subject, data.test.activity, data.test.features)
    
    data <- rbind(data.train, data.test)
    str( data )
    
    features <- read.csv('UCI HAR Dataset/features.txt', header = FALSE, sep=" ", stringsAsFactors = F)
    nrow(features)
    
    # are the names unique?
    length(features$V2)
    length( unique(features$V2) )
    table(features$V2)
    # make.names( features$V2, unique=T )
    
    names( data ) <- c("subject","activity",  features$V2  )
    names( data ) <- c("subject","activity", make.names( features$V2, unique=T ) )
    names( data )
    
    # Store the full dataset
    dataOrig <- data
    
    # We should expect 33 values for mean and 33 for std dev seeing as there were 33 original variables
    # from which mean and standard dev were calculated
    data <- subset( data, select=grepl("mean\\.\\.|std\\.\\.|activity|subject", names(data), ignore.case = T) )
    data <- subset( data, select=grepl("^(tBody|fBody|tGravity|subject|activity)", names(data), ignore.case = T) )
    names( data )
    dim(dataOrig)
    dim(data)
    
    # Give Descriptive Names to the Activity Variable
    activityLabels <- read.csv('UCI HAR Dataset/activity_labels.txt', header = FALSE, sep=" ", stringsAsFactors = F)
    
    # You'll lay an egg if you don't lie down
    # http://web.ku.edu/~edit/lie.html
    # lie means to recline, whereas lay means to place something, to put something on something.
    # I am assuming "LAYING" here means "LYING DOWN" rather than laying something down?
    
    orig <- data$activity
    data$activity <- factor( data$activity, levels=activityLabels$V1, labels=c("Walking","Walking Upstairs","Walking Downstairs","Sitting","Standing","Lying Down"))
    # Sanity check this is mapping the right factors
    table ( data.frame(orig, data$activity) )
    
    
    # Appropriately labels the data set with descriptive variable names.
    names( data )
    
    # Principles of Tidy Data - JEFF LEEK
    ## Variable Names
    # all lowercase
    # descriptive
    # unique
    # no underscores/dots/spaces
    
    # Nicer Naming Convention
    data2 <- data
    names( data2 )
    
    # replace multiple dots with single dot
    names( data2 ) <- gsub("\\.{2,}", ".", names(data))
    names( data2 )
    # remove trailing dots
    names( data2 ) <- gsub("(.*)(\\.)$", "\\1", names(data2))
    # remove duplicate Body
    names( data2 ) <- gsub("bodybody", "Body", names(data2), ignore.case = T)
    # rename acc and mag
    names( data2 ) <- gsub("Acc", "Accel", names(data2))
    names( data2 ) <- gsub("Mag", "Magtd", names(data2) )
    # replace tBody with simpler Body
    names( data2 ) <- gsub("tBody|TBody", "Body", names(data2) )
    names( data2 ) <- gsub("tGravity|TGravity", "Gravity", names(data2) )
    # fast fourier transforms
    names( data2 ) <- gsub("^(fBody)(.*)", "fftBody\\2", names(data2) )
    # move FFT to end to allow comparison of FFTs and original measurements
    names( data2 ) <- gsub("^(fft)(.*)", "\\2FFT", names(data2) )

    data.frame( 
        oldNames=names(data),
        newNames= names(data2),
        newNamesCamel = tocamel( names(data2), upper=T )
    )
    
    # convert to camelCase
    names( data2 ) <- tocamel( names(data2), upper=T )
    names( data2 ) 
    
    # are they unique?
    length(names(data2))
    length( unique(names(data2)) )
    
    # From the data set in step 4, creates a second, independent tidy data 
    # set with the average of each variable for each activity and each subject.
    
    tidyData <- data2 %>%
        group_by(Subject, Activity) %>%
        summarise_each( funs(mean) )
    names(tidyData)[3:length(tidyData)] <- paste0( "MeanOf",names(tidyData)[3:length(tidyData)])    
        
    head( tidyData )
    names( tidyData)
    
    # Write out .txt file
    write.table(tidyData, "tidyData.txt", row.names = F)
    
    # Check the output can be read back in OK
    tidyDataCheck <- read.table("tidyData.txt", header=T)
    str(tidyDataCheck)
    