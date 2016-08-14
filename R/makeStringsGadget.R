makeStringsGadget <- function(...) {

  ui <- miniUI::miniPage(
    miniUI::gadgetTitleBar("makeStrings Gadget"),
    miniUI::miniContentPanel(
      shiny::textInput("sep", "Separator:", ", "),
      shiny::radioButtons("radio", label = "Class:", choices = list("Character" = "char",
                                                                    "Numeric" = "num")),
      shiny::br(),
      shiny::p("Type here:"),
      tags$textarea(id = "typings", rows = 3, cols = 75, "These, are, a, few, of, my, favorite, things"),
      shiny::br(),
      shiny::p("Preview:"),
      shiny::verbatimTextOutput("preview")
    )
  )

  server <- function(input, output, session) {

    output$preview <- shiny::renderPrint({
      if (input$radio == "char") {
        unlist(strsplit(as.character(input$typings), split = input$sep))
      } else {
        as.numeric(unlist(strsplit(input$typings, split = input$sep)))
      }
    })

    shiny::observeEvent(input$done, {
      if (input$radio == "char") {
        rv <- unlist(strsplit(as.character(input$typings), split = input$sep))
      } else {
        rv <- as.numeric(unlist(strsplit(input$typings, split = input$sep)))
      }
      stopApp(rv)
    })
  }
  viewer <- shiny::dialogViewer(dialogName = 'typeStrings', width = 900, height = 900)
  shiny::runGadget(ui, server, stopOnCancel = TRUE, viewer = viewer)
}
