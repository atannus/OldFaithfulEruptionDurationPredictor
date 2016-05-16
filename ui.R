library(shiny)
shinyUI(fluidPage(

  # Application title
  titlePanel("Old Faithful Eruption Duration Predictor"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("wait", "Time since last eruption:", min = 45, max = 95, value = 60, step = 1),
      checkboxInput("showfit", "Show Fit", value = T),
      checkboxInput("showguides", "Show Guides", value=T),
      "Next Eruption Duration: ",
      strong(textOutput("prediction", inline = TRUE))
      
    ),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot")
    )
  )
))
