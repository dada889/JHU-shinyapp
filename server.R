library(MASS)
library(shiny)
ap <- AirPassengers
fit <- HoltWinters(ap)


shinyServer(
        function(input,output) {
                output$inputValue <- renderPrint({input$year})
                #output$prediction <- renderPrint({dr(input$a)})
                
                selectedData <- reactive({window(ap,input$year[1],c(input$year[2],12))})
                lim <- reactive({c(input$year[1],input$year[2])})
                output$sum <- renderPrint({sum(selectedData())})
                output$av <- renderPrint({sum(selectedData())/(input$year[2]-input$year[1])})
                output$pred <- renderPrint({predict(fit,n.ahead=input$prediction)[input$prediction]})
                output$plot1 <- renderPlot({
                        plot(ap,type="p",xlim=lim(),ylab="airline passangers")
                })
                
        }
        )