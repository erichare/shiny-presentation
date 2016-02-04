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
    # we put here only for the reactive dependency
    input$action
    
    # this guy has side effects
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