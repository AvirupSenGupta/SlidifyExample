source("./Probfunction.R")

shinyServer(function(input, output) {
        output$input <- renderText({
                paste0("displacement and weight of your car are ", "<strong>", input$disp, " cu. in. & ", input$wt, " lb, respectively")
        })
        output$result <- renderText({
	data(mtcars)
	model = glm(formula= vs ~ wt + disp, data=mtcars, family=binomial)
	newdata = data.frame(wt = input$wt, disp = input$disp)
	prob = predict(model, newdata, type="response")
                paste0("The predicted probability that your car is a V-engine is ", "<code>", round(prob, 2), "</code>")
        })
                
})