#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)


# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("PSY 8712 Week 8 Project"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            selectInput("gender",
                        "Select Gender",
                        choices= c("Male","Female","All"),
                        selected= "All"),
            selectInput("errorband",
                        "Display or Suppress Error Band",
                        choices = c("Display Error Band", "Suppress Error Band"),
                        selected= "Display Error Band"),
            selectInput("date",
                        "Include or Exclude Participants before July 1, 2017",
                        choices= c("Include Participants before July 1, 2017", "Exclude Participants before July 1, 2017"),
                        selected= "Include Participants before July 1, 2017")
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white',
             xlab = 'Waiting time to next eruption (in mins)',
             main = 'Histogram of waiting times')
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
