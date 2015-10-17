# How does `run_analysis.R` work?

The script requires two packages in addition to the base R packages: `dplyr` and `reshape2`.

The script is divided into independent functions that undertake one objective each:

* `loadData` : Reads:
  - `activity_labels.txt`, 
  - `features.txt`,
  - `X_test.txt`, `X_train.txt` with `col.names = features`
  - `subject_test.txt`, `subject_train.txt` with `col.names = 'Subject.ID'`
  - `y_test.txt`, `y_train.txt` with `col.names = 'Activity.ID'`

* `extractSelectedColumns` :
  - Picks out the columns of `X_test` and `X_train` with column names containing the words `mean` or `std`,
  - Reassigns those columns back to `X_test` and `X_train` respectively.

* `assembleChiefTables` :
  - Binds 'Activity Labels' to 'Activity IDs' and reassigns to `y_test`,
    then binds `y_test` and `X_test` to 'Subject IDs' to complete table for 'test' data.
  - Repeats the same for 'train' data.

* `mergeTables` :
  - Binds the 'test' and 'train' data together into one  dataframe.

* `tidyData` :
  - Melts the merged data with `c('Subject.ID', 'Activity.ID', 'Activity.Label')` for unique ID combinations.
  - Applies `dcast` to the molten data to get 'mean' values for the multiple measures of 'mean' and 'std'
    variables for each subject's each activity. The resulting dataframe is in 'wide format'.
  - Reshapes the 'wide format' data into 'long format' and writes it out into `TidyData_Long_Format.txt`.

* `run_analysis` :
  - Calls the above functions in a specific order to analyse the data.


The `run_analysis()` function call at the end initiates the script so that it runs on 'source'.


