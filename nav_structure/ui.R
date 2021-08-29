
# 좌측편 Navigation 메뉴 ----------------------------------------------

navigation_styles <- list(
    root = list(
        height = "100%",
        boxSizing = "border-box",
        border = "1px solid #eee",
        overflowY = "auto"
    )
)

# 초중고 데이터셋 메뉴 -----------------------------------------------

link_groups <- list(
    list(
        links = list(
            list(
                name = "Home"
            ),
            list(
                name = "Elementary Dataset",
                expandAriaLabel = "Expand Elementary Dataset section",
                collapseAriaLabel = "Collapse Elementary Dataset section",
                links = list(
                    list(
                        name = "Society",
                        url = "",
                        key = "elementary_society",
                        target = "_blank"
                    ),
                    list(
                        name = "Mathematics",
                        url = "",
                        disabled = TRUE,
                        key = "elementary_mathematics",
                        target = "_blank"
                    ),
                    list(
                        name = "Science",
                        url = "",
                        disabled = TRUE,
                        key = "elementary_science",
                        target = "_blank"
                    ),
                    list(
                        name = "Statistics",
                        url = "",
                        disabled = TRUE,
                        key = "elementary_statistics",
                        target = "_blank"
                    )                    
                ),
                isExpanded = TRUE
            ),
            list(
                name = "Middle School Dataset",
                url = "",
                key = "key4",
                distable = TRUE
            ),
            list(
                name = "High School Dataset",
                url = "",
                key = "key5",
                disabled = TRUE
            ),
            list(
                name = "News",
                url = "",
                icon = "News",
                key = "key7",
                target = "_blank",
                iconProps = list(
                    iconName = "News",
                    styles = list(
                        root = list(
                            fontSize = 20,
                            color = "#106ebe"
                        )
                    )
                )
            )
        )
    )
)

# 데이터 분석 페이지 -------------------------------------------------

analysis_page <- function() {
    div(
        Stack(
            horizontal = TRUE,
            tokens = list(childrenGap = 10)
        ),
        plotOutput("ggplotBarId")
    )
}    


# 초중고 데이터셋 메뉴 -----------------------------------------------

ui <- fluentPage(
    Nav(
        groups = link_groups,
        selectedKey = "key1"
        # styles = navigation_styles
    ),
    div(class = "main", plotOutput("ggplotPieId"))
)