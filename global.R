library(shiny)
library(tidyverse)
library(shiny.fluent)
library(glue)
library(plotly)
library(leaflet)

details_list_columns <- tibble(
    fieldName = c("rep_name", "date", "deal_amount", "client_name", "city", "is_closed"),
    name = c("Sales rep", "Close date", "Amount", "Client", "City", "Is closed?"),
    key = fieldName)


# 카드 제작 함수 ----------------------------------

makeCard <- function(title, content, size = 12, style = "") {
    div(
        class = glue::glue("card ms-depth-8 ms-sm{size} ms-xl{size}"),
        style = style,
        Stack(
            tokens = list(childrenGap = 5),
            Text(variant = "large", title, block = TRUE),
            content
        )
    )
}