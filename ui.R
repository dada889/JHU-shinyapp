library(shiny)
shinyUI(
        pageWithSidebar(
        headerPanel("Monthly Airline Passenger Numbers 1949-1960"),
        
        sidebarPanel(
                p("This shiny app presents the monthly airline passenger number between 1949 and 1960. "),
                p("In the slider below, you can choose the data in this period you want to see. You can selected from 1949 to 1960"),
                p("The first line in the right hand side shows the period you had choosed."),
                p("The second line shows the yearly average passenger number during the period you had choosed."),
                p("The graph shows the data you had choosed"),

                br(),
                sliderInput('year','The years:',min=1949,max=1960,value=c(1949,1955)),
                br(),
                p("The last line in the right hand side shows the n month ahead prediction of passangers. We can enter the number of ahead prediction we want in the inputbox below. This app use Holt-Winters Filtering to do the prediction."),
                numericInput('prediction', 'n month ahead prediction', 1, min = 0, max = 200, step = 1),
                submitButton('submit')
                
                ),
        
        mainPanel(
                h4('The period selected'),
                verbatimTextOutput('inputValue'),
                h4('The total passenger number during this period'),
                verbatimTextOutput('sum'),
                h4('The yearly average passenger number during this period'),
                verbatimTextOutput('av'),

                plotOutput('plot1'),
                
                br(),
                h4('N month ahead prediciton'),
                verbatimTextOutput('pred')
                
                )
        ))