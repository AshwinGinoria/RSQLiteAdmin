# inporting Library
library (DBI)

# Loading Dummy Data
data(mtcars)

# Establishing Connection
con <- dbConnect (RSQLite::SQLite(), ":memory:")
dbListTables(con)

# Creating Table
dbWriteTable(con, "Dummy_Table", mtcars)

# Displaying Created Tables
dbListTables(con)

# Reading the Created Table
dbReadTable(con, "Dummy_Table")

# disconnecting
dbDisconnect(con)