library("shiny")

ui <- shinyUI(
  fluidPage(
    sidebarLayout(
      sidebarPanel = sidebarPanel(
        actionButton(inputId = "action", label = "new random number")
      ),
      mainPanel = mainPanel(
        textOutput(outputId = "display")
      )
    )
  )
)

server <- function(input, output, session){
  
  # reactives
  rct_random <- reactive({
    runif(1)
  })
  
  # observers
  observeEvent(
    eventExpr = input$action,
    handlerExpr = {
      output$display <- 
        renderText(paste(input$action, rct_random(), sep = ": "))
    }
  )

  # outputs
  
  
}

shinyApp(ui = ui, server = server)