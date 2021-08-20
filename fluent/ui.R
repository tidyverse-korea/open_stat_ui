
# 0. Page, Card 함수 선언 --------------
makePage <- function (title, subtitle, contents) {
    tagList(div(
        class = "page-title",
        span(title, class = "ms-fontSize-32 ms-fontWeight-semibold", style =
                 "color: #323130"),
        span(subtitle, class = "ms-fontSize-14 ms-fontWeight-regular", style =
                 "color: #605E5C; margin: 14px;")
    ),
    contents)
}

makeCard <- function(title, content, size = 12, style = "") {
    div(class = glue("card ms-depth-8 ms-sm{size} ms-xl{size}"),
        style = style,
        Stack(
            tokens = list(childrenGap = 5),
            Text(variant = "large", title, block = TRUE),
            content
        ))
}

Grid <- function(...) {
    div(
        class = "ms-Grid", 
        dir   = "ltr",
        style = "padding: 0px",
        ...
    )
}

GridItem <- function(..., class = "ms-sm12") {
    div(
        class = paste("ms-Grid-col", class),
        style = "padding: 10px",
        ...
    )
}

# 1. 페이지 구축 --------------
## * 데이터셋 ----------
cat_data_page <- makePage(
    "단변량 분석",
    "범주형 변수: 데이터",
    div(
        class = "card ms-depth-8 ms-sm4",
        style = "overflow: auto",
        Stack(
            horizontal = TRUE,
            tokens = list(childrenGap = 10)
        ),
        gt_output("datasetId")
    )
)

## * 통계량 ----------
cat_statistics_page <- makePage(
    "단변량 분석",
    "범주형 변수: 데이터",
    div(
        class = "card ms-depth-8 ms-sm4",
        style = "overflow: auto",
        Stack(
            horizontal = TRUE,
            tokens = list(childrenGap = 10)
        ),
        gt_output("statisticsId")
    )
)

# 2. 카드 구축 --------------

cat_barplot_card <- makeCard(
    "막대그래프",
    plotOutput("ggplotBarId"),
    style = 4
)

cat_pieplot_card <- makeCard(
    "원그래프",
    plotOutput("ggplotPieId"),
    style = 4
)

cat_waffle_card <- makeCard(
    "와플그래프",
    plotOutput("ggplotWaffleId"),
    style = 4
)

cat_image_card <- makeCard(
    "이미지 그래프",
    plotOutput("ggplotImageId"),
    style = 4
)


# .* 카드 구축 --------------

ui <- fluentPage(
    cat_data_page,
    cat_statistics_page,
    # cat_waffle_card
    tagList(div(
        class = "page-title",
        span("단변량: 범주형 시각화", class = "ms-fontSize-32 ms-fontWeight-semibold", style =
                 "color: #323130")
    )),
    Stack(
        horizontal = TRUE,
        tokens = list(childrenGap = 100),
        
        plotOutput("ggplotImageId"),
        plotOutput("ggplotWaffleId"),
        plotOutput("ggplotPieId"),
        plotOutput("ggplotBarId")
        # cat_image_card,
        # cat_barplot_card,
        # cat_pieplot_card,
        # cat_waffle_card
    )
)

