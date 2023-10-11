library(ggplot2)
function(input, output) {
  
  #leaver note with currency conversion
  
  # Fill in the spot we created for a plot
  output$histPlot <- renderPlot({
    # if(input$selection == "Happiness"){
    #   barplot((table(as.factor(df$Happiness))), main = "Happiness", names.arg = c("Very happy", 
    #                                                                               "Quite happy",
    #                                                                               "Not very happy",
    #                                                                               "Not happy at all"), 
    #           xlab = "Self-reported happiness", ylab = "Number of People")
    # }
    if(input$selection == "Class"){
      barplot((table(as.factor(df$Class))), main = "People in Each Socio-Econmic Class", 
              names.arg = c("Lower", 
                            "Working",
                            "Middle",
                            "Upper middle",
                            "Upper"), 
              xlab = "Seld-reported socio-economic class", ylab = "Number of People")
    }
    else if(input$selection == "Income"){
      hist(df$Income, main = "Monthly Income for Person", 
           xlab = "Income in SEK (1,000 SEK = 92 USD)", ylab = "Number of People")
    }
  })
   output$regressionPlot <- renderPlot({
     if(input$selection == "Class"){
       plot(avgData$Class, avgData$Avg_Happiness_Class,
            ylim = rev(range(avgData$Avg_Happiness_Class)),
            main="Class vs Happiness",
            xlab="Self-reported socio-economic class", 
            ylab="Happiness (Increasing)",
            xaxt = "n")
       
        axis(1, at = c(1, 2, 3, 4, 5),
             labels = c("Lower", 
                         "Working",
                         "Middle",
                         "Upper middle",
                         "Upper"))
       
       legend(x = "bottomright",
              title="Happiness Scale", 
              legend=c("1 : Very happy", 
                        "2 : Quite happy",
                        "3 : Not very happy",
                        "4 : Not happy at all"))
       
       dat <- lm(avgData$Avg_Happiness_Class ~ avgData$Class)
       abline(h = NULL, dat)
     }
     else if(input$selection == "Income"){
       plot(avgData$Income,avgData$Avg_Happiness,
            ylim = rev(range(avgData$Avg_Happiness_Class)),
            main="Income vs Happiness",
            xlab="Income in SEK (1,000 SEK = 92 USD)", ylab="Happiness")
       
       legend(x = "bottomright",
              title="Happiness Scale", 
              legend=c("1 : Very happy", 
                       "2 : Quite happy",
                       "3 : Not very happy",
                       "4 : Not happy at all"))
       
       dat <- lm(avgData$Avg_Happiness ~ avgData$Income)
       abline(h = NULL, dat)
     }
   })
}