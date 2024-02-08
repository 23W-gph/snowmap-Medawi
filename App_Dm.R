library(shiny)
library(vcd)

# Define UI for application
ui <- fluidPage(
  
  titlePanel("Effect of Smoking and Drinking on. Diabetics"),
  fluidRow(
    column(10, plotOutput("plot1")),
    column(10, plotOutput("plot2")),
    column(10, plotOutput("plot3"))
  )
)

# Define server logic
server <- function(input, output) {
 
  
  # Load the data from the R file
  source("Clean-for.R")
  # Sample data for demonstration
  
  # Mosaic plot 1:  Smoker vs. Diabetics
  output$plot1 <- renderPlot({
    mosaicplot(table(new_df$smoking, new_df$Diabetics_cat), main = "Smoker  vs.  Diabetics",color=c("blue", "green"))
  })
  
  # Mosaic plot 2: Drinking vs. Diabetics
  output$plot2 <- renderPlot({
    mosaicplot(table(new_df$drinking,new_df$Diabetics_cat), main = "Drinking  vs. Diabetics",color=c("blue", "green"))
  })
  
  # Mosaic plot 3: Gender vs. Diabetics
  output$plot3 <- renderPlot({
    mosaicplot(table(new_df$Gender,new_df$Diabetics_cat), main = "Gender  vs.  Diabetics ", color=c("blue", "green"))
  })
}

# Run the application
shinyApp(ui = ui, server = server)
