


filters <- tagList(
    DatePicker.shinyInput("fromDate", value = as.Date('2020/01/01'), label = "From date"),
    DatePicker.shinyInput("toDate", value = as.Date('2020/12/31'), label = "To date")
)

ui <- fluentPage(
    filters,
    uiOutput("analysis")
)

