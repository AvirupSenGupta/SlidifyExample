shinyUI(fluidPage(
        titlePanel("Claculate the probablity of your car's Calculating Probability of engine type (V or straight) "),
        sidebarLayout(sidebarPanel(
     
                helpText("Estimate the probability of a vehicle having a V-engine or straight engine using the a weight (1000 lbs) and engine displacement values (cu. inches)"),
        
                numericInput(
                        inputId  = "disp",
                        label    = strong("displacement values: "),
				                value = 180
                ),
                numericInput(
                        inputId = "wt",
                        label = strong("weight (1000 lb)"),
                        value = 2.1
                )
        ),
        
        mainPanel(
                uiOutput("input"),
                uiOutput("result")
        ))
))
