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

server <- function(input, output, server){
  
  # reactives
  
  # reactive values are great for capturing results involving side-effects
  rctval_default <- reactiveValues(
    random = runif(1)
  )
  
  # observers
  observeEvent(
    eventExpr = input$action,
    handlerExpr = {
      # runif uses side-effects, so we put this in an observer
      rctval_default$random <- runif(1)
    }
  )
  
  # outputs
  
  # by expressing this way, we tell shiny how to do this, 
  # rather than by telling it what to and when to do it.
  output$display <- 
    renderText(paste(input$action, rctval_default$random, sep = ": "))
  
}

shinyApp(ui = ui, server = server)