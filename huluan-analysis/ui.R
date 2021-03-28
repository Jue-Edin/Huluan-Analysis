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
            menuItem("Chart: Location", tabName = "Charts2", icon = icon("bar-chart-o")),
            menuItem("Summary", tabName = "Summary", icon = icon("th")) # menu Item 2
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
                h3('The valuable insights we gain from visualizing the data of "Drug Abuse" for Canada.'),
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
                h3('Third bar chart: Regarding to this bar plot of total number of drug abusers in different locations, we could compare the number of drug abusers across different provinces in Canada.  The aim is to identify areas in Canada where drug abuse is widespread and to draw public attention to it.'),
                
                
            ),
            
            
            tabItem(
                tabName = "Charts",
                fluidRow(
                    box(width = 8,
                        #title = "Drug_Type",
                        h3(radioButtons("Drug_Type",
                                        "Drug Type", c(
                                            "Benzodiazepines" = "Benzodiazepines",
                                            "Opioids" = "Opioids",
                                            "Stimulants" = "Stimulants",
                                            "GABA"="GABA",
                                            "Illicit drug"="Illicit drug"
                                        ),
                                        selected = "Benzodiazepines",
                                        inline=TRUE))),
                    
                    
                ),
                
                fluidRow(
                    
                    box(width=8,plotlyOutput("distPlot")),
                    box(width=12,
                        h4('1.Our initial assumption was, if a certain gender is more likely to be involved in the drug abuse of a certain drug type. Within the amount of people who claimed to abused drugs, If the visualization of a particular drug type shows any obvious difference between different genders, it is worth to call for a further investigation to see that if this could contribute to alleviate the negative impact raised by increasing drug abuse recent years. The doctors could give their patients more thoroughly considered guides on the specific type of drug and the dose of medications.'),
                        h4('2.After visualizing the relationship between the gender and the drug type, we discover some interesting facts:'),
                        h4('-Except from “Benzodiazepines”, for other 4 drug types, males occupied relatively larger proportion of the total number of drug abusers.'),
                        h4('- The gender difference in drug abuse for the “GABA-analogue” reveals that there may be a certain factor accounts for this difference, for example, different physical mechanism due to the “Gender” factor. Or, purely for guess, we can raise a reasonable assumption that whether Women are more likely to have illness that requires the intake of GABA-analogue, this assumption could be verified by carrying out further investigation.'),
                    )
                    
                    
                    
                )
            ),
            
            
            
            tabItem(
                tabName = "Charts1",
                fluidRow(
                    box(width=8,plotlyOutput("Charts1"),
                    ),
                    box(width=12,
                        h4('1.In this part, we only focus on participants who engaged in non-medical use of five main types of drugs: opioids, benzodiazepines, stimulants, GABA-analogue and illicit drugs during their lifetime at least once. After filtering out the participants who never use drug non-medically, we try to examine that whether there is a relationship between the drug abuse and the age of respondents.'),
                        h4('2.From the graph, we can observe the percentages of different age groups who engaged in drug abuse in four regions. There are a few characteristics can be easily spotted from the plot, the middle-aged group accounts for approximately 50 percent of the total and the elder group accounts for the smallest part in all regions. compared with other three regions, Ontario is the region where more elderly people are engaged in drug abuse based on the dataset, therefore this region may need a closer surveillance of the drug abuse more than other regions. A further study may be required to verify this assumption.'),
                        h4('3.Note that we don’t have data collected from two provinces, Yukon and Nunavut, which are both belong to the “West” region. The possible reasons for the lack of data in these two provinces may be that they both have relatively smaller population (Y-35874, N-38780). This could potentially have impact on the visualization of the data, lead to a less reliable/generalizable result.'),
                        h4('4.In common sense, the most vulnerable group under drug abuse is those elderly people who are more likely to have complications, and for those vulnerable groups we would sensibly assume that they would demand more medical resources and require some extra cares. We are interested in locating the area that has more vulnerable people, because that this area should be closely monitored on their status of drug abuse.'),
                    )
                    
                )
            ),
            
            tabItem(
                tabName = "Charts2",
                fluidRow(
                    box(width=12,plotlyOutput("Charts2")
                    ),
                    
                    box(width=12,
                        h4('Regarding to this bar plot of total number of drug abusers in different locations, we could compare the number of drug abusers across different provinces in Canada. We can see that Quebec has the largest amount of people engaged in drug abuse, and there are two provinces are not plotted here, which are Yukon and Nunavut, as mentioned in the last bar plot, these two provinces have relatively smaller population sizes. Also, Northwest only have 1 drug abuser reported in the survey, this may due to a smaller sample collected from this area. However, we didn’t take into accounts the weights in this bar plot, the difference shown in the plot may not be generalized to the larger population of that area.'),
                        h4('If we could take into accounts the weights and obtain a larger sample in the further study, we may be able to find out if a certain region needs more reinforcements in the drug control, in order to reduce the drug abuse in those areas.'),
                    )
                )
            ),
            
            
            #------------------------------------
            # -----------------------------------
            # Section 4: conclusion
            tabItem(
                tabName = "Summary",
                #------------------------------------
                # -----------------------------------
                # Section 4a: conclusion
                #------------------------------------
                h1("Further Investigation",align="center"),
                h3('•	The majority of drug abusers are middle-aged people, which is a concern, in our further investigation, we found in ‘Drug Abuse Hitting Middle-aged More Than Gen-Xers’  , In Washington, DC, the greatest number of drug deaths-76-occurred in 2004 among persons aged 35 to 54. Among adults aged 45 to 60 and that more than 57% of patients with major depressive disorder suffered from comorbid alcohol or drug use. They all show that middle-age abusers have a higher risk of death and depressive disorder.'),
                h3('•	Even though our result shows except from “Benzodiazepines”, for other 4 drug types, males occupied relatively larger proportion of the total number of drug abusers, from the article ‘SEX DIFFERENCES, GENDER AND ADDICTION’ , ‘among the vulnerable populations, females escalate drug use more rapidly than males and relapse is more likely to be triggered by stressful events or drug-related cues’, which inspires us that we still need give more help to females because of many more barriers to treatment-seeking and engagement, lack of social support for recovery among girls and women.'),
                br(""),
                h3('Reference'),
                h3('1. https://www.psychiatrictimes.com/view/drug-abuse-hitting-middle-aged-more-gen-xers'),
                h3('2. https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5120656/'),

                
                
                
            ) )
        #------------------------------------
    ) )
