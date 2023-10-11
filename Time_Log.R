library(shiny)
#install.packages("lubridate")
library(lubridate)

#Import data and convert to data frame
df <- read.csv("Time_Log.csv")
df$Date <- df$Date %>%
  mdy()
          
# Define UI ----
ui <-fluidPage(
    #Create plot
    titlePanel("Date vs Minutes Worked"),
    plotOutput("plot"))

# Define server logic ----
server <- function(input, output) {
  output$plot <- renderPlot({
    ggplot(df, aes(Date, Minutes.Worked)) + geom_col() + theme_light() + ylab("Minutes Worked") 
  })
}

# Run the app ----
shinyApp(ui = ui, server = server)

