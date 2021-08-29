library(shiny)
library(shiny.fluent)

ui <- fluentPage(
    Text(variant = "xxLarge", "오픈 통계 팩키지")
)

server <- function(input, output, session) {}

shinyApp(ui, server)

