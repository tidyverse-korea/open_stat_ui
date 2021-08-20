

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


cat_barplot_page <- makePage(
    "단변량 분석",
    "범주형 변수: 막대그래프",
    div(
        class = "card ms-depth-8 ms-sm4",
        style = "overflow: auto",
        Stack(
            horizontal = TRUE,
            tokens = list(childrenGap = 10)
        ),
        plotOutput("ggplotBarId")
    )
)

cat_pieplot_page <- makePage(
    "단변량 분석",
    "범주형 변수: 원그래프",
    div(
        class = "card ms-depth-8 ms-sm4",
        style = "overflow: auto",
        Stack(
            horizontal = TRUE,
            tokens = list(childrenGap = 10)
        ),
        plotOutput("ggplotPieId")
    )
)

cat_waffle_page <- makePage(
    "단변량 분석",
    "범주형 변수: 와플그래프",
    div(
        class = "card ms-depth-8 ms-sm4",
        style = "overflow: auto",
        Stack(
            horizontal = TRUE,
            tokens = list(childrenGap = 10)
        ),
        plotOutput("ggplotWaffleId")
    )
)

cat_image_page <- makePage(
    "단변량 분석",
    "범주형 변수: 이미지 그래프",
    div(
        class = "card ms-depth-8 ms-sm4",
        style = "overflow: auto",
        Stack(
            horizontal = TRUE,
            tokens = list(childrenGap = 10)
        ),
        plotOutput("ggplotImageId")
    )
)

cat_gt_page <- makePage(
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


ui <- fluentPage(
    cat_barplot_page,
    cat_pieplot_page,
    cat_waffle_page,
    cat_image_page,
    cat_gt_page,
    cat_statistics_page
)

