The original data was transformed in the following manner:
- content of the tables "./test/X_test.txt" and "./test/Y_test.txt" are joined horizontally, the same is done to the tables "./test/X_train.txt" and "./test/Y_train.txt"
- the resulting two tables are merged into one joined table 
- the Column names, derived from the table "features.txt", where assigned to the joined table. Column #1 is labeled "activities"
- all Columns, which do not contain the terms "mean()" and "std()" are removed from the joined table; exception: column #1 "activities" remains in the resulting table
- the numbers in column #1 are replaced be the activity names, provided by table "features.txt"
- the mean for each column is calculated for each unique activity in column #1 is calculated
- the resulting tidy data table is saved as "tidyData.txt"

