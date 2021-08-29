
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

# Layout 페이지 -------------------------------------------------

layout <- function(mainUI){
    div(class = "grid-container",
        div(class = "header", header)
    )
}

footer <- Stack(
    horizontal = TRUE,
    horizontalAlign = 'space-between',
    tokens = list(childrenGap = 20),
    Text(variant = "medium", "Built with R by Appsilon", block=TRUE),
    Text(variant = "medium", nowrap = FALSE, "If you'd like to learn more, reach out to us at hello@appsilon.com"),
    Text(variant = "medium", nowrap = FALSE, "All rights reserved.")
)

header <- tagList(
    img(src = "R_logo.png", width="3%", class = "logo"),
    div(Text(variant = "xLarge", "Open Stat. Package"), class = "title"),
    CommandBar(
        items = list(
            CommandBarItem("New", icon = "Add", subitems = list(
                CommandBarItem("Data Upload", "upload", key = "dataUpload")
            )),
            CommandBarItem("Data / Table", icon = "Table"),
            CommandBarItem("Descriptive Statistics", icon = "Code"),
            CommandBarItem("Visualization", icon = "Calendar")
        ),
        farItems = list(
            CommandBarItem("Grid view", "Tiles", iconOnly = TRUE),
            CommandBarItem("Info", "Info", iconOnly = TRUE)
        ),
        style = list(width = "100%")))


# 초중고 데이터셋 메뉴 -----------------------------------------------

ui <- fluentPage(
    layout(),
    Nav(
        groups = link_groups,
        selectedKey = "key1"
        # styles = navigation_styles
    ),
    div(class = "main", plotOutput("ggplotPieId")),
    div(class = "footer", footer)
)