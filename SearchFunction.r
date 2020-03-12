# Loading Library
library(DBI)

# Loading Database
con <- dbConnect (RSQLite::SQLite(), "Dummy_Data.db")

# Getting Table Names
tables <- dbListTables(con)

# This Function takes 3 Inputs
# table_name: the table on which the query is to be performed
# column_names: the list of columns on which the filter is to be performed
# values: the list of values each correspoding to column_names(the 2nd argument)
Query <- function (table_name, column_names, values) {
    
    string <- paste ('SELECT * FROM', table_name, 'WHERE')

    n <- length(column_names)

    if (n != 1)
        for (i in 1: (n - 1))
            string <- paste (string, column_names[i], "=", values[i], "AND")
    
    string <- paste (string, column_names[n], "=", values[n])
    
    ans <- dbGetQuery (con, string)
    
    return (ans)
}

# Examples
ans <- Query (tables[1], c('disp', 'wt'), c(160, 2.620))
print (ans)
ans <- Query (tables[1], c('disp'), c(160))
print (ans)
