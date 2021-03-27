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

# nmsl
bars$DEM_GENDER[bars$DEM_GENDER == 1] <- 1    # The male's are classified as 1
bars$DEM_GENDER[bars$DEM_GENDER == 2] <- 2    # The female's are classified as 1
bars$DEM_GENDER <- factor(bars$DEM_GENDER,    # Change our data to the factor and change label
                          levels=c(1, 2),
                          labels=c("Male", "Female"))

bars$BENZ_NMU_EVER[bars$BENZ_NMU_EVER == 0] <- 0    # ???
bars$BENZ_NMU_EVER[bars$BENZ_NMU_EVER == 1] <- 1    #将男性的归类为1
bars$BENZ_NMU_EVER <- factor(bars$BENZ_NMU_EVER,    #转为factor形式，替换标签
                             levels=c(0,1),
                             labels=c("No","Yes"))

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$distPlot <- renderPlot({
        
        # draw the bar chart with different drugs.
        ggplot(bars, aes(y = DEM_GENDER,
                         fill = BENZ_NMU_EVER)) +
            geom_bar(position = "fill") +
            labs(x = "Highest Degree",
                 y = "Drug Types",
                 fill = "Highest Degree%",
                 title = "To examine if a certain gender has an inclination for drug abuse",
                 subtitle = "with some additional factors"
            )
    })

})
