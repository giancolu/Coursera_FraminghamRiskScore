#ui.r
library(shiny)
shinyUI(fluidPage(
        
        titlePanel("FRAMINGHAM RISK SCORE CALCULATOR"),
        
        headerPanel(h4("This is a calculator for the evaluation of the general cardiovascular risk 
        profile for use in primary care based on the Framingham Heart Study")),
        
        headerPanel(h4("It calculates the 10 year risk of developing all cardiovascular diseases 
                        and of its constituents (coronary, cerebrovascular, or peripheral arterial 
                        disease or heart failure)")),
        
        headerPanel(h5("D'Agostino RB, et al. Circulation 2008;117:743-753")),

        headerPanel(""),
        
        sidebarLayout(
                sidebarPanel(
                        h4("ENTER YOUR VALUES"),
                        
                        selectInput("sex",
                        h6("Sex"),list("Male" = "male", "Female" = "female")),
                        
                        numericInput("age",
                        h6("Age (year) ="),value = 30, min = 30, max = 80, step = 1),
                        
                        numericInput("TC",
                        h6("Total cholesterol (mg/dL)"),value=200), 
                        
                        numericInput("HDL",
                        h6("HDL cholesterol (mg/dL)"),value=40),
                        
                        radioButtons("HTN",
                        h6("Are you under treatment for hypertension?"),
                        list("Yes" = 1, "No" = 0), selected = 0),
                        
                        numericInput("SBP",
                        h6("Systolic blood pressure levels (mm Hg)"),value = 120),
                        
                        radioButtons("smoke",
                        h6("Are you a smoker?"),list("Yes" = 1, "No" = 0), selected = 0),
                        
                        radioButtons("diabetes",
                        h6("Are you diabetic?"),list("Yes" = 1, "No" = 0), selected = 0)
                ),
                
        mainPanel(
                h4("VALUE YOU ENTERED"),
                
                h6("Sex"),
                verbatimTextOutput("osex"),
                
                h6("Age"),
                verbatimTextOutput("oage"),
                
                h6("Total cholesterol"),
                verbatimTextOutput("oTC"),
                
                h6("HDL choletserol"),
                verbatimTextOutput("oHDL"),
                
                h6("Treated for Hypertension?"),
                verbatimTextOutput("oHTN"),
                
                h6("Systolic blood presure levels"),
                verbatimTextOutput("oSBP"),
                
                h6("Current smoker"),
                verbatimTextOutput("osmoke"),
                
                h6("Diabetes"),
                verbatimTextOutput("odiabetes"),
                br(),
                
                h4(strong("10 year CARDIOVASCULAR RISK SCORE % =")),
                verbatimTextOutput("ofram")
                )
        )
        
))