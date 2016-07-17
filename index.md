---
title       : Calculating Probability of a binary outcome using Binary Logistic Regression
subtitle    : Data Product Project on Coursera from Johns Hopkins University
author      : Avirup Sen Gupta
job         : Data Scientist
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---
5.32/9.43


## Project Description

1. A generalized linear model that to  estimate the probability of a vehicle having a `V-engine` or a `straight engine` using the user-defined a weight (lbs) and engine displacement values (cu. inches). 
2. Generalized linear or regression is useful when you are predicting a binary outcome (i.e. `V-engine` or `straight engine` in this example) from a set of continuous predictor variables. 
3. The data for this project (`mtcars`) was published in the *1974 Motor Trend US magazine*, and is comprised of fuel consumption, performance and physical features for 32 automobiles.

--- .class #id 

## Data


```r
data(mtcars)
par(mfrow = c(2, 2))
plot(mtcars$disp, mtcars$vs, xlab = "Displacement (cu. in)", ylab = "Engine type", 
     col ="red", pch = 20)
plot(mtcars$disp, mtcars$vs, xlab = "Weight (1000 lb)", ylab = "Engine type", 
     col ="red", pch = 20)
```

![plot of chunk unnamed-chunk-1](assets/fig/unnamed-chunk-1-1.png)

--- .class #id 

## generalized linear model

```r
  data(mtcars)
	model = glm(formula= vs ~ wt + disp, data=mtcars, family=binomial)
  summary(model)
```

```
## 
## Call:
## glm(formula = vs ~ wt + disp, family = binomial, data = mtcars)
## 
## Deviance Residuals: 
##      Min        1Q    Median        3Q       Max  
## -1.67506  -0.28444  -0.08401   0.57281   2.08234  
## 
## Coefficients:
##             Estimate Std. Error z value Pr(>|z|)  
## (Intercept)  1.60859    2.43903   0.660    0.510  
## wt           1.62635    1.49068   1.091    0.275  
## disp        -0.03443    0.01536  -2.241    0.025 *
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for binomial family taken to be 1)
## 
##     Null deviance: 43.86  on 31  degrees of freedom
## Residual deviance: 21.40  on 29  degrees of freedom
## AIC: 27.4
## 
## Number of Fisher Scoring iterations: 6
```

--- .class #id 

## Making probability prediction
Our goal here is to calculate a predicted probability of a V engine, for specific values of the predictors: 
 1. a weight of 2100 lbs and 
 2. engine displacement of 180 cubic inches.


```r
  wt = 1.2
  disp = 180 
  data(mtcars)
  model = glm(formula= vs ~ wt + disp, data=mtcars, family=binomial)
  newdata = data.frame(wt = wt, disp = disp)
  prob = predict(model, newdata, type="response")
```
The predicted probability is 0.0667416



