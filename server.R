#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  ToothGrowth$dose<-as.factor(ToothGrowth$dose)
  model1config<-reactive({
    model1<-lm(len~supp, data = ToothGrowth)
    summary(model1)
  })
   model2config<-reactive({
     model2<- lm(len~dose, data = ToothGrowth)
     summary(model2)
   })
  output$distPlot <- renderPlot({
    require(ggplot2)
    if(input$select=="supp")
    {
      ggplot(ToothGrowth, aes(x = supp, y = len)) +
        geom_boxplot(fill = "grey80", colour = "blue") +
        scale_x_discrete() +
        ylab("Length of tooth")
    }
    else
    {
      ggplot(ToothGrowth, aes(x = dose, y = len)) +
        geom_boxplot(fill = "grey80", colour = "blue") +
        scale_x_discrete() +
        ylab("Length of tooth")
    }
    
  })
  output$text1 <- renderPrint({
    
    if(input$select == "supp"){
      model1config()
    }
    else{
      model2config()
    }
  })
  
})
