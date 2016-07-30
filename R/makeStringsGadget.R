makeStringsGadget <- function(...) {

  ui <- miniUI::miniPage(
    miniUI::gadgetTitleBar("Type your strings freely!"),
    miniUI::miniContentPanel(
      shiny::textInput("sep", "Separator:"),
      shiny::textInput("text", "Strings:")
    )
  )

  shiny::server <- function(input, output, session) {

    shiny::observeEvent(input$done, {
      returnValue <- unlist(strsplit(as.character(input$text), split = input$sep))
      shiny::stopApp(returnValue)
    })
  }

  runGadget(ui, server)
}
