library(tidyverse)
library(janitor)
library(shiny)
library(shinydashboard)

ui <- dashboardPage(
  dashboardHeader(title = "Age and Height by Sex"),
  
  dashboardSidebar(
    
    selectInput("x",
                "Select Variable",
                choices = c("height",
                            "age"),
                selected = "age")
    
  ),
  
  dashboardBody(
    plotOutput("plot", width = "500px", height="600px")
  )
)

server <- function(input, output, session) {
  
  output$plot <- renderPlot({
    
    elephants %>% 
      ggplot(aes(x= sex, y=.data[[input$x]], fill = sex))+
      geom_boxplot(position = "dodge")+
      theme_minimal()+
      labs(fill= "sex")
    
  })
  
}
shinyApp(ui, server)
