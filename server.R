library(shiny)
framingham <- function(sex,age,TC,HDL,HTN,SBP,smoke,diabetes){ 
        if (sex == "male") {
                bixi = 3.06117*log(age)+1.12370*log(TC)-0.93263*log(HDL)+1.93303*log(SBP)*(1-as.numeric(HTN))+1.99881*log(SBP)*as.numeric(HTN)+0.65451*as.numeric(smoke)+0.57367*as.numeric(diabetes)
                round((1-0.88936^exp(bixi-23.9802))*100,1)
        }
        else {
                bixi = 2.32888*log(age)+1.20904*log(TC)-0.70833*log(HDL)+2.76157*log(SBP)*(1-as.numeric(HTN))+2.82263*log(SBP)*as.numeric(HTN)+0.52873*as.numeric(smoke)+0.69154*as.numeric(diabetes)
                round((1-0.95012^exp(bixi-26.1931))*100,1)
        }}
shinyServer(
        function(input, output) {
                output$osex <- renderPrint(input$sex)
                output$oage <- renderPrint(input$age)
                output$oTC <- renderPrint(input$TC)
                output$oHDL <- renderPrint(input$HDL)
                output$oHTN <- renderPrint(input$HTN)
                output$oSBP <- renderPrint(input$SBP)
                output$osmoke <- renderPrint(input$smoke)
                output$odiabetes <- renderPrint(input$diabetes)
                output$ofram <- renderPrint({framingham(input$sex,input$age,input$TC,input$HDL,as.numeric(input$HTN),input$SBP,as.numeric(input$smoke),as.numeric(input$diabetes))})
        }
        
)
