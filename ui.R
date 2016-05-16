library(shiny)
shinyUI(fluidPage(
  titlePanel("Old Faithful Eruption Duration Predictor"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("wait", "Time since last eruption:", min = 45, max = 95, value = 60, step = 1),
      checkboxInput("showfit", "Show Fit", value = T),
      checkboxInput("showguides", "Show Guides", value=T),
      "Next Eruption Duration: ",
      strong(textOutput("prediction", inline = TRUE))
    ),
    mainPanel(
      plotOutput("plot")
    )
  )
))
