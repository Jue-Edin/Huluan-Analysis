#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)
library(plotly)
#------------------------------------
# Section 1: Dashboard Page
#------------------------------------

dashboardPage(
    skin = "black", # changing the color of the dashboard colour
    dashboardHeader(title = "Huluan-Analysis-main"),
    
    dashboardSidebar(
        sidebarMenu(
            #------------------------------------
            # -----------------------------------
            # Section 2a: Main panel Menu Items
            #-----------------------------------
            #"Huluan-Analysis-main",
            #startExpanded = TRUE, # begin with the menu expanded
            menuItem("Welcome", tabName = "Welcome", icon = icon("dashboard")), # menu Item 1
            menuItem("Charts:Drug Type", tabName = "Charts", icon = icon("bar-chart-o")),
            menuItem("Chart: Age Effect", tabName = "Charts1", icon = icon("bar-chart-o")),
            menuItem("Conclusion", tabName = "conclusion", icon = icon("th")) # menu Item 2
        )),
    # -----------------------------------
    # -----------------------------------
    # Section 3: Dashboard body
    #------------------------------------
    dashboardBody(
        tabItems(
            
            
            
            
            tabItem(
                
                tabName = "Welcome",
                #img(src='image2.jpg',height="500", width="1000",align="left"),
                h1("Introduction",align="center"),
                h3('Drug therapy is one of the most effective and convenient ways to treat diseases. However, the phenomenon of irrational drug use, especially drug abuse, is becoming more and more common, which has become a global public health problem. About one-third of the deaths in the world every year are caused by irrational drug use. Our Huluan-Analysis team analyzed the demographic characteristics of drug abusers using the non-medical use data set of the Canadian survey of Non-Medical Use of Prescription Drugs Program (NMURx). We try to analyze the relationship between drug abuse and gender, drug control intensity and age through visual analysis, which may help us to predict drug abuse cases in the future.'),
                br(""),
                #br(""),
                #br(""),
                h1("Topic",align="center"),
                h3('The valuable insights we gain from visualizing the data of "Drug Abuse".'),
                br(""),
                h1("Data",align="center"),
                h3('What we focused on: Our team "Huluan-Analysis" focused on the "drug abuse" data in regarding to "Canada" specifically. We dived into a few demographic characteristics of the participants of the survey, and try to identify some underlying relationship between those demographic variables with the drug abuse. '),
                h3('What we intend to find: We want to find out whether if a certain trait within the demographic variables is correlated to the drug abuse. To uncover some interesting facts about the dataset, which will enable us to propose a further investigation and could potentially provide us invaluable information on how to better allocate the medical resources, as well as giving us an indication on how to identify the more vulnerable group of people under the problem of drug abuse.'),
                br(""),
                h1("Original Intention",align="center"),
                h3('Drug therapy is one of the most effective and convenient ways to treat diseases. However, the phenomenon of irrational drug use, especially drug abuse, is becoming more and more common, which has become a global public health problem. About one-third of the deaths in the world every year are caused by irrational drug use. Our Huluan-Analysis team analyzed the demographic characteristics of drug abusers using the non-medical use data set of the Canadian survey of Non-Medical Use of Prescription Drugs Program (NMURx). We try to analyze the relationship between drug abuse and gender, drug control intensity and age through visual analysis, which may help us to predict drug abuse cases in the future.'),
                br(""),
                strong(h1("Our visualizations",align="center")),
                h3('First bar chart: The bar chart is the main visualization we use to analyze the dataset, the first one is concerned with the gender and the 5 main drug types: prescription opioid API, benzodiazepine, prescription stimulant, GABA-analogue and illicit drugs. These charts are used to detect any gender difference in drug abuse.'),
                h3('Second bar chart: This bar chart is visualizing different age groups against 4 regions in Canada, in the age groups are people who claimed that they have engaged in drug abuse at least once. Aim of this plot is to identify if whether a specific area has more elderly people who are struggling from the negative effects resulted from drug abuse.'),
                
                
            ),
            
            
            tabItem(
                tabName = "Charts",
                fluidRow(
                    box(width = 8,
                        #title = "Drug_Type",
                        h3(radioButtons("Drug_Type",
                                        "Drug Type", c(
                                            "benzodiazepines" = "benzodiazepines",
                                            "opioids" = "opioids",
                                            "stimulants" = "stimulants",
                                            "GABA"="GABA",
                                            "illicit drug"="illicit drug"
                                        ),
                                        selected = "benzodiazepines",
                                        inline=TRUE))),
                    
                    
                ),
                
                fluidRow(
                    
                    box(width=8,plotlyOutput("distPlot"),h2("commnet"))
                    
                    
                    
                )
            ),
            
            
            
            tabItem(
                tabName = "Charts1",
                fluidRow(
                    box(width=8,plotlyOutput("Charts1"),h2("commnet")
                    ))
            ),
            
            
            
            #------------------------------------
            # -----------------------------------
            # Section 4: conclusion
            tabItem(
                tabName = "conclusion",
                #------------------------------------
                # -----------------------------------
                # Section 4a: conclusion
                #------------------------------------
                h2("conclusion")
                
            ) )
        #------------------------------------
    ) )
