library(ggplot2)
library(shiny)
shinyServer(function(input, output) {
  # Model faithful data.
  model <- lm(faithful)
  
  # Plot.
  output$plot <- renderPlot({
    wait       <- input$wait
    showguides <- input$showguides
    showfit    <- input$showfit
    predicted  <- predict(model, data.frame(waiting=wait))
    # Construct plot.
    p <- ggplot(data=faithful, aes(x=waiting, y=eruptions))
    p <- p + ylab("Eruption Duration (min)") + xlab("Time Since Last Eruption (min)")
    p <- p + scale_y_continuous(limits=c(1, 5.5))
    p <- p + scale_x_continuous(limits=c(40, 96))
    p <- p + geom_point()
    # Show guides.
    if( showguides ) {
      p <- p + geom_vline(xintercept = wait, linetype="dotted")
      p <- p + geom_hline(yintercept = predicted, linetype="dotted")
    }
    # Show linear fit.
    if( input$showfit ) {
      p <- p + stat_smooth(method = "lm", col="blue")
    }
    p
  })
  
  # Prediction output.
  output$prediction <- renderText({
    rawpred <- predict(model, data.frame(waiting=input$wait))
    predmin <- floor(rawpred)
    predsec <- round((rawpred - predmin) * 60)
    paste(predmin, "minutes and", predsec, "seconds")
  })

})




