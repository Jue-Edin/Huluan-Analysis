#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#


library(shiny)

library(ggplot2)
library(readr)
library(plotly)
library(dplyr)

# Bar chart 1.
ca <- read_csv(file = "ca.csv")

bars <- ca %>%
    select(DEM_GENDER, OP_NMU_EVER, BENZ_NMU_EVER, STIM_NMU_EVER, GABA_NMU_EVER, ILL_USE, BENZ_NMU_EVER) %>%
    group_by(DEM_GENDER)

# Change numerical value to string.
bars$DEM_GENDER[bars$DEM_GENDER == 1] <- 1    # Classify Male as 1.
bars$DEM_GENDER[bars$DEM_GENDER == 2] <- 2    # Classify Female as 2.
bars$DEM_GENDER <- factor(bars$DEM_GENDER,    # Change our data to the factor and change label.
                          levels=c(1, 2),
                          labels=c("Male", "Female"))

# Plot the first figure.
bars$BENZ_NMU_EVER[bars$BENZ_NMU_EVER == 0] <- 0    # Classify non-taking as 0.
bars$BENZ_NMU_EVER[bars$BENZ_NMU_EVER == 1] <- 1    # Classify taking as 1.
bars$BENZ_NMU_EVER <- factor(bars$BENZ_NMU_EVER,    # Change our data to the factor and change label.
                             levels=c(0, 1),
                             labels=c("No", "Yes"))

# Plot the second figure.
bars$OP_NMU_EVER[bars$OP_NMU_EVER == 0] <- 0    # Classify non-taking as 0.
bars$OP_NMU_EVER[bars$OP_NMU_EVER == 1] <- 1    # Classify taking as 1.
bars$OP_NMU_EVER <- factor(bars$OP_NMU_EVER,    # Change our data to the factor and change label.
                           levels=c(0, 1),
                           labels=c("No", "Yes"))

# Plot the third figure.
bars$STIM_NMU_EVER[bars$STIM_NMU_EVER == 0] <- 0    # Classify non-taking as 0.
bars$STIM_NMU_EVER[bars$STIM_NMU_EVER == 1] <- 1    # Classify taking as 1.
bars$STIM_NMU_EVER <- factor(bars$STIM_NMU_EVER,    # Change our data to the factor and change label.
                             levels=c(0, 1),
                             labels=c("No", "Yes"))

# Plot the fourth figure.
bars$GABA_NMU_EVER[bars$GABA_NMU_EVER == 0] <- 0    # Classify non-taking as 0.
bars$GABA_NMU_EVER[bars$GABA_NMU_EVER == 1] <- 1    # Classify taking as 1.
bars$GABA_NMU_EVER <- factor(bars$GABA_NMU_EVER,    # Change our data to the factor and change label.
                             levels=c(0, 1),
                             labels=c("No", "Yes"))

# Plot the fifth figure.
bars$ILL_USE[bars$ILL_USE == 0] <- 0    # Classify non-taking as 0.
bars$ILL_USE[bars$ILL_USE == 1] <- 1    # Classify taking as 1.
bars$ILL_USE <- factor(bars$ILL_USE,    # Change our data to the factor and change label.
                       levels=c(0, 1),
                       labels=c("No", "Yes"))



age <- ca %>%
    filter(
        OP_NMU_EVER == 1|BENZ_NMU_EVER == 1|STIM_NMU_EVER == 1| GABA_NMU_EVER == 1|ILL_USE == 1
    ) %>%
    select(DEM_REGION, DEM_AGE) 

# change the type of variable DEM_REGION
age$DEM_REGION[bars$DEM_REGION == 1] <- 1    
age$DEM_REGION[bars$DEM_REGION == 2] <- 2 
age$DEM_REGION[bars$DEM_REGION == 3] <- 3    
age$DEM_REGION[bars$DEM_REGION == 4] <- 4
age$DEM_REGION <- factor(age$DEM_REGION,    
                         levels=c(1, 2, 3, 4),
                         labels=c("Atlantic", "Quebec", "Ontario", "West"))

# create a age categories
attach(age)
age$age_compare[DEM_AGE > 65] <- "Elder"
age$age_compare[DEM_AGE > 35 & DEM_AGE <= 65] <- "Middle Aged"
age$age_compare[DEM_AGE <= 35] <- "Young"
detach(age)


#chart3


location <- ca %>%
    filter(
        OP_NMU_EVER == 1|BENZ_NMU_EVER == 1|STIM_NMU_EVER == 1| GABA_NMU_EVER == 1|ILL_USE == 1
    ) %>%
    select(DEM_LOCATION)

location_vs_pop <- ca %>%
    filter(
        OP_NMU_EVER == 1|BENZ_NMU_EVER == 1|STIM_NMU_EVER == 1| GABA_NMU_EVER == 1|ILL_USE == 1
    ) %>%
    select(DEM_LOCATION) %>%
    group_by(DEM_LOCATION) %>%summarise(pop = n())

location_vs_pop$DEM_LOCATION[location_vs_pop$DEM_LOCATION == 1] <- 1    
location_vs_pop$DEM_LOCATION[location_vs_pop$DEM_LOCATION == 2] <- 2  
location_vs_pop$DEM_LOCATION[location_vs_pop$DEM_LOCATION == 3] <- 3    
location_vs_pop$DEM_LOCATION[location_vs_pop$DEM_LOCATION == 4] <- 4
location_vs_pop$DEM_LOCATION[location_vs_pop$DEM_LOCATION == 5] <- 5    
location_vs_pop$DEM_LOCATION[location_vs_pop$DEM_LOCATION == 6] <- 6
location_vs_pop$DEM_LOCATION[location_vs_pop$DEM_LOCATION == 7] <- 7    
location_vs_pop$DEM_LOCATION[location_vs_pop$DEM_LOCATION == 8] <- 8
location_vs_pop$DEM_LOCATION[location_vs_pop$DEM_LOCATION == 9] <- 9    
location_vs_pop$DEM_LOCATION[location_vs_pop$DEM_LOCATION == 10] <- 10
location_vs_pop$DEM_LOCATION[location_vs_pop$DEM_LOCATION == 11] <- 11
location_vs_pop$DEM_LOCATION[location_vs_pop$DEM_LOCATION == 12] <- 12
location_vs_pop$DEM_LOCATION[location_vs_pop$DEM_LOCATION == 13] <- 13
location_vs_pop$DEM_LOCATION <- factor(location_vs_pop$DEM_LOCATION,    
                                       levels=c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13),
                                       labels=c("Newfoundland and Labrador", "Nova Scotia" ,
                                                "Prince Edward Island", "New Brunswick", "Quebec",
                                                "Ontario", "Manitoba",
                                                "Saskatchewan", "Alberta", "British Columbia", "Yukon",
                                                "Nunavut","Northwest"))

location$DEM_LOCATION[location$DEM_LOCATION == 1] <- 1    
location$DEM_LOCATION[location$DEM_LOCATION == 2] <- 2  
location$DEM_LOCATION[location$DEM_LOCATION == 3] <- 3    
location$DEM_LOCATION[location$DEM_LOCATION == 4] <- 4
location$DEM_LOCATION[location$DEM_LOCATION == 5] <- 5    
location$DEM_LOCATION[location$DEM_LOCATION == 6] <- 6
location$DEM_LOCATION[location$DEM_LOCATION == 7] <- 7    
location$DEM_LOCATION[location$DEM_LOCATION == 8] <- 8
location$DEM_LOCATION[location$DEM_LOCATION == 9] <- 9    
location$DEM_LOCATION[location$DEM_LOCATION == 10] <- 10
location$DEM_LOCATION[location$DEM_LOCATION == 11] <- 11
location$DEM_LOCATION[location$DEM_LOCATION == 12] <- 12
location$DEM_LOCATION[location$DEM_LOCATION == 13] <- 13
location$DEM_LOCATION <- factor(location$DEM_LOCATION,    
                                levels=c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13),
                                labels=c("Newfoundland and Labrador", "Nova Scotia" ,
                                         "Prince Edward Island", "New Brunswick", "Quebec",
                                         "Ontario", "Manitoba",
                                         "Saskatchewan", "Alberta", "British Columbia", "Yukon",
                                         "Nunavut","Northwest"))




# Define server logic required to draw figures.
function(input, output) {
    #datasetInput <- reactive(input$Drug_Type)
    #print (datasetInput)
    
    output$Charts1<-renderPlotly(
        ggplot(age, aes(y = DEM_REGION,
                        fill = age_compare)) +
            geom_bar(position = "fill") +
            labs(x = "Percentage of different age groups who engaged in drug abuse",
                 y = "Four regions",
                 fill = "Age groups",
                 title = "To examine if age has effects on drug abuse"
            )+theme(plot.title = element_text(hjust = 0.5,size=20))
        
        
    )
    
    output$Charts2<-renderPlotly(
        ggplot(location, aes(x = DEM_LOCATION)) +
            geom_bar() +
            labs(x = "Location",
                 y = "Count",
                 title = "Number of drug abusers in different locations "
            )+theme(plot.title = element_text(hjust = 0.5,size=20),axis.text.x = element_text(angle=30))
        #,axis.text.x = element_text(angle=45)
        
        
    )
    
    
    # Finally print our plots.
    output$distPlot <- renderPlotly(
        {
            if(input$Drug_Type == "Benzodiazepines"){
                p <- ggplot(bars, aes(y = BENZ_NMU_EVER,
                                      fill = DEM_GENDER)) +
                    geom_bar(position = "fill") +
                    labs(x = "Percentage",
                         y = "Drug Type: Benzodiazepine",
                         fill = "Gender%",
                         title = "To examine if a certain gender has an inclination for drug abuse")+
                    theme(plot.title = element_text(hjust = 0.5,size=15))
            }
            if(input$Drug_Type == "Opioids"){
                p <- ggplot(bars, aes(y = OP_NMU_EVER,
                                      fill = DEM_GENDER)) +
                    geom_bar(position = "fill") +
                    labs(x = "Percentage",
                         y = "Drug Type: Opioids",
                         fill = "Gender%",
                         title = "To examine if a certain gender has an inclination for drug abuse")+
                    theme(plot.title = element_text(hjust = 0.5,size=15))
            }
            if(input$Drug_Type == "Stimulants"){
                p <- ggplot(bars, aes(y = STIM_NMU_EVER,
                                      fill = DEM_GENDER)) +
                    geom_bar(position = "fill") +
                    labs(x = "Percentage",
                         y = "Drug Type: Stimulants",
                         fill = "Gender%",
                         title = "To examine if a certain gender has an inclination for drug abuse")+
                    theme(plot.title = element_text(hjust = 0.5,size=15))
            }
            if(input$Drug_Type == "GABA"){
                p <- ggplot(bars, aes(y = GABA_NMU_EVER,
                                      fill = DEM_GENDER)) +
                    geom_bar(position = "fill") +
                    labs(x = "Percentage",
                         y = "Drug Type: GABA",
                         fill = "Gender%",
                         title = "To examine if a certain gender has an inclination for drug abuse")+
                    theme(plot.title = element_text(hjust = 0.5,size=15))
            }
            if(input$Drug_Type == "Illicit drug"){
                p <- ggplot(bars, aes(y = ILL_USE,
                                      fill = DEM_GENDER)) +
                    geom_bar(position = "fill") +
                    labs(x = "Percentage",
                         y = "Drug Type: Illicit drug",
                         fill = "Gender%",
                         title = "To examine if a certain gender has an inclination for drug abuse")+
                    theme(plot.title = element_text(hjust = 0.5,size=15))
            }
            plotly_build(p)
        })
}


#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

library(ggplot2)
library(readr)
library(plotly)
library(dplyr)

# Bar chart 1.
ca <- read_csv(file = "ca.csv")

bars <- ca %>%
    select(DEM_GENDER, OP_NMU_EVER, BENZ_NMU_EVER, STIM_NMU_EVER, GABA_NMU_EVER, ILL_USE, BENZ_NMU_EVER) %>%
    group_by(DEM_GENDER)

# Change numerical value to string.
bars$DEM_GENDER[bars$DEM_GENDER == 1] <- 1    # Classify Male as 1.
bars$DEM_GENDER[bars$DEM_GENDER == 2] <- 2    # Classify Female as 2.
bars$DEM_GENDER <- factor(bars$DEM_GENDER,    # Change our data to the factor and change label.
                          levels=c(1, 2),
                          labels=c("Male", "Female"))

# Plot the first figure.
bars$BENZ_NMU_EVER[bars$BENZ_NMU_EVER == 0] <- 0    # Classify non-taking as 0.
bars$BENZ_NMU_EVER[bars$BENZ_NMU_EVER == 1] <- 1    # Classify taking as 1.
bars$BENZ_NMU_EVER <- factor(bars$BENZ_NMU_EVER,    # Change our data to the factor and change label.
                             levels=c(0, 1),
                             labels=c("No", "Yes"))

# Plot the second figure.
bars$OP_NMU_EVER[bars$OP_NMU_EVER == 0] <- 0    # Classify non-taking as 0.
bars$OP_NMU_EVER[bars$OP_NMU_EVER == 1] <- 1    # Classify taking as 1.
bars$OP_NMU_EVER <- factor(bars$OP_NMU_EVER,    # Change our data to the factor and change label.
                           levels=c(0, 1),
                           labels=c("No", "Yes"))

# Plot the third figure.
bars$STIM_NMU_EVER[bars$STIM_NMU_EVER == 0] <- 0    # Classify non-taking as 0.
bars$STIM_NMU_EVER[bars$STIM_NMU_EVER == 1] <- 1    # Classify taking as 1.
bars$STIM_NMU_EVER <- factor(bars$STIM_NMU_EVER,    # Change our data to the factor and change label.
                             levels=c(0, 1),
                             labels=c("No", "Yes"))

# Plot the fourth figure.
bars$GABA_NMU_EVER[bars$GABA_NMU_EVER == 0] <- 0    # Classify non-taking as 0.
bars$GABA_NMU_EVER[bars$GABA_NMU_EVER == 1] <- 1    # Classify taking as 1.
bars$GABA_NMU_EVER <- factor(bars$GABA_NMU_EVER,    # Change our data to the factor and change label.
                             levels=c(0, 1),
                             labels=c("No", "Yes"))

# Plot the fifth figure.
bars$ILL_USE[bars$ILL_USE == 0] <- 0    # Classify non-taking as 0.
bars$ILL_USE[bars$ILL_USE == 1] <- 1    # Classify taking as 1.
bars$ILL_USE <- factor(bars$ILL_USE,    # Change our data to the factor and change label.
                       levels=c(0, 1),
                       labels=c("No", "Yes"))



age <- ca %>%
    filter(
        OP_NMU_EVER == 1|BENZ_NMU_EVER == 1|STIM_NMU_EVER == 1| GABA_NMU_EVER == 1|ILL_USE == 1
    ) %>%
    select(DEM_REGION, DEM_AGE) 

# change the type of variable DEM_REGION
age$DEM_REGION[bars$DEM_REGION == 1] <- 1    
age$DEM_REGION[bars$DEM_REGION == 2] <- 2 
age$DEM_REGION[bars$DEM_REGION == 3] <- 3    
age$DEM_REGION[bars$DEM_REGION == 4] <- 4
age$DEM_REGION <- factor(age$DEM_REGION,    
                         levels=c(1, 2, 3, 4),
                         labels=c("Atlantic", "Quebec", "Ontario", "West"))

# create a age categories
attach(age)
age$age_compare[DEM_AGE > 65] <- "Elder"
age$age_compare[DEM_AGE > 35 & DEM_AGE <= 65] <- "Middle Aged"
age$age_compare[DEM_AGE <= 35] <- "Young"
detach(age)


#chart3


location <- ca %>%
    filter(
        OP_NMU_EVER == 1|BENZ_NMU_EVER == 1|STIM_NMU_EVER == 1| GABA_NMU_EVER == 1|ILL_USE == 1
    ) %>%
    select(DEM_LOCATION)

location_vs_pop <- ca %>%
    filter(
        OP_NMU_EVER == 1|BENZ_NMU_EVER == 1|STIM_NMU_EVER == 1| GABA_NMU_EVER == 1|ILL_USE == 1
    ) %>%
    select(DEM_LOCATION) %>%
    group_by(DEM_LOCATION) %>%summarise(pop = n())

location_vs_pop$DEM_LOCATION[location_vs_pop$DEM_LOCATION == 1] <- 1    
location_vs_pop$DEM_LOCATION[location_vs_pop$DEM_LOCATION == 2] <- 2  
location_vs_pop$DEM_LOCATION[location_vs_pop$DEM_LOCATION == 3] <- 3    
location_vs_pop$DEM_LOCATION[location_vs_pop$DEM_LOCATION == 4] <- 4
location_vs_pop$DEM_LOCATION[location_vs_pop$DEM_LOCATION == 5] <- 5    
location_vs_pop$DEM_LOCATION[location_vs_pop$DEM_LOCATION == 6] <- 6
location_vs_pop$DEM_LOCATION[location_vs_pop$DEM_LOCATION == 7] <- 7    
location_vs_pop$DEM_LOCATION[location_vs_pop$DEM_LOCATION == 8] <- 8
location_vs_pop$DEM_LOCATION[location_vs_pop$DEM_LOCATION == 9] <- 9    
location_vs_pop$DEM_LOCATION[location_vs_pop$DEM_LOCATION == 10] <- 10
location_vs_pop$DEM_LOCATION[location_vs_pop$DEM_LOCATION == 11] <- 11
location_vs_pop$DEM_LOCATION[location_vs_pop$DEM_LOCATION == 12] <- 12
location_vs_pop$DEM_LOCATION[location_vs_pop$DEM_LOCATION == 13] <- 13
location_vs_pop$DEM_LOCATION <- factor(location_vs_pop$DEM_LOCATION,    
                                       levels=c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13),
                                       labels=c("Newfoundland and Labrador", "Nova Scotia" ,
                                                "Prince Edward Island", "New Brunswick", "Quebec",
                                                "Ontario", "Manitoba",
                                                "Saskatchewan", "Alberta", "British Columbia", "Yukon",
                                                "Nunavut","Northwest"))

location$DEM_LOCATION[location$DEM_LOCATION == 1] <- 1    
location$DEM_LOCATION[location$DEM_LOCATION == 2] <- 2  
location$DEM_LOCATION[location$DEM_LOCATION == 3] <- 3    
location$DEM_LOCATION[location$DEM_LOCATION == 4] <- 4
location$DEM_LOCATION[location$DEM_LOCATION == 5] <- 5    
location$DEM_LOCATION[location$DEM_LOCATION == 6] <- 6
location$DEM_LOCATION[location$DEM_LOCATION == 7] <- 7    
location$DEM_LOCATION[location$DEM_LOCATION == 8] <- 8
location$DEM_LOCATION[location$DEM_LOCATION == 9] <- 9    
location$DEM_LOCATION[location$DEM_LOCATION == 10] <- 10
location$DEM_LOCATION[location$DEM_LOCATION == 11] <- 11
location$DEM_LOCATION[location$DEM_LOCATION == 12] <- 12
location$DEM_LOCATION[location$DEM_LOCATION == 13] <- 13
location$DEM_LOCATION <- factor(location$DEM_LOCATION,    
                                levels=c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13),
                                labels=c("Newfoundland and Labrador", "Nova Scotia" ,
                                         "Prince Edward Island", "New Brunswick", "Quebec",
                                         "Ontario", "Manitoba",
                                         "Saskatchewan", "Alberta", "British Columbia", "Yukon",
                                         "Nunavut","Northwest"))




# Define server logic required to draw figures.
function(input, output) {
    #datasetInput <- reactive(input$Drug_Type)
    #print (datasetInput)
    
    output$Charts1<-renderPlotly(
        ggplot(age, aes(y = DEM_REGION,
                        fill = age_compare)) +
            geom_bar(position = "fill") +
            labs(x = "Percentage of different age groups who engaged in drug abuse",
                 y = "Four regions",
                 fill = "Age groups",
                 title = "To examine if age has effects on drug abuse"
            )+theme(plot.title = element_text(hjust = 0.5,size=20))
        
        
    )
    
    output$Charts2<-renderPlotly(
        ggplot(location, aes(x = DEM_LOCATION)) +
            geom_bar() +
            labs(x = "Location",
                 y = "Count",
                 title = "Number of drug abusers in different locations "
            )+theme(plot.title = element_text(hjust = 0.5,size=20))
        #,axis.text.x = element_text(angle=45)
        
        
    )
    
    
    # Finally print our plots.
    output$distPlot <- renderPlotly(
        {
            if(input$Drug_Type == "Benzodiazepines"){
                p <- ggplot(bars, aes(y = BENZ_NMU_EVER,
                                      fill = DEM_GENDER)) +
                    geom_bar(position = "fill") +
                    labs(x = "Percentage",
                         y = "Drug Type: Benzodiazepine",
                         fill = "Gender%",
                         title = "To examine if a certain gender has an inclination for drug abuse")+
                    theme(plot.title = element_text(hjust = 0.5,size=15))
            }
            if(input$Drug_Type == "Opioids"){
                p <- ggplot(bars, aes(y = OP_NMU_EVER,
                                      fill = DEM_GENDER)) +
                    geom_bar(position = "fill") +
                    labs(x = "Percentage",
                         y = "Drug Type: Opioids",
                         fill = "Gender%",
                         title = "To examine if a certain gender has an inclination for drug abuse")+
                    theme(plot.title = element_text(hjust = 0.5,size=15))
            }
            if(input$Drug_Type == "Stimulants"){
                p <- ggplot(bars, aes(y = STIM_NMU_EVER,
                                      fill = DEM_GENDER)) +
                    geom_bar(position = "fill") +
                    labs(x = "Percentage",
                         y = "Drug Type: Stimulants",
                         fill = "Gender%",
                         title = "To examine if a certain gender has an inclination for drug abuse")+
                    theme(plot.title = element_text(hjust = 0.5,size=15))
            }
            if(input$Drug_Type == "GABA"){
                p <- ggplot(bars, aes(y = GABA_NMU_EVER,
                                      fill = DEM_GENDER)) +
                    geom_bar(position = "fill") +
                    labs(x = "Percentage",
                         y = "Drug Type: GABA",
                         fill = "Gender%",
                         title = "To examine if a certain gender has an inclination for drug abuse")+
                    theme(plot.title = element_text(hjust = 0.5,size=15))
            }
            if(input$Drug_Type == "Illicit drug"){
                p <- ggplot(bars, aes(y = ILL_USE,
                                      fill = DEM_GENDER)) +
                    geom_bar(position = "fill") +
                    labs(x = "Percentage",
                         y = "Drug Type: Illicit drug",
                         fill = "Gender%",
                         title = "To examine if a certain gender has an inclination for drug abuse")+
                    theme(plot.title = element_text(hjust = 0.5,size=15))
            }
            plotly_build(p)
        })
}


