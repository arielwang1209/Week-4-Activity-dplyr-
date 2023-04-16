#Week 4: dplyr package

#Task: Write the function to get a dataset from Base R: Titanic
#and give the dataframe a new name of your choice
#(hint: you will want your data to be a dataframe. Use the function: as.data.frame(Titanic))
mydft<-as.data.frame(Titanic)

#See the top rows of the data
#TASK: Write the function to see the top rows of the data
head(mydft)

#Install and call the package dplyr
#TASK: Write the functions to install and call dplyr
install.packages("tidyverse")
library("dplyr")

#Let's just see the Survived and Sex columns
#Task: Write the function to 'select' the Survived and Sex columns 
#(hint: use the 'select' function)
mydft %>% select(Survived,Sex)

#Let's name the dataset with just the two columns, Survived and Sex
#TASK: Write the function to save the two columns as one new dataset
#and give it a name
mydftss <- mydft %>% select(Survived,Sex)

#Let's get rid of the Sex column in the new dataset created above
#TASK: Write the function that deselects the sex column
#(hint: use the 'select' function to not select a -column)

mydftss %>% select(Survived)

#Let's rename a column name
#TASK: Write the function that renames 'Sex' to 'Gender'
rename(mydftss,Gender = Sex)

#Let's make a new dataframe with the new column name
#TASK: Write the function that names a new dataset that includes the 'gender' column
names(mydftss)
mydftsg <- mydftss %>% select(Survived,'Gender' ='Sex' )

#Let's 'filter' just the males from our dataset
#TASK: Write the function that includes only rows that are 'male'
mydfmale <- filter(mydft,Sex == 'Male',TRUE)

#Let's 'arrange' our data by gender (not the data you just filtered)
#TASK: Write the function to group the data by gender (hint: arrange())
arrange(mydftsg,Gender)

#Let's see how many people were examined in the dataset (total the frequency in the original dataframe)
#TASK: Sum the Freq column
colSums(mydft[sapply(mydft,is.numeric)])
#TASK: After you run it, write the total here:_2201___

#Since we have a males dataset, let's make a females dataset
#TASK: Write the function that includes only rows that are 'female'
mydffemale <-filter(mydft,Sex == 'Female',TRUE)

#And now let's join the males and females
#TASK: Write the function that joins the male and female rows 
#(hint: try using 'union' or 'bind_rows')

union(mydfmale,mydffemale)
bind_rows(mydffemale,mydfmale)

#Optional Task: add any of the other functions 
#you learned about from the dplyr package

#Arrange sequence for the data 
arrange(mydft)

summarise(mydft)
