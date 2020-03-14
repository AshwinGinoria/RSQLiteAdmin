\name{SearchFunction}
\alias{SQLite}
\alias{Search}

\title{Search Query via RSQLite}

\description{
  This Function Searches the database for values given by the user and returns the result.It asks the user for the columns and their corresponding values and then performs an equality search query (like: "SELECT * FROM TABLE1 WHERE COLUMN1 = VALUE1") on the database Connection provided.
}

\usage{Search(conn, table_name, vector_column_names, vector_values)}

\arguments{
  \item{con}{Object of Class SQLiteConnection connected to the database in which the table is present}
  \item{table_names}{Name of the table on which the query is to be performed}
  \item{column_names}{vector of column names on which the conditions are to be applied}
  item{values}{vector of conditional values in the same order as column names}
}

\author{Ashwin Ginoria}

\examples{
con <- dbConnect (RSQLite::SQLite(), "mtcars.db")
tables <- dbListTables(con)
ans <- Search (con, tables[1], c('disp', 'wt'), c(160, 2.620))
}
