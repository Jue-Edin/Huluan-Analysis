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
bars$OP_NMU_EVER[bars$OP_NMU_EVER == 0] <- 0    # Classify non-taking as 0.
bars$OP_NMU_EVER[bars$OP_NMU_EVER == 1] <- 1    # Classify taking as 1.
bars$OP_NMU_EVER <- factor(bars$OP_NMU_EVER,    # Change our data to the factor and change label.
                           levels=c(0,1),
                           labels=c("No","Yes"))

# Plot the second figure.
bars$BENZ_NMU_EVER[bars$BENZ_NMU_EVER == 0] <- 0    # Classify non-taking as 0.
bars$BENZ_NMU_EVER[bars$BENZ_NMU_EVER == 1] <- 1    # Classify taking as 1.
bars$BENZ_NMU_EVER <- factor(bars$BENZ_NMU_EVER,    # Change our data to the factor and change label.
                             levels=c(0,1),
                             labels=c("No","Yes"))

# Plot the third figure.
bars$STIM_NMU_EVER[bars$STIM_NMU_EVER == 0] <- 0    # Classify non-taking as 0.
bars$STIM_NMU_EVER[bars$STIM_NMU_EVER == 1] <- 1    # Classify taking as 1.
bars$STIM_NMU_EVER <- factor(bars$STIM_NMU_EVER,    # Change our data to the factor and change label.
                             levels=c(0,1),
                             labels=c("No","Yes"))

# Plot the fourth figure.
bars$GABA_NMU_EVER[bars$GABA_NMU_EVER == 0] <- 0    # Classify non-taking as 0.
bars$GABA_NMU_EVER[bars$GABA_NMU_EVER == 1] <- 1    # Classify taking as 1.
bars$GABA_NMU_EVER <- factor(bars$GABA_NMU_EVER,    # Change our data to the factor and change label.
                             levels=c(0,1),
                             labels=c("No","Yes"))

# Plot the fifth figure.
bars$ILL_USE[bars$ILL_USE == 0] <- 0    # Classify non-taking as 0.
bars$ILL_USE[bars$ILL_USE == 1] <- 1    # Classify taking as 1.
bars$ILL_USE <- factor(bars$ILL_USE,    # Change our data to the factor and change label.
                       levels=c(0,1),
                       labels=c("No","Yes"))

# Define server logic required to draw a histogram.
shinyServer(function(input, output) {

    output$distPlot <- renderPlot({
        datasetInput <- reactive({
            switch(input$bars,
                   "OP_NMU_EVER" = opioids,
                   "BENZ_NMU_EVER" = benzodiazepines,
                   "STIM_NMU_EVER" = stimulants,
                   "GABA_NMU_EVER" = GABA,
                   "ILL_USE" = illicit_drugs)
        })
        
        
        # Draw the bar chart with different drugs.
        # Draw the first one.
        ggplot(bars, aes(y = BENZ_NMU_EVER,
                         fill = DEM_GENDER)) +
            geom_bar(position = "fill") +
            labs(x = "Percentage",
                 y = "Drug type: benzodiazepine",
                 fill = "Gender%",
                 title = "To examine if a certain gender has an inclination for drug abuse"
            )
        ggplot(bars, aes(y = BENZ_NMU_EVER,
                         fill = DEM_GENDER)) +
            geom_bar(position = "fill") +
            labs(x = "Percentage",
                 y = "Drug type: benzodiazepine",
                 fill = "Gender%",
                 title = "To examine if a certain gender has an inclination for drug abuse"
            )
        ggplot(bars, aes(y = BENZ_NMU_EVER,
                         fill = DEM_GENDER)) +
            geom_bar(position = "fill") +
            labs(x = "Percentage",
                 y = "Drug type: benzodiazepine",
                 fill = "Gender%",
                 title = "To examine if a certain gender has an inclination for drug abuse"
            )
        ggplot(bars, aes(y = BENZ_NMU_EVER,
                         fill = DEM_GENDER)) +
            geom_bar(position = "fill") +
            labs(x = "Percentage",
                 y = "Drug type: benzodiazepine",
                 fill = "Gender%",
                 title = "To examine if a certain gender has an inclination for drug abuse"
            )
        ggplot(bars, aes(y = BENZ_NMU_EVER,
                         fill = DEM_GENDER)) +
            geom_bar(position = "fill") +
            labs(x = "Percentage",
                 y = "Drug type: benzodiazepine",
                 fill = "Gender%",
                 title = "To examine if a certain gender has an inclination for drug abuse"
            )
    })

})
