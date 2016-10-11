# Coursera Data Science Specialization
# Capstone
# Kun Zhu

########################
# Shiny server and UI configuration
########################

library(shiny)
source("predictFunc.R")

server <- function(input, output, session) {

  observe({
  
    inputText <- input$text
    cleanText <- gsub(",\\*! "," ",inputText)
    
    if(cleanText != " ") 
    {
      results <- wordPredict(cleanText)
      updateSelectInput(session = session, choices = results, inputId = "results")
      
      output$message <- renderText({
        paste(message)
      })
      
      gc()
    }  
  })
}

ui <- fluidPage(
  	titlePanel("Data Science Capstone Project - Next Word Prediction App"),
    
    sidebarLayout(
	    sidebarPanel(
			p("Input a word and hit <Predict> to see the next word(s) suggestions:"),	
			textInput(inputId="text", label = ""),
			submitButton("Predict"),
			HTML('<script type="text/javascript"> document.getElementById("text").focus(); </script>')
	    ),

		mainPanel( 
      selectInput("results", "Word predictions:", choices=c("")),
      verbatimTextOutput("message")
		)
  ),
  
	fluidRow(HTML("<div style='margin-left:18px;margin-bottom:12px;color:navy;'><strong> Creation by: Kun Zhu, 10/10/2016</strong></div>") )
)

shinyApp(ui = ui, server = server)

