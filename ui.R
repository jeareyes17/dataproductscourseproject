#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a boxplot
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Statistical Analysis on the Effect of Supplements on Tooth Growth of Guinea Pigs"),
  
  # Sidebar with a select input
  sidebarLayout(
    sidebarPanel(
      selectInput("select", label = h3("Select which factor to evaluate:"), 
                  choices = list("Supplement" = "supp", "Dose" = "dose"), 
                  selected = "supp")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      tabsetPanel(type = "tabs",
                  tabPanel("Readme", br(), 
                           h3("Background"),
                           p("The response is the length (len) of odontoblasts (cells responsible for tooth growth) in 60 guinea pigs."),
                           p("The subjects have undergone the following treatments:"),
                           p("- three dose levels of vitamin C (0.5, 1, and 2 mg/day)"),
                           p("- two delivery methods, orange juice (OJ) or ascorbic acid (VC)"),

                           br(),
                           h3("Usage of Application"),
                           p("- Select which factor to evaluate from the drop down"),
                           p("- The boxplot of the categories of each factor are displayed to compare the difference"),
                           p("- The summary of the fitted model is also shown."),
                           br(),
                           h3("Source"),
                           p("McNeil, D. R. (1977). Interactive Data Analysis. New York: Wiley."),
                           p("Crampton, E. W. (1947). The growth of the odontoblast of the incisor teeth as a criterion of vitamin C intake of the guinea pig. The Journal of Nutrition, 33(5), 491–504. doi: 10.1093/jn/33.5.491.")
                       
                           ),
                  tabPanel("Plot", br(),plotOutput("distPlot")),
                  tabPanel("Summary",verbatimTextOutput("text1"))
    
      )
    )
  )
))
