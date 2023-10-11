fluidPage(    
  
  # Give the page a title
  titlePanel("Privledge and Happiness in Sweden"),
  
  # Generate a row with a sidebar
  sidebarLayout(      
    
    # Define the sidebar with one input
    sidebarPanel(
      selectInput("selection", "Category:", 
                  choices=c("Class", "Income"))
    ),
    
    # Create a spot for the barplot
    mainPanel(
      plotOutput("histPlot"),
      plotOutput("regressionPlot")
    )
  )
  
)
