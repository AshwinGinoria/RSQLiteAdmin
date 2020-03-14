# Only Implemented Equality Type Search Functions Till Now

# Loading Library
require(DBI)

# This Function takes 4 Inputs
# SQLite Connection variable
# table_name: the table on which the query is to be performed
# column_names: the list of columns on which the filter is to be performed
# values: the list of values each correspoding to column_names(the 3rd argument)
Search <- function (con, table_name, column_names, values){

    string <- paste ('SELECT * FROM', table_name, 'WHERE')

    n <- length(column_names)

    if (n != 1)
        for (i in 1: (n - 1))
            string <- paste (string, column_names[i], "=", values[i], "AND")

    string <- paste (string, column_names[n], "=", values[n])

    ans <- dbGetQuery (con, string)

    return (ans)
}


# # Examples
# # Loading Database
# con <- dbConnect (RSQLite::SQLite(), "Dummy_Data.db")

# # Getting Table Names
# tables <- dbListTables(con)

# ans <- Query (con, tables[1], c('disp', 'wt'), c(160, 2.620))
# print (ans)
# ans <- Query (con, tables[1], c('disp'), c(160))
# print (ans)
