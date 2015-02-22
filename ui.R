library(shiny)
shinyUI(
  pageWithSidebar(
    headerPanel("Predict the Performance of a Car From Design Parameters"),
    sidebarPanel(
      sliderInput("cyl", "Number of Cylinders:", min=4, max=12, value=4, step=2),
      numericInput("disp", "Engine Displacement (cubic inches):", min=70, max=500, step=15, value=250),
      numericInput("drat", "Rear Axle Ratio:", min=2, max=5, step=.25, value=2.95),
      numericInput("wt", "Weight (lb/1000):", min=1, max=6, step=.5, value=2.5),
      selectInput("vs", "Engine Orientation",
                  list("V", "Straight")),
      selectInput("am", "Transmission Type",
                  list("Automatic", "Manual")),
      sliderInput("gear", "Number of Gears:", min=1, max=6, step=1, value=3),
      sliderInput("carb", "Number of Carburetors", min=1, max=8, step=1, value=1)
    ),
    mainPanel(
      tags$style(type="text/css", "#qsec{color:DodgerBlue;}"),
      tags$style(type="text/css", "#mpg{color:DodgerBlue;}"),
      h3("Quarter Mile Time, Seconds"),
      h4(textOutput("qsec")),
      h3("Miles Per Gallon"),
      h4(textOutput("mpg")),
      h3("Instructions"),
      p("This application allows you to predict the performance of a car (in terms of time to complete the 
        quarter mile, and also in fuel economy) based on some basic design parameters one might choose when
        designing a car.  Use the inputs on the left panel to design your car, and then view the results 
        above in the main panel.  Results are computed immediately upon making a change to a design 
        parameter."),
      p("This applicaton uses data from a 1974 Motor Trend survey, and so is not
        based on cars that use modern technology.  Also, there are not a lot of realistic restrictions on 
        inputs, so if you're not careful, it is possible to design an unrealistic vechicle. Please note that 
        the weight is in thousands of pounds.")
    )
  )
)