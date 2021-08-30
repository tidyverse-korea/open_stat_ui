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


