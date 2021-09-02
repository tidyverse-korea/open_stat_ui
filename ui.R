
# 제어를 위한 필터 ---------------------------------

filters <- Stack(
    
    tokens = list(childrenGap = 10),
    
    Stack(
        horizontal = TRUE,
        tokens = list(childrenGap = 10),
        DatePicker.shinyInput("fromDate", value = as.Date('2020/01/01'), label = "From date"),
        DatePicker.shinyInput("toDate", value = as.Date('2020/12/31'), label = "To date")
    ),
    
    Label("Filter by sales reps", className = "my_class"),
    NormalPeoplePicker.shinyInput(
        "selectedPeople",
        class = "my_class",
        options = fluentPeople,
        pickerSuggestionsProps = list(
            suggestionsHeaderText = 'Matching people',
            mostRecentlyUsedHeaderText = 'Sales reps',
            noResultsFoundText = 'No results found',
            showRemoveButtons = TRUE
        )
    ),
    
    Slider.shinyInput("slider",
                      value = 0, min = 0, max = 1000000, step = 100000,
                      label = "Minimum amount",
                      valueFormat = JS("function(x) { return '$' + x}"),
                      snapToStep = TRUE
    ),
    
    Toggle.shinyInput("closedOnly", value = TRUE, label = "Include closed deals only?")
)

# analysis 페이지 ----------------------------------------------------------

analysis_page <- makePage(
    "Sales representatives",
    "Best performing reps",
    div(
        Stack(
            horizontal = TRUE,
            tokens = list(childrenGap = 10),
            makeCard("Filters", filters, size = 4, style = "max-height: 320px"),
            makeCard("Deals count", plotlyOutput("plot"), size = 8, style = "max-height: 320px")
            
        ),
        uiOutput("analysis")
    )
)

# UI Structure - Layout ----------------------------------------------------------

header <- tagList(
    img(src = "logo.jpg", class = "logo"),
    div(Text(variant = "xLarge", "Sales Reps Analysis"), class = "title"),
    CommandBar(
        items = list(
            CommandBarItem("New", "Add", subitems = list(
                CommandBarItem("Email message", "Mail", key = "emailMessage", href = "mailto:me@example.com"),
                CommandBarItem("Calendar event", "Calendar", key = "calendarEvent")
            )),
            CommandBarItem("Upload sales plan", "Upload"),
            CommandBarItem("Share analysis", "Share"),
            CommandBarItem("Download report", "Download")
        ),
        farItems = list(
            CommandBarItem("Grid view", "Tiles", iconOnly = TRUE),
            CommandBarItem("Info", "Info", iconOnly = TRUE)
        ),
        style = list(width = "100%")))

navigation <- navigation <- Nav(
    groups = list(
        list(links = list(
            list(name = 'Home', url = '#!/', key = 'home', icon = 'Home'),
            list(name = 'Analysis', url = '#!/other', key = 'analysis', icon = 'AnalyticsReport'),
            list(name = 'shiny.fluent', url = 'http://github.com/Appsilon/shiny.fluent', key = 'repo', icon = 'GitGraph'),
            list(name = 'shiny.react', url = 'http://github.com/Appsilon/shiny.react', key = 'shinyreact', icon = 'GitGraph'),
            list(name = 'Appsilon', url = 'http://appsilon.com', key = 'appsilon', icon = 'WebAppBuilderFragment')
        ))
    ),
    initialSelectedKey = 'home',
    styles = list(
        root = list(
            height = '100%',
            boxSizing = 'border-box',
            overflowY = 'auto'
        )
    )
)

footer <- Stack(
    horizontal = TRUE,
    horizontalAlign = 'space-between',
    tokens = list(childrenGap = 20),
    Text(variant = "medium", "Built with love icon by Appsilon", block=TRUE),
    Text(variant = "medium", nowrap = FALSE, "If you'd like to learn more, reach out to us at hello@appsilon.com"),
    Text(variant = "medium", nowrap = FALSE, "All rights reserved.")
)

layout <- function(mainUI){
    div(class = "grid-container",
        div(class = "header", header),
        div(class = "sidenav", navigation),
        div(class = "main", mainUI),
        div(class = "footer", footer)
    )
}

# UI 페이지 ----------------------------------------------------------

ui <- fluentPage(
    tags$style(".card { padding: 28px; margin-bottom: 28px; }"),
    layout(analysis_page),
    tags$head(
        tags$link(href = "style.css", rel = "stylesheet", type = "text/css"))
)
