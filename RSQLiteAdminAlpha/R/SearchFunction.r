# Only Implemented Equality Type Search Functions Till Now

#' Search via RSQLite (equality).
#'
#' This Function Searches the database for values given by the user and returns
#' the result.It asks the user for the columns and their corresponding values
#' and then performs an equality search query (like: "SELECT * FROM TABLE1 WHERE
#' COLUMN1 = VALUE1") on the database Connection provided.
#'
#' @param conn Object of Class SQLiteConnection connected to the database in
#'   which the table is present.
#' @param table_name String.
#' @param column_names Vector of column names on which the conditions are to be
#'   applied.
#' @param values Vector of conditional values in the same order as column_names.
#' @return Result of the search query in a dataframe format.
#' @examples
#' \code{
#' conn <- dbConnect (RSQLite::SQLite(), "mtcars.db")
#' tables <- dbListTables(conn)
#' ans <- Search(conn, tables[1], c('disp', 'wt'), c(160, 2.620))
#' }
#'
#' @export
#' @importFrom DBI dbGetQuery
#'
Search <- function(conn, table_name, column_names, values) {

    string <- paste('SELECT * FROM', table_name, 'WHERE')

    n <- length(column_names)

    if (n != 1) {
        for (i in 1: (n - 1)) {
            # string <- paste(string, column_names[i], "=", values[i], "AND")
        }
    }
    string <- paste(string, column_names[n], "=", values[n])

    rv <- DBI::dbGetQuery(conn, string)

    return (rv)
}
