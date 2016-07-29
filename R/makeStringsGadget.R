library(shiny)
library(miniUI)

makeStringsGadget <- function(...) {

  ui <- miniPage(
    gadgetTitleBar("Type your strings freely!"),
    miniContentPanel(
      textInput("sep", "Separator:"),
      textInput("text", "Strings:")
    )
  )

  server <- function(input, output, session) {

    observeEvent(input$done, {
      returnValue <- unlist(strsplit(as.character(input$text), split = input$sep))
      stopApp(returnValue)
    })
  }

  runGadget(ui, server)
}
