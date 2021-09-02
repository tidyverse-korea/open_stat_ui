
server <- function(input, output, session) {
    
    router$server(input, output, session)
    
    # 제어 결과 필터링 리액티브 데이터프레임 ----------------------------
    filtered_deals <- reactive({
        req(input$fromDate)
        
        selectedPeople <- (
            if (length(input$selectedPeople) > 0) input$selectedPeople
            else fluentPeople$key
        )
        
        minClosedVal <- if (isTRUE(input$closedOnly)) 1 else 0
        
        filtered_deals <- fluentSalesDeals %>%
            filter(
                rep_id %in% selectedPeople,
                date >= input$fromDate,
                date <= input$toDate,
                deal_amount >= input$slider,
                is_closed >= minClosedVal
            ) %>%
            mutate(is_closed = ifelse(is_closed == 1, "Yes", "No"))
    })

    # Main 산출물 -------------------------------------------------------    
    output$analysis <- renderUI({
        
        items_list <- if(nrow(filtered_deals()) > 0){
            DetailsList(items = filtered_deals(), columns = details_list_columns)
        } else {
            p("No matching transactions.")
        }
        
        Stack(
            tokens = list(childrenGap = 5),
            horizontal = TRUE,
            Text(variant = "large", "Sales deals details", block = TRUE),
            makeCard("Top results", div(style="max-height: 500px; overflow: auto", items_list)),
            makeCard("Map", leafletOutput("map"))
        )
    })
    
    
    # 막대그래프 ----------------------------------------------------------
    output$plot <- renderPlotly({
        p <- ggplot(filtered_deals(), aes(x = rep_name)) +
            geom_bar(fill = unique(filtered_deals()$color)) +
            ylab("Number of deals") +
            xlab("Sales rep") +
            theme_light()
        ggplotly(p, height = 300)
    })
    
    # 지도 -----------------------------------------------------------------
    output$map <- renderLeaflet({
        points <- cbind(filtered_deals()$LONGITUDE, filtered_deals()$LATITUDE)
        leaflet() %>%
            addProviderTiles(providers$Stamen.TonerLite, options = providerTileOptions(noWrap = TRUE)) %>%
            addMarkers(data = points)
    })
    
    
}


