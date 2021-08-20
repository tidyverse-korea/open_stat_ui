
server <- function(input, output) {
    
    # 1. show dataset ----
    output$datasetId <- render_gt(
        expr = gender_gt,
        height = px(600),
        width = px(600)
    )
    
    # 2. show descriptive statistics ----
    output$statisticsId <- render_gt(
        expr = gender_stat_gt,
        height = px(600),
        width = px(600)
    )
    
    # 3. show basic ggplot ----
    ## 3.1. pie chart 
    output$ggplotPieId <- renderPlot(
        gender_piechart_gg
    )
    ## 3.2. bar chart 
    output$ggplotBarId <- renderPlot(
        gender_barplot_gg
    )
    ## 3.3. Waffle chart 
    output$ggplotWaffleId <- renderPlot(
        gender_waffle_gg
    )
    ## 3.4. Image chart 
    output$ggplotImageId <- renderPlot(
        gender_image_gg
    )
}
