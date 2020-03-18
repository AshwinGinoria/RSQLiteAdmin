#' Intro UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_Intro_ui <- function(id){
  ns <- NS(id)
  tagList(
    wellPanel(
      
      # File : DataSet Input
      fileInput(ns("file"), label = h3("Upload Dataset")),
      
      # Action Button
      actionButton(ns("datasetOkButton"), label = "Proceed"),
    ),
    
    conditionalPanel(
      condition = paste0('input[\'', ns('datasetOkButton'), "\'] != 0"), 
      wellPanel(
        # list of tables
        selectInput(ns("table_name"), label = "Select Table", choices = c()),
        
        # Action Button 2
        actionButton(ns("show"), label = "Show Table", choices = c()),
        hr(),
        
        # dataset output
        DT::dataTableOutput(ns("view"))
      )
    )
  )
}
    
#' Intro Server Function
#'
#' @noRd 
mod_Intro_server <- function(input, output, session){
  ns <- session$ns
  # You can access the value of the widget with input$file, e.g.
  
  pathtodb <- "data-raw/my_dataset.db"
  
  observeEvent(input$datasetOkButton, {
    # Copying the database to a common Location
    file.copy(input$file$datapath, pathtodb, overwrite = TRUE)
    
    # Establishing Connection
    con <- DBI::dbConnect(RSQLite::SQLite(), pathtodb)
    
    # Getting Table Names Present in uploaded Database
    table <- DBI::dbListTables(con)
    
    # Populating table_name Select input dunamically
    updateSelectInput(session, "table_name", choices = table)
    
    # Disconnecting
    DBI::dbDisconnect(con)
  })
  
  observeEvent(input$show, {
    # Establishing Connection
    con <- DBI::dbConnect(RSQLite::SQLite(), pathtodb)
    
    output$view <- DT::renderDataTable({
      DBI::dbReadTable(con, isolate(input$table_name))
    })
  })
}
    
## To be copied in the UI
# mod_Intro_ui("Intro_ui_1")
    
## To be copied in the server
# callModule(mod_Intro_server, "Intro_ui_1")
 
