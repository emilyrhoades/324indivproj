#install.packages("shinythemes")
library("shinythemes")

#Add theme
fluidPage(theme = shinytheme("united"),
          #Add navigation bar          
          navbarPage("Navigation",
                     #Create options tab. This allows user to select params for all graphics
                     tabPanel("Options",
                                     titlePanel("Happiness and Privilege in Sweden"),
                                     selectInput("selection", "Explaining factor", 
                                                 choices=c("Class", "Income")),
                                     checkboxInput("checkbox", "Display Trend Line", value = TRUE)),
                     
                     #Plot box plot 
                     tabPanel("Happiness vs Privilege Box Plot",
                              plotOutput("boxPlot")),
                     #Plot scatter plot         
                     tabPanel("Happiness vs Privilege Scatter Plot",
                              plotOutput("regressionPlot")
                     ),
                     #Plot income and class scatter plot       
                     tabPanel("Income vs Class",
                              plotOutput("compPlot")
                     ),
                     #Plot histogram
                     tabPanel("Histograms",
                              plotOutput("histPlot"))
          )
)

