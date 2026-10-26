library(shiny)

# Define the UI for horizontal mode
horizontal_ui <- fluidPage(
  tags$style(HTML("
    .title-section {
      background-color: navy;
      color: white;
      padding: 10px;  /* Inside space */
      margin: 0;   /* No margin for the outside space */
    }
    .title-section h1, .title-section h2, .title-section h3, .title-section h4 {
      margin: 0;
    }
    .header-columns {
      display: flex;
      justify-content: space-between;
    }
    .header-left {
      flex: 10;
    }
    .header-right {
      flex: 2;
      display: flex;
      align-items: center;
      justify-content: center;
    }
    .columns-section {
      display: flex;
      justify-content: space-between;
      margin-top: 20px; /* Vertical space between columns */
    }
    .column {
      flex: 1;
      padding: 10px;
      box-sizing: border-box;
      margin-right: 10px; /* Space between columns */
    }
    .column:last-child {
      margin-right: 0; /* No margin for the last column */
    }
    .column-1, .column-2 {
      background-color: lightblue;
    }
    .column-3, .column-4 {
      background-color: lightgreen;
    }
    .column-title {
      font-weight: bold;
      font-size: 1.5em; /* Increased font size for column titles */
      margin-top: 0; /* Remove space above title */
    }
    .line-before {
      border-bottom: 3px solid black; /* Thicker black line */
      margin: 0; /* No margin */
    }
    .header-line-before {
      border-bottom: 3px solid white; /* Thicker white line */
      margin: 0; /* No margin */
    }
    .footnote {
      font-size: 1.1em;
      text-align: center;
      margin-top: 20px;
    }
    .copyright {
      font-size: 1.1em;
      text-align: center;
      font-style: italic; /* Italicized copyright line */
      margin-top: 10px;
    }
    .orcid {
      font-size: 1.1em;
      text-align: center;
      color: white;
      font-style: italic;
      margin-top: 10px;
    }
    .conditional-text {
      font-style: italic;
    }
    .suggestion-text {
      font-size: 1.2em; /* Increased font size for suggestions */
      margin-top: 20px; /* Add a blank line before suggestions */
    }
  ")),

  div(class = "title-section",
      div(class = "header-columns",
          div(class = "header-left",
              div(class = "header-line-before"), # Thicker white line before main title
              h2("Statistical Technique Advisor", align = "center", style = "font-weight: bold;"),
              h3("(STA 3.3)", align = "center", style = "font-weight: bold;"),
              br(),
              p("\u00A9 November 2024, designed and coded by Ergul Demir", class = "copyright"),
              p(a(href = "https://orcid.org/0000-0002-3708-8013", "ORCID: 0000-0002-3708-8013", class = "orcid"), class = "orcid"),
              div(class = "header-line-before"), # Thicker white line after ORCID line
              br(),
              p(em("This application aims to support you in finding the appropriate statistical technique depending on 
                   your analysis purpose and the characteristics of your data. You can receive recommendations and brief explanations 
                   after completing the module selection and follow-up questions below."))
          )
      )
  ),

  div(class = "columns-section",
      div(class = "column column-1",
          div(class = "line-before"), # Thicker black line before column title
          div(class = "column-title", "Modules"),
          div(class = "line-before"), # Thicker black line after column title
          br(),
          selectInput("module", "Choose the appropriate module for your purpose of analysis",
                      choices = c("Select a module...",
                                  "Module 1. Analyzing the text documents",
                                  "Module 2. Checking the basic assumptions",
                                  "Module 3. Comparison of independent groups",
                                  "Module 4. Testing the effects in an experimental design",
                                  "Module 5. Analyzing the longitudinal data or repeated measurements",
                                  "Module 6. Correlations between variables",
                                  "Module 7. Predicting outcomes or group memberships",
                                  "Module 8. Data reduction",
                                  "Module 9. Scaling or Re-Scaling",
                                  "Module 10. Item and test analyses in scale development and adaptation"),
                      selected = NULL),

          # Conditional explanation text based on selected module
          conditionalPanel(
            condition = "input.module == 'Module 1. Analyzing the text documents'",
            p("Note: I assume you have gathered a certain amount of documents from observation forms, interview forms or 
                just from related literature such as articles, books, newspapers, etc.", class = "conditional-text")
          ),
          conditionalPanel(
            condition = "input.module == 'Module 2. Checking the basic assumptions'",
            p("Note: I assume you have prior knowledge of what assumptions you need to check and that you have sufficient sample 
               size (preferably more than 20 observations) to check them with hypothesis tests.", class = "conditional-text")
          ),
          conditionalPanel(
            condition = "input.module == 'Module 3. Comparison of independent groups'",
            p("Note: I assume, at least, you have one continuous dependent variable (DV) and one discrete independent variable (IV). 
                Also, you may have one or more covariates.", class = "conditional-text")
          ),
          conditionalPanel(
            condition = "input.module == 'Module 4. Testing the effects in an experimental design'",
            p("Note: I assume you are proficient for designing an experiment and intend to test specific effects such as between 
                and/or within subject effects.", class = "conditional-text")
          ),
          conditionalPanel(
            condition = "input.module == 'Module 5. Analyzing the longitudinal data or repeated measurements'",
            p("Note: I assume you are familiar with the concepts of panel, cohort and trend designs. And for such designs I assume 
                you do repeated measurements at different time points.", class = "conditional-text")
          ),
          conditionalPanel(
            condition = "input.module == 'Module 6. Correlations between variables'",
            p("Note: I assume you are investigating relationships or associations between different variables or groups of variables.", 
               class = "conditional-text")
          ),
          conditionalPanel(
            condition = "input.module == 'Module 7. Predicting outcomes or group memberships'",
            p("Note: I assume you want to structure a prediction model with continuous or discrete dependent variables or outcomes.", 
               class = "conditional-text")
          ),
          conditionalPanel(
            condition = "input.module == 'Module 8. Data reduction'",
            p("Note: I assume you have a dataset containing indicator variables or items associated with a latent structure.", 
               class = "conditional-text")
          ),
          conditionalPanel(
            condition = "input.module == 'Module 9. Scaling or Re-Scaling'",
            p("Note: I assume you are interested in scaling or rescaling variables for different purposes. 
               For general information about scaling/re-scaling techniques, see the brief explanations in the last column.", 
               class = "conditional-text")
          ),
          conditionalPanel(
            condition = "input.module == 'Module 10. Item and test analyses in scale development and adaptation'",
            p("Note: I assume you are evaluating the reliability and validity of a test in the process of scale development or 
                adaptation.", class = "conditional-text"),
            p("Also, this module only includes techniques classified under a limited number of conditions.", 
               class = "conditional-text")
          )
      ),
      div(class = "column column-2",
          div(class = "line-before"), # Thicker black line before column title
          div(class = "column-title", "Follow-Up Inquiries"),
          div(class = "line-before"), # Thicker black line after column title,
          br(),

          # Add conditional explanation for follow up section
          conditionalPanel(
            condition = "input.module == 'Select a module...'",
            p("Please select a module first to proceed the follow-up inquiries.")
          ),

          # Add conditional follow-up inquiries for Module 1
          conditionalPanel(
            condition = "input.module == 'Module 1. Analyzing the text documents'",
            selectInput("doc_pool_size", "How large is your document pool?",
                        choices = c("Select size...", "Small", "Medium", "Large", "Very large")),
            conditionalPanel(
              condition = "input.doc_pool_size != 'Select size...'",
              selectInput("themes_clear", "Are your themes or topics clear?",
                          choices = c("Select clarity...", "Clear", "Unclear"))
            )
          ),

          # Add conditional follow-up inquiries for Module 2
          conditionalPanel(
            condition = "input.module == 'Module 2. Checking the basic assumptions'",
            selectInput("assumption_check", "Which assumption do you need to check?",
                        choices = c("Select one...", 
                                    "Normality", "Multivariate normality", 
                                    "Homogeneity of variances (Homoscedasticity)", 
                                    "Homogeneity of variance-covariance matrices", 
                                    "Linearity", "Multivariate linearity", 
                                    "Independence of residuals (Autocorrelation)", "Sphericity", 
                                    "Outliers", "Missing value pattern"))
          ),

          # Add conditional follow-up inquiries for Module 3
          conditionalPanel(
            condition = "input.module == 'Module 3. Comparison of independent groups'",
            selectInput("number_of_dv", "How many dependent variables do you have?",
                        choices = c("Select the number of DVs...", "Single", "Multiple")),
            conditionalPanel(
              condition = "input.number_of_dv != 'Select the number of DVs...'",
              selectInput("number_of_group", "How many groups do you intend to compare?",
                          choices = c("Select the number of groups...", "Just two groups", "Three or more groups")),
              conditionalPanel(
                condition = "input.number_of_group != 'Select the number of groups...'",
                selectInput("existence_of_cv", "Do you have any covariates?", choices = c("Select one...", "No", "Yes"))
               )
             )
           ),

          # Add conditional follow-up inquiries for Module 4
          conditionalPanel(
            condition = "input.module == 'Module 4. Testing the effects in an experimental design'",
            selectInput("experiment_design", "What kind of experimental design do you have according to the number of groups?",
                        choices = c("Select the design...", "Single-subject", "One-group", "Multi-group")),
            conditionalPanel(
              condition = "input.experiment_design != 'Select the design...' && input.experiment_design != 'Single-subject'",
              selectInput("experiment_dv", "How many dependent variables are in your experimental design?",
                          choices = c("Select the number of DVs...", "1", "2 or more")),
              conditionalPanel(
                condition = "input.experiment_dv != 'Select the number of DVs...'",
                selectInput("experiment_measures", "How many repeated tests or measurements are in your experimental design?", 
                            choices = c("Select the test types...", 
                                        "Posttest only", 
                                        "Pretest - Posttest", 
                                        "3 or more repeated tests")),
                conditionalPanel(
                  condition = "input.experiment_measures != 'Select the test types...'",
                  selectInput("experiment_cv", "Are there any covariates in your experimental design, except pretest?", 
                              choices = c("Select one...", "No", "Yes")),
                  conditionalPanel(
                    condition = "input.experiment_cv == 'No'",
                    p("Reminder: You should consider using covariates to control for possible biases, especially when your design 
                       is not randomized.", class = "conditional-text")
                   )
                 )
               )
             )
           ),

          # Add conditional follow-up inquiries for Module 5
          conditionalPanel(
            condition = "input.module == 'Module 5. Analyzing the longitudinal data or repeated measurements'",
            selectInput("purpose_of_rm", "What is your purpose of longitudinal data analysis?",
                        choices = c("Select your purpose...", 
                                    "1.Examine changes in a single dependent variable within the same group over time",
                                    "2.Examine changes in a dependent variable across multiple groups over time",
                                    "3.Analyze multiple dependent variables over time within a group",
                                    "4.Analyze multiple dependent variables across groups over time",
                                    "5.Structural model relationships between latent and manifest variables over time",
                                    "6.Examine trends and patterns in descriptive measures (such as mean or median) over time",
                                    "7.Analyze population-averaged effects with correlated data"))
          ),

          # Add conditional follow-up inquiries for Module 6
          conditionalPanel(
            condition = "input.module == 'Module 6. Correlations between variables'",
            selectInput("type_corr", "Which type of correlation coefficient are you considering calculating?",
                        choices = c("Select type...", "Bivariate", "Multiple", "Partial")),
            conditionalPanel(
              condition = "input.type_corr == 'Bivariate'",
              selectInput("measurement_level_1", "What are the measurement levels of your variables?",
                          choices = c("Select measurement levels...", 
                                      "Continuous X Continuous", 
                                      "Ordinal X Ordinal",
                                      "Continuous X Dichotomous",
                                      "Dichotomous X Dichotomous",
                                      "Continuous X Categorical",
                                      "Continuous X Ordinal"))
            ),
            conditionalPanel(
              condition = "input.type_corr == 'Multiple'",
              selectInput("measurement_level_2", "What are the measurement levels of your variables?",
                          choices = c("Select measurement levels...", 
                                      "One continuous dependent, multiple continuous independent", 
                                      "Two sets of continuous variables")),
            )
          ),

          # Add conditional follow-up inquiries for Module 7
          conditionalPanel(
            condition = "input.module == 'Module 7. Predicting outcomes or group memberships'",
            selectInput("purpose_of_design", "What are you planning to predict?",
                        choices = c("Select purpose...",
                                    "Predicting continuous outcome", 
                                    "Predicting continuous outcome in a hierarchical/nested structure",
                                    "Predicting group memberships", 
                                    "Predicting group memberships in a hierarchical/nested structure")),
            conditionalPanel(
              condition = "input.purpose_of_design == 'Predicting continuous outcome' || 
                           input.purpose_of_design == 'Predicting continuous outcome in a hierarchical/nested structure'",
              selectInput("type_of_outcome_1", "How many outcomes do you have?",
                          choices = c("Select number...", "Single", "Multiple")),
              conditionalPanel(
                condition = "input.type_of_outcome_1 != 'Select number...'",
                selectInput("type_of_predictor", "How many predictors do you have?",
                            choices = c("Select number...", "Single", "Multiple")),
                p("Reminder: Classically, linear regression models require continuous predictors. Otherwise, some statistical 
                   corrections need to be done, such as 'dummy variable imputation'.", class = "conditional-text"),
                br(),
                conditionalPanel(
                  condition = "input.type_of_predictor != 'Select number...'",
                  selectInput("linearity_exist_1", "Does your data meet linearity assumptions?",
                              choices = c("Select answer...",
                                          "Yes. Use linear model",
                                          "No. Use non-linear model"))
                )
              )
            ),
            conditionalPanel(
              condition = "input.purpose_of_design == 'Predicting group memberships' || 
                           input.purpose_of_design == 'Predicting group memberships in a hierarchical/nested structure'",
              selectInput("type_of_outcome_2", "What kind of grouping variable do you have?",
                          choices = c("Select type...", "Single discrete (Dichotomous)", "Single discrete (Multinomial)",
                                      "Single discrete (Ordinal)", "Multiple discrete")),
              conditionalPanel(
                condition = "input.type_of_outcome_2 != 'Select type...'",
                selectInput("linearity_exist_2", "Does your data meet linearity assumptions?",
                            choices = c("Select answer...",
                                        "Yes. Use linear model",
                                        "No. Use non-linear model")),
              br(),
              p("Reminder: Linear predictive models for grup memberships works well with continuous predictors. If there are 
                 discrete predictors, some statistical corrections need to be done, such as 'dummy variable imputation'. 
                 On the other hand, nonlinear predictive models for group memberships work sufficiently well with continuous or 
                 discrete variables.", 
                class = "conditional-text")
              )
            )
          ),

          # Add conditional follow-up inquiries for Module 8
          conditionalPanel(
            condition = "input.module == 'Module 8. Data reduction'",
            selectInput("data_type", "What type of items or indicators do you have?",
                        choices = c("Select data type...",
                                    "Metric or continuous", 
                                    "Ordinal",
                                    "Nominal or multinominal")),
            conditionalPanel(
              condition = "input.data_type != 'Select data type...'",
              selectInput("assumption_meet", "Does your data meet the related basic assumptions such as multivariate normality 
                           and linearity or adequate sample size?",
                          choices = c("Select answer...", 
                                      "Yes. There is no serious assumptional violation in my dataset.", 
                                      "No. There are some violations of normality or linearity in my data.",
                                      "No. I don't have enough sample size, it's small.")),
              br(),
              p("Reminder-1: Data reduction techniques work with adequate sample size, such as 100-300 observations or 8-10 times 
                 the number of variables.", class = "conditional-text"),
              p("Reminder-2: You can also use other techniques that will be provided when you select the other options in the box 
                 regarding assumptional violations.", class = "conditional-text")
            )
          ),

          # Add conditional follow-up inquiries for Module 9
          conditionalPanel(
            condition = "input.module == 'Module 9. Scaling or Re-Scaling'",
            selectInput("scaling_purpose", "What is your main purpose?",
                        choices = c("Select purpose...",
                                    "Scaling", 
                                    "Re-scaling")),
            conditionalPanel(
              condition = "input.scaling_purpose == 'Re-scaling'",
              selectInput("dimension_type", "How many variables will be scaled or re-scaled?",
                          choices = c("Select dimensionality...",
                                      "One. Consider univariate techniques.", 
                                      "Multiple. Consider multivariate techniques")),
              conditionalPanel(
                condition = "input.dimension_type != 'Select dimensionality...'",
                selectInput("model_type", "What kind of model fits your data?",
                            choices = c("Select model...", "Linear", "Robust-linear", "Non-linear")),
                br(),
                p("Reminder:", class = "conditional-text"),
                p("Linear models are often preferred and are sufficient for scaling unless there are serious assumption violations.",
                  class = "conditional-text"),
                p("Robust techniques can help overcome distribution violations such as non-normality.", class = "conditional-text"),
                p("Nonlinear models operate according to their own hypothetical distribution properties and do not need to meet 
                    the assumptions such as normality or linearity.", class = "conditional-text")
              )
            )
          ),

          # Add conditional follow-up inquiries for Module 10
          conditionalPanel(
            condition = "input.module == 'Module 10. Item and test analyses in scale development and adaptation'",
            selectInput("theory_type", "What test-theory are you based on?",
                        choices = c("Select test theory...", "Classical Test Theory (CTT)", "Item Response Theory (IRT)")),
            p("Reminder: CTT is the general framework that also includes non-IRT-based models. IRT, on the other hand, can be 
                thought of as a scaling approach rather than a complete test theory.", class = "conditional-text"),
            br(),
            conditionalPanel(
              condition = "input.theory_type != 'Select test theory...'",
              selectInput("study_type", "What type of study do you plan to do on the data?",
                          choices = c("Select study...", 
                                      "Item and test statistics for descriptive purposes",
                                      "Reliability studies", 
                                      "Validity studies")),
              conditionalPanel(
                condition = "input.theory_type == 'Classical Test Theory (CTT)' && input.study_type == 'Reliability studies'",
                selectInput("reliability_type", "What type of reliability study do you plan to do on the data?",
                            choices = c("Select reliability study...", 
                                        "Internal consistency",
                                        "Test-retest", 
                                        "Alternate forms",
                                        "Inter-rater reliability"))
              ),     
              conditionalPanel(
                condition = "input.study_type == 'Validity studies'",
                selectInput("validity_type_1", "What type of validity study do you plan to do on the data?",
                            choices = c("Select validity study...", 
                                        "Content validity",
                                        "Criterian-based validity", 
                                        "Discriminative validity",
                                        "Construct validity")),
                conditionalPanel(
                  condition = "input.validity_type_1 == 'Construct validity'",
                  selectInput("validity_type_2", "What type of construct validity study do you plan to do on the data?",
                              choices = c("Select construct validity study...", 
                                          "Structural validity",
                                          "Differential item functioning", 
                                          "Test equating",
                                          "Measurement invariance"))
                )
              ),
              conditionalPanel(
                condition = "input.theory_type == 'Item Response Theory (IRT)' &&
                             input.study_type == 'Item and test statistics for descriptive purposes'",
                selectInput("dimension_type_1", "What kind of dimensionality fits your data?",
                            choices = c("Select dimensionality...", "Unidimensional", "Multidimensional")),
                conditionalPanel(
                  condition = "input.dimension_type_1 == 'Unidimensional'",
                  selectInput("item_type_1", "What type of item do you have?",
                              choices = c("Select item type...", "Dichotomous", "Polytomous", "Mixed"))
                )
              ),
              conditionalPanel(
                condition = "input.reliability_type == 'Internal consistency'",
                selectInput("dimension_type_2", "What kind of dimensionality fits your data?",
                            choices = c("Select dimensionality...", "Unidimensional", "Multidimensional")),
                conditionalPanel(
                  condition = "input.dimension_type_2 == 'Unidimensional'",
                  selectInput("item_type_2", "What type of item do you have?",
                              choices = c("Select item type...", "Dichotomous", "Polytomous", "Mixed"))
                )
              ),
              conditionalPanel(
                condition = "input.reliability_type == 'Test-retest' || input.reliability_type == 'Alternate forms'",
                selectInput("item_type_3", "What type of item do you have?",
                            choices = c("Select item type...", "Dichotomous", "Polytomous", "Mixed"))
              ),
              conditionalPanel(
                condition = "input.theory_type == 'Item Response Theory (IRT)' &&
                             input.study_type == 'Reliability studies'",
                selectInput("dimension_type_3", "What kind of dimensionality fits your data?",
                            choices = c("Select dimensionality...", "Unidimensional", "Multidimensional"))
              )
            )
          )

      ),
      div(class = "column column-3",
          div(class = "line-before"), # Thicker black line before column title
          div(class = "column-title", "Appropriate Technique(s)"),
          div(class = "line-before"), # Thicker black line after column title
          br(),
          # Add outputs for appropriate techniques here
          uiOutput("technique_suggestion")
      ),
      div(class = "column column-4",
          div(class = "line-before"), # Thicker black line before column title
          div(class = "column-title", "Brief Explanations"),
          div(class = "line-before"), # Thicker black line after column title
          br(),
          # Add outputs for brief explanations here
          uiOutput("brief_explanations")
      )
  ),

  div(class = "footnote",
      "This application was developed with the support of TÜBİTAK Project number 223K382"
  )
)


# Define the UI for vertical mode
vertical_ui <- fluidPage(
  tags$style(HTML("
    .title-section {
      background-color: navy;
      color: white;
      padding: 10px;  /* Inside space */
      margin: 0;   /* No margin for the outside space */
    }
    .title-section h1, .title-section h2, .title-section h3, .title-section h4 {
      margin: 0;
    }
    .columns-section {
      display: flex;     
      justify-content: space-between;
      margin-top: 20px; /* Vertical space between columns */
    }
    .column {
      flex: 1;
      padding: 10px;
      box-sizing: border-box;
      margin-right: 10px; /* Space between columns */
    }
   .column:last-child {
      margin-right: 0; /* No margin for the last column */
    }
    .column-1, .column-2 {
      background-color: lightblue;
    }
    .column-3, .column-4 {
      background-color: lightgreen;
    }
    .column-title {
      font-weight: bold;
      font-size: 1.5em; /* Increased font size for column titles */
      margin-top: 0; /* Remove space above title */
    }
    .line-before {
      border-bottom: 3px solid black; /* Thicker black line */
      margin: 0; /* No margin */
    }
    .header-line-before {
      border-bottom: 3px solid white; /* Thicker white line */
      margin: 0; /* No margin */
    }
    .footnote {
      font-size: 1.1em;
      text-align: center;
      margin-top: 20px;
    }
    .copyright {
      font-size: 1.1em;
      text-align: center;
      font-style: italic; /* Italicized copyright line */
      margin-top: 10px;
    }
    .orcid {
      font-size: 1.1em;
      text-align: center;
      color: white;
      font-style: italic;
      margin-top: 10px;
    }
    .conditional-text {
      font-style: italic;
    }
    .suggestion-text {
      font-size: 1.2em; /* Increased font size for suggestions */
      margin-top: 20px; /* Add a blank line before suggestions */
    }
  ")),


      # Header section
      div(class = "title-section",
              div(class = "header-line-before"), # Thicker white line before main title
              h2("Statistical Technique Advisor", align = "center", style = "font-weight: bold;"),
              h3("(STA 3.3)", align = "center", style = "font-weight: bold;"),
              br(),
              p("\u00A9 November 2024, designed and coded by Ergul Demir", class = "copyright"),
              p(a(href = "https://orcid.org/0000-0002-3708-8013", "ORCID: 0000-0002-3708-8013", class = "orcid"), class = "orcid"),
              div(class = "header-line-before"), # Thicker white line after ORCID line
              br(),
              p(em("This application aims to support you in finding the appropriate statistical technique depending on 
                   your analysis purpose and the characteristics of your data. You can receive recommendations and brief explanations 
                   after completing the module selection and follow-up questions below.")) 
      ),

      # Column section with four rows
      div(class = "columns-section",

              div(class = "column column-1",
                  div(class = "line-before"), # Thicker black line before column title
                  div(class = "column-title", "Modules"),
                  div(class = "line-before"), # Thicker black line after column title
                  br(),
                  selectInput("module", "Choose the appropriate module for your purpose of analysis",
                              choices = c("Select a module...",
                                          "Module 1. Analyzing the text documents",
                                          "Module 2. Checking the basic assumptions",
                                          "Module 3. Comparison of independent groups",
                                          "Module 4. Testing the effects in an experimental design",
                                          "Module 5. Analyzing the longitudinal data or repeated measurements",
                                          "Module 6. Correlations between variables",
                                          "Module 7. Predicting outcomes or group memberships",
                                          "Module 8. Data reduction",
                                          "Module 9. Scaling or Re-Scaling",
                                          "Module 10. Item and test analyses in scale development and adaptation"),
                              selected = NULL),

                  # Conditional explanation text based on selected module
                  conditionalPanel(
                    condition = "input.module == 'Module 1. Analyzing the text documents'",
                    p("Note: I assume you have gathered a certain amount of documents from observation forms, interview forms or 
                        just from related literature such as articles, books, newspapers, etc.", class = "conditional-text")
                  ),
                  conditionalPanel(
                    condition = "input.module == 'Module 2. Checking the basic assumptions'",
                    p("Note: I assume you have prior knowledge of what assumptions you need to check and that you have sufficient sample 
                       size (preferably more than 20 observations) to check them with hypothesis tests.", class = "conditional-text")
                  ),
                  conditionalPanel(
                    condition = "input.module == 'Module 3. Comparison of independent groups'",
                    p("Note: I assume, at least, you have one continuous dependent variable (DV) and one discrete independent variable (IV). 
                        Also, you may have one or more covariates.", class = "conditional-text")
                  ),
                  conditionalPanel(
                    condition = "input.module == 'Module 4. Testing the effects in an experimental design'",
                    p("Note: I assume you are proficient for designing an experiment and intend to test specific effects such as between 
                        and/or within subject effects.", class = "conditional-text")
                  ),
                  conditionalPanel(
                    condition = "input.module == 'Module 5. Analyzing the longitudinal data or repeated measurements'",
                    p("Note: I assume you are familiar with the concepts of panel, cohort and trend designs. And for such designs I assume 
                        you do repeated measurements at different time points.", class = "conditional-text")
                  ),
                  conditionalPanel(
                    condition = "input.module == 'Module 6. Correlations between variables'",
                    p("Note: I assume you are investigating relationships or associations between different variables or groups of variables.", 
                       class = "conditional-text")
                  ),
                  conditionalPanel(
                    condition = "input.module == 'Module 7. Predicting outcomes or group memberships'",
                    p("Note: I assume you want to structure a prediction model with continuous or discrete dependent variables or outcomes.", 
                       class = "conditional-text")
                  ),
                  conditionalPanel(
                    condition = "input.module == 'Module 8. Data reduction'",
                    p("Note: I assume you have a dataset containing indicator variables or items associated with a latent structure.", 
                       class = "conditional-text")
                  ),
                  conditionalPanel(
                    condition = "input.module == 'Module 9. Scaling or Re-Scaling'",
                    p("Note: I assume you are interested in scaling or rescaling variables for different purposes. 
                       For general information about scaling/re-scaling techniques, see the brief explanations in the last column.", 
                       class = "conditional-text")
                  ),
                  conditionalPanel(
                    condition = "input.module == 'Module 10. Item and test analyses in scale development and adaptation'",
                    p("Note: I assume you are evaluating the reliability and validity of a test in the process of scale development or 
                        adaptation.", class = "conditional-text"),
                    p("Also, this module only includes techniques classified under a limited number of conditions.", 
                       class = "conditional-text")
                  )
              )   
      ),

      div(class = "columns-section",

              div(class = "column column-2",
                  div(class = "line-before"), # Thicker black line before column title
                  div(class = "column-title", "Follow-Up Inquiries"),
                  div(class = "line-before"), # Thicker black line after column title,
                  br(),

                  # Add conditional explanation for follow up section
                  conditionalPanel(
                    condition = "input.module == 'Select a module...'",
                    p("Please select a module first to proceed the follow-up inquiries.")
                  ),

                  # Add conditional follow-up inquiries for Module 1
                  conditionalPanel(
                    condition = "input.module == 'Module 1. Analyzing the text documents'",
                    selectInput("doc_pool_size", "How large is your document pool?",
                                choices = c("Select size...", "Small", "Medium", "Large", "Very large")),
                    conditionalPanel(
                      condition = "input.doc_pool_size != 'Select size...'",
                      selectInput("themes_clear", "Are your themes or topics clear?",
                                  choices = c("Select clarity...", "Clear", "Unclear"))
                    )
                  ),

                  # Add conditional follow-up inquiries for Module 2
                  conditionalPanel(
                    condition = "input.module == 'Module 2. Checking the basic assumptions'",
                    selectInput("assumption_check", "Which assumption do you need to check?",
                                choices = c("Select one...", 
                                            "Normality", "Multivariate normality", 
                                            "Homogeneity of variances (Homoscedasticity)", 
                                            "Homogeneity of variance-covariance matrices", 
                                            "Linearity", "Multivariate linearity", 
                                            "Independence of residuals (Autocorrelation)", "Sphericity", 
                                            "Outliers", "Missing value pattern"))
                  ),

                  # Add conditional follow-up inquiries for Module 3
                  conditionalPanel(
                    condition = "input.module == 'Module 3. Comparison of independent groups'",
                    selectInput("number_of_dv", "How many dependent variables do you have?",
                                choices = c("Select the number of DVs...", "Single", "Multiple")),
                    conditionalPanel(
                      condition = "input.number_of_dv != 'Select the number of DVs...'",
                      selectInput("number_of_group", "How many groups do you intend to compare?",
                                  choices = c("Select the number of groups...", "Just two groups", "Three or more groups")),
                      conditionalPanel(
                        condition = "input.number_of_group != 'Select the number of groups...'",
                        selectInput("existence_of_cv", "Do you have any covariates?", choices = c("Select one...", "No", "Yes"))
                       )
                     )
                   ),

                  # Add conditional follow-up inquiries for Module 4
                  conditionalPanel(
                    condition = "input.module == 'Module 4. Testing the effects in an experimental design'",
                    selectInput("experiment_design", "What kind of experimental design do you have according to the number of groups?",
                                choices = c("Select the design...", "Single-subject", "One-group", "Multi-group")),
                    conditionalPanel(
                      condition = "input.experiment_design != 'Select the design...' && input.experiment_design != 'Single-subject'",
                      selectInput("experiment_dv", "How many dependent variables are in your experimental design?",
                                  choices = c("Select the number of DVs...", "1", "2 or more")),
                      conditionalPanel(
                        condition = "input.experiment_dv != 'Select the number of DVs...'",
                        selectInput("experiment_measures", "How many repeated tests or measurements are in your experimental design?", 
                                    choices = c("Select the test types...", 
                                                "Posttest only", 
                                                "Pretest - Posttest", 
                                                "3 or more repeated tests")),
                        conditionalPanel(
                          condition = "input.experiment_measures != 'Select the test types...'",
                          selectInput("experiment_cv", "Are there any covariates in your experimental design, except pretest?", 
                                      choices = c("Select one...", "No", "Yes")),
                          conditionalPanel(
                            condition = "input.experiment_cv == 'No'",
                            p("Reminder: You should consider using covariates to control for possible biases, especially when your design 
                               is not randomized.", class = "conditional-text")
                           )
                         )
                       )
                     )
                   ),

                  # Add conditional follow-up inquiries for Module 5
                  conditionalPanel(
                    condition = "input.module == 'Module 5. Analyzing the longitudinal data or repeated measurements'",
                    selectInput("purpose_of_rm", "What is your purpose of longitudinal data analysis?",
                                choices = c("Select your purpose...", 
                                            "1.Examine changes in a single dependent variable within the same group over time",
                                            "2.Examine changes in a dependent variable across multiple groups over time",
                                            "3.Analyze multiple dependent variables over time within a group",
                                            "4.Analyze multiple dependent variables across groups over time",
                                            "5.Structural model relationships between latent and manifest variables over time",
                                            "6.Examine trends and patterns in descriptive measures (such as mean or median) over time",
                                            "7.Analyze population-averaged effects with correlated data"))
                  ),

                  # Add conditional follow-up inquiries for Module 6
                  conditionalPanel(
                    condition = "input.module == 'Module 6. Correlations between variables'",
                    selectInput("type_corr", "Which type of correlation coefficient are you considering calculating?",
                                choices = c("Select type...", "Bivariate", "Multiple", "Partial")),
                    conditionalPanel(
                      condition = "input.type_corr == 'Bivariate'",
                      selectInput("measurement_level_1", "What are the measurement levels of your variables?",
                                  choices = c("Select measurement levels...", 
                                              "Continuous X Continuous", 
                                              "Ordinal X Ordinal",
                                              "Continuous X Dichotomous",
                                              "Dichotomous X Dichotomous",
                                              "Continuous X Categorical",
                                              "Continuous X Ordinal"))
                    ),
                    conditionalPanel(
                      condition = "input.type_corr == 'Multiple'",
                      selectInput("measurement_level_2", "What are the measurement levels of your variables?",
                                  choices = c("Select measurement levels...", 
                                              "One continuous dependent, multiple continuous independent", 
                                              "Two sets of continuous variables")),
                    )
                  ),

                  # Add conditional follow-up inquiries for Module 7
                  conditionalPanel(
                    condition = "input.module == 'Module 7. Predicting outcomes or group memberships'",
                    selectInput("purpose_of_design", "What are you planning to predict?",
                                choices = c("Select purpose...",
                                            "Predicting continuous outcome", 
                                            "Predicting continuous outcome in a hierarchical/nested structure",
                                            "Predicting group memberships", 
                                            "Predicting group memberships in a hierarchical/nested structure")),
                    conditionalPanel(
                      condition = "input.purpose_of_design == 'Predicting continuous outcome' || 
                                   input.purpose_of_design == 'Predicting continuous outcome in a hierarchical/nested structure'",
                      selectInput("type_of_outcome_1", "How many outcomes do you have?",
                                  choices = c("Select number...", "Single", "Multiple")),
                      conditionalPanel(
                        condition = "input.type_of_outcome_1 != 'Select number...'",
                        selectInput("type_of_predictor", "How many predictors do you have?",
                                    choices = c("Select number...", "Single", "Multiple")),
                        p("Reminder: Classically, linear regression models require continuous predictors. Otherwise, some statistical 
                            corrections need to be done, such as 'dummy variable imputation'.", class = "conditional-text"),
                        br(),
                        conditionalPanel(
                          condition = "input.type_of_predictor != 'Select number...'",
                          selectInput("linearity_exist_1", "Does your data meet linearity assumptions?",
                                      choices = c("Select answer...",
                                                  "Yes. Use linear model",
                                                  "No. Use non-linear model"))
                        )
                      )
                    ),
                    conditionalPanel(
                      condition = "input.purpose_of_design == 'Predicting group memberships' || 
                                   input.purpose_of_design == 'Predicting group memberships in a hierarchical/nested structure'",
                      selectInput("type_of_outcome_2", "What kind of grouping variable do you have?",
                                  choices = c("Select type...", "Single discrete (Dichotomous)", "Single discrete (Multinomial)",
                                              "Single discrete (Ordinal)", "Multiple discrete")),
                      conditionalPanel(
                        condition = "input.type_of_outcome_2 != 'Select type...'",
                        selectInput("linearity_exist_2", "Does your data meet linearity assumptions?",
                                    choices = c("Select answer...",
                                                "Yes. Use linear model",
                                                "No. Use non-linear model")),
                      br(),
                      p("Reminder: Linear predictive models for grup memberships works well with continuous predictors. If there are 
                          discrete predictors, some statistical corrections need to be done, such as 'dummy variable imputation'. 
                          On the other hand, nonlinear predictive models for group memberships work sufficiently well with continuous or 
                          discrete variables.", 
                        class = "conditional-text")
                      )
                    )
                  ),

                  # Add conditional follow-up inquiries for Module 8
                  conditionalPanel(
                    condition = "input.module == 'Module 8. Data reduction'",
                    selectInput("data_type", "What type of items or indicators do you have?",
                                choices = c("Select data type...",
                                            "Metric or continuous", 
                                            "Ordinal",
                                            "Nominal or multinominal")),
                    conditionalPanel(
                      condition = "input.data_type != 'Select data type...'",
                      selectInput("assumption_meet", "Does your data meet the related basic assumptions such as multivariate normality 
                                   and linearity or adequate sample size?",
                                  choices = c("Select answer...", 
                                              "Yes. There is no serious assumptional violation in my dataset.", 
                                              "No. There are some violations of normality or linearity in my data.",
                                              "No. I don't have enough sample size, it's small.")),
                      br(),
                      p("Reminder-1: Data reduction techniques work with adequate sample size, such as 100-300 observations or 8-10 times 
                          the number of variables.", class = "conditional-text"),
                      p("Reminder-2: You can also use other techniques that will be provided when you select the other options in the box 
                          regarding assumptional violations.", class = "conditional-text")
                    )
                  ),

                  # Add conditional follow-up inquiries for Module 9
                  conditionalPanel(
                    condition = "input.module == 'Module 9. Scaling or Re-Scaling'",
                    selectInput("scaling_purpose", "What is your main purpose?",
                                choices = c("Select purpose...",
                                            "Scaling", 
                                            "Re-scaling")),
                    conditionalPanel(
                      condition = "input.scaling_purpose == 'Re-scaling'",
                      selectInput("dimension_type", "How many variables will be scaled or re-scaled?",
                                  choices = c("Select dimensionality...",
                                              "One. Consider univariate techniques.", 
                                              "Multiple. Consider multivariate techniques")),
                      conditionalPanel(
                        condition = "input.dimension_type != 'Select dimensionality...'",
                        selectInput("model_type", "What kind of model fits your data?",
                                    choices = c("Select model...", "Linear", "Robust-linear", "Non-linear")),
                        br(),
                        p("Reminder:", class = "conditional-text"),
                        p("Linear models are often preferred and are sufficient for scaling unless there are serious assumptional violations.",
                          class = "conditional-text"),
                        p("Robust techniques can help overcome distribution violations such as non-normality.", class = "conditional-text"),
                        p("Nonlinear models operate according to their own hypothetical distribution properties and do not need to meet 
                            the assumptions such as normality or linearity.", class = "conditional-text")
                      )
                    )
                  ),

                  # Add conditional follow-up inquiries for Module 10
                  conditionalPanel(
                    condition = "input.module == 'Module 10. Item and test analyses in scale development and adaptation'",
                    selectInput("theory_type", "What test-theory are you based on?",
                                choices = c("Select test theory...", "Classical Test Theory (CTT)", "Item Response Theory (IRT)")),
                    p("Reminder: CTT is the general framework that also includes non-IRT-based models. IRT, on the other hand, can be 
                        thought of as a scaling approach rather than a complete test theory.", class = "conditional-text"),
                    br(),
                    conditionalPanel(
                      condition = "input.theory_type != 'Select test theory...'",
                      selectInput("study_type", "What type of study do you plan to do on the data?",
                                  choices = c("Select study...", 
                                              "Item and test statistics for descriptive purposes",
                                              "Reliability studies", 
                                              "Validity studies")),
                      conditionalPanel(
                        condition = "input.theory_type == 'Classical Test Theory (CTT)' && input.study_type == 'Reliability studies'",
                        selectInput("reliability_type", "What type of reliability study do you plan to do on the data?",
                                    choices = c("Select reliability study...", 
                                                "Internal consistency",
                                                "Test-retest", 
                                                "Alternate forms",
                                                "Inter-rater reliability"))
                      ),     
                      conditionalPanel(
                        condition = "input.study_type == 'Validity studies'",
                        selectInput("validity_type_1", "What type of validity study do you plan to do on the data?",
                                    choices = c("Select validity study...", 
                                                "Content validity",
                                                "Criterian-based validity", 
                                                "Discriminative validity",
                                                "Construct validity")),
                        conditionalPanel(
                          condition = "input.validity_type_1 == 'Construct validity'",
                          selectInput("validity_type_2", "What type of construct validity study do you plan to do on the data?",
                                      choices = c("Select construct validity study...", 
                                                  "Structural validity",
                                                  "Differential item functioning", 
                                                  "Test equating",
                                                  "Measurement invariance"))
                        )
                      ),
                      conditionalPanel(
                        condition = "input.theory_type == 'Item Response Theory (IRT)' &&
                                     input.study_type == 'Item and test statistics for descriptive purposes'",
                        selectInput("dimension_type_1", "What kind of dimensionality fits your data?",
                                    choices = c("Select dimensionality...", "Unidimensional", "Multidimensional")),
                        conditionalPanel(
                          condition = "input.dimension_type_1 == 'Unidimensional'",
                          selectInput("item_type_1", "What type of item do you have?",
                                      choices = c("Select item type...", "Dichotomous", "Polytomous", "Mixed"))
                        )
                      ),
                      conditionalPanel(
                        condition = "input.reliability_type == 'Internal consistency'",
                        selectInput("dimension_type_2", "What kind of dimensionality fits your data?",
                                    choices = c("Select dimensionality...", "Unidimensional", "Multidimensional")),
                        conditionalPanel(
                          condition = "input.dimension_type_2 == 'Unidimensional'",
                          selectInput("item_type_2", "What type of item do you have?",
                                      choices = c("Select item type...", "Dichotomous", "Polytomous", "Mixed"))
                        )
                      ),
                      conditionalPanel(
                        condition = "input.reliability_type == 'Test-retest' || input.reliability_type == 'Alternate forms'",
                        selectInput("item_type_3", "What type of item do you have?",
                                    choices = c("Select item type...", "Dichotomous", "Polytomous", "Mixed"))
                      ),
                      conditionalPanel(
                        condition = "input.theory_type == 'Item Response Theory (IRT)' &&
                                     input.study_type == 'Reliability studies'",
                        selectInput("dimension_type_3", "What kind of dimensionality fits your data?",
                                    choices = c("Select dimensionality...", "Unidimensional", "Multidimensional"))
                      )
                    )
                  )
                      
              )
      ),

      div(class = "columns-section",

              div(class = "column column-3",
                  div(class = "line-before"), # Thicker black line before column title
                  div(class = "column-title", "Appropriate Technique(s)"),
                  div(class = "line-before"), # Thicker black line after column title
                  br(),
                  # Add outputs for appropriate techniques here
                  uiOutput("technique_suggestion")
              )
      ),

      div(class = "columns-section",

              div(class = "column column-4",
                  div(class = "line-before"), # Thicker black line before column title
                  div(class = "column-title", "Brief Explanations"),
                  div(class = "line-before"), # Thicker black line after column title
                  br(),
                  # Add outputs for brief explanations here
                  uiOutput("brief_explanations")
              )
      ),
   
      div(class = "footnote",
          "This application was developed with the support of TÜBİTAK Project number 223K382"
      )
    
)


ui <- fluidPage(
  # Header section
  tags$div(
    class = "header-section",
    div(
      class = "switch",
      actionButton("toggle", textOutput("toggle_text"))
    )
  ),
  
  # Main app content
  tags$div(
    class = "app-content",
    uiOutput("dynamic_ui")
  ),
  
  tags$style(HTML("
    .header-section {
      padding: 10px;
      box-shadow: 0 4px 2px -2px gray;
      display: flex; /* Use flexbox to align items */
      justify-content: flex-end; /* Align content to the right */
      margin-top: 20px; /* Adjust space above if needed */
    }
    .switch button {
      font-weight: bold;
      background-color: cornsilk;
      border: none;
      padding: 10px 15px;
      cursor: pointer;
      font-size: 14px; 
    }
    .switch button:hover {
      background-color: lightyellow;
    }
    .app-content {
      margin-top: 20px; /* Space below the header */
    }
  "))
)



server <- function(input, output, session) {
  # Reactive value to keep track of the mode
  mode <- reactiveVal("horizontal")

  # Change mode when toggle button is pressed
  observeEvent(input$toggle, {
    mode(ifelse(mode() == "horizontal", "vertical", "horizontal"))
  })

  # Dynamic UI rendering
  output$dynamic_ui <- renderUI({
    if (mode() == "horizontal") {
      horizontal_ui
    } else {
      vertical_ui
    }
  })

  # Shared server-side logic for both modes
  # Reset inputs when the module changes
  observeEvent(input$module, {
    if (input$module != "") {  # Check if module is selected

      #Module 1 variables
      updateSelectInput(session, "doc_pool_size", selected = "Select size...")
      updateSelectInput(session, "themes_clear", selected = "Select clarity...")

      #Module 2 variables
      updateSelectInput(session, "assumption_check", selected = "Select one...")

      #Module 3 variables
      updateSelectInput(session, "number_of_dv", selected = "Select the number of DVs...")
      updateSelectInput(session, "number_of_group", selected = "Select the number of groups...")
      updateSelectInput(session, "existence_of_cv", selected = "Select one...")

      #Module 4 variables
      updateSelectInput(session, "experiment_design", selected = "Select the design...")
      updateSelectInput(session, "experiment_dv", selected = "Select the number of DVs...")
      updateSelectInput(session, "experiment_measures", selected = "Select the test types...")
      updateSelectInput(session, "experiment_cv", selected = "Select one...")

      #Module 5 variables
      updateSelectInput(session, "purpose_of_rm", selected = "Select your purpose...")

      #Module 6 variables
      updateSelectInput(session, "type_corr", selected = "Select type...")
      updateSelectInput(session, "measurement_level_1", selected = "Select measurement levels...")
      updateSelectInput(session, "measurement_level_2", selected = "Select measurement levels...")

      #Module 7 variables
      updateSelectInput(session, "purpose_of_design", selected = "Select purpose...")
      updateSelectInput(session, "type_of_outcome_1", selected = "Select number...")
      updateSelectInput(session, "type_of_predictor", selected = "Select number...")
      updateSelectInput(session, "linearity_exist_1", selected = "Select answer...")
      updateSelectInput(session, "type_of_outcome_2", selected = "Select type...")
      updateSelectInput(session, "linearity_exist_2", selected = "Select answer...")

      #Module 8 variables
      updateSelectInput(session, "data_type", selected = "Select data type...")
      updateSelectInput(session, "assumption_meet", selected = "Select answer...")

      #Module 9 variables
      updateSelectInput(session, "scaling_purpose", selected = "Select purpose...")
      updateSelectInput(session, "dimension_type", selected = "Select dimensionality...")
      updateSelectInput(session, "model_type", selected = "Select model...")

      #Module 10 variables
      updateSelectInput(session, "theory_type", selected = "Select test theory...")
      updateSelectInput(session, "study_type", selected = "Select study...")
      updateSelectInput(session, "reliability_type", selected = "Select reliability study...")
      updateSelectInput(session, "validity_type_1", selected = "Select validity study...")
      updateSelectInput(session, "validity_type_2", selected = "Select construct validity study...")
      updateSelectInput(session, "dimension_type_1", selected = "Select dimensionality...")
      updateSelectInput(session, "item_type_1", selected = "Select item type...")
      updateSelectInput(session, "dimension_type_2", selected = "Select dimensionality...")
      updateSelectInput(session, "item_type_2", selected = "Select item type...")
      updateSelectInput(session, "item_type_3", selected = "Select item type...")
      updateSelectInput(session, "dimension_type_3", selected = "Select dimensionality...")
    }
  })

  # Reset inputs when the purpose changes in module-7
  observeEvent(input$purpose_of_design, {
    if (input$purpose_of_design != "") {  # Check if module is selected
      updateSelectInput(session, "type_of_outcome_1", selected = "Select number...")
      updateSelectInput(session, "type_of_predictor", selected = "Select number...")
      updateSelectInput(session, "linearity_exist_1", selected = "Select answer...")
      updateSelectInput(session, "type_of_outcome_2", selected = "Select type...")
      updateSelectInput(session, "linearity_exist_2", selected = "Select answer...")
    }
  })

  # Reset inputs when the theory type changes in module-10
  observeEvent(input$theory_type, {
    if (input$theory_type != "") {  # Check if theory_type is selected
      updateSelectInput(session, "study_type", selected = "Select study...")
      updateSelectInput(session, "reliability_type", selected = "Select reliability study...")
      updateSelectInput(session, "validity_type_1", selected = "Select validity study...")
      updateSelectInput(session, "validity_type_2", selected = "Select construct validity study...")
      updateSelectInput(session, "dimension_type_1", selected = "Select dimensionality...")
      updateSelectInput(session, "item_type_1", selected = "Select item type...")
      updateSelectInput(session, "dimension_type_2", selected = "Select dimensionality...")
      updateSelectInput(session, "item_type_2", selected = "Select item type...")
      updateSelectInput(session, "item_type_3", selected = "Select item type...")
      updateSelectInput(session, "dimension_type_3", selected = "Select dimensionality...")
    }
  })

  # Reset inputs when the study changes in module-10
  observeEvent(input$study_type, {
    if (input$study_type != "") {  # Check if study_type is selected
      updateSelectInput(session, "reliability_type", selected = "Select reliability study...")
      updateSelectInput(session, "validity_type_1", selected = "Select validity study...")
      updateSelectInput(session, "validity_type_2", selected = "Select construct validity study...")
      updateSelectInput(session, "dimension_type_1", selected = "Select dimensionality...")
      updateSelectInput(session, "item_type_1", selected = "Select item type...")
      updateSelectInput(session, "dimension_type_2", selected = "Select dimensionality...")
      updateSelectInput(session, "item_type_2", selected = "Select item type...")
      updateSelectInput(session, "item_type_3", selected = "Select item type...")
      updateSelectInput(session, "dimension_type_3", selected = "Select dimensionality...")
    }
  })

  # Render the appropriate technique suggestion
  output$technique_suggestion <- renderUI({

    ##Module-1 for Column-3
    if (input$module == "Module 1. Analyzing the text documents") {
      if (input$doc_pool_size %in% c("Small", "Medium") && input$themes_clear == "Clear") {
        p("I can recommend you to use ", strong("Simple Document Analysis."))
      } else if (input$doc_pool_size == "Small" && input$themes_clear == "Unclear") {
        p("I can recommend you to use ", strong("Thematic Document Analysis."))
      } else if (input$doc_pool_size == "Medium" && input$themes_clear == "Unclear") {
        p("I can recommend you to use ", strong("Thematic Document Analysis "), "or ", strong("Simple Content Analysis."))
      } else if (input$doc_pool_size == "Large" && input$themes_clear == "Clear") {
        p("I can recommend you to use ", strong("Content Analysis"), " with ready-made codes suitable for your themes or topics.")
      } else if (input$doc_pool_size == "Large" && input$themes_clear %in% c("Clear", "Unclear")) {
        p("I can recommend you to use ", strong("Content Analysis."))
      } else if (input$doc_pool_size == "Very large" && input$themes_clear %in% c("Clear", "Unclear")) {
        p("I can recommend you to consider ", strong("Text Mining"), " strategies.")
      } else {
        p("Please complete the related inquiries to get a recommendation.")
      }

    ##Module-2 for Column-3
    } else if (input$module == "Module 2. Checking the basic assumptions") {
      if (input$assumption_check == "Normality") {
        p("I can recommend you to use the following.", 
          br(),
          br(),
          strong("Visual inspection:"),
          br(),
          "- Histogram",
          br(),
          "- Q-Q plot",
          br(),
          "- Box-Whisker plot",
          br(),
          br(),
          strong("Hyphotesis Test:"),
          br(),
          "- Shapiro Wilk Test",
          br(),
          "- Kolmogorov-Smirnov Test") 
      } else if (input$assumption_check == "Multivariate normality") {
        p("I can recommend you to use the following.", 
          br(),
          br(),
          strong("Visual inspection:"),
          br(),
          "- Scatterplot matrix",
          br(),
          "- Q-Q plots of Mahalanobis distances",
          br(),
          br(),
          strong("Hyphotesis Test:"),
          br(),
          "- Mardia's test",
          br(),
          "- Henze-Zirkler’s test")
      } else if (input$assumption_check == "Homogeneity of variances (Homoscedasticity)") {
        p("I can recommend you to use the following.", 
          br(),
          br(),
          strong("Visual inspection:"),
          br(),
          "- Scatter plots",
          br(),
          "- Box plots",
          br(),
          br(),
          strong("Hyphotesis Test:"),
          br(),
          "- Levene's test",
          br(),
          "- Bartlett’s test",
          br(),
          "- Brown-Forsty test",
        br(),
          "- Fligner-Killeen test")
      } else if (input$assumption_check == "Homogeneity of variance-covariance matrices") {
        p("I can recommend you to use the following.", 
          br(),
          br(),
          strong("Visual inspection:"),
          br(),
          "- Scatter plots",
          br(),
          "- Q-Q plots",
          br(),
          br(),
          strong("Hyphotesis Test:"),
          br(),
          "- Box's M test")
      } else if (input$assumption_check == "Linearity") {
        p("I can recommend you to use the following.", 
          br(),
          br(),
          strong("Visual inspection:"),
          br(),
          "- Scatter plots",
          br(),
          "- Residual plots",
          br(),
          br(),
          strong("Hyphotesis Test:"),
          br(),
          "- Linear regression analysis")
      } else if (input$assumption_check == "Multivariate linearity") {
        p("I can recommend you to use the following.", 
          br(),
          br(),
          strong("Visual inspection:"),
          br(),
          "- Scatterplot matrix",
          br(),
          "- Partial regression plots",
          br(),
          br(),
          strong("Hyphotesis Test:"),
          br(),
          "- Multivariate regression analysis")
      } else if (input$assumption_check == "Independence of residuals (Autocorrelation)") {
        p("I can recommend you to use the following.", 
          br(),
          br(),
          strong("Visual inspection:"),
          br(),
          "- Residual plots",
          br(),
          br(),
          strong("Hyphotesis Test:"),
          br(),
          "- Durbin-Watson test")
      } else if (input$assumption_check == "Sphericity") {
        p("I can recommend you to use the following.", 
          br(),
          br(),
          strong("Visual inspection:"),
          br(),
          "- Not applicable",
          br(),
          br(),
          strong("Hyphotesis Test:"),
          br(),
          "- Mauchly's test of sphericity")
      } else if (input$assumption_check == "Outliers") {
        p("I can recommend you to use the following.", 
          br(),
          br(),
          strong("Visual inspection:"),
          br(),
          "- Box plots",
          br(),
          "- Scatter plots",
          br(),
          br(),
          strong("Hyphotesis Test:"),
          br(),
          "- Grubbs' test",
          br(),
          "- Mahalanobis distance")
      } else if (input$assumption_check == "Missing value pattern") {
        p("I can recommend you to use the following.", 
          br(),
          br(),
          strong("Visual inspection:"),
          br(),
          "- Pattern plots",
          br(),
          br(),
          strong("Hyphotesis Test:"),
          br(),
          "- Little's MCAR Test")
      } else {
        p("Please complete the related inquiries to get a recommendation.")
      }

    ##Module-3 for Column-3
    } else if (input$module == "Module 3. Comparison of independent groups") {
      if (input$number_of_dv == "Single" && 
          input$number_of_group == "Just two groups" && 
          input$existence_of_cv == "No") {
        p("I can recommend you to use the following.", 
          br(),
          br(),
          strong("Parametric Test:"),
          br(),
          "- Independent Samples t-Test",
          br(),
          br(),
          strong("Robust Alternative:"),
          br(),
          "- Welch's t-Test",
          br(),
          br(),
          strong("Non-Parametric Test:"),
          br(),
          "- Wilcoxon's Rank Sum Test",
          br(),
          "- Mann-Whitney U Test") 
      } else if (input$number_of_dv == "Single" && 
                 input$number_of_group == "Just two groups" && 
                 input$existence_of_cv == "Yes") {
        p("I can recommend you to use the following.", 
          br(),
          br(),
          strong("Parametric Test:"),
          br(),
          "- One-way Analysis of Covariance (ANCOVA)",
          br(),
          br(),
          strong("Robust Alternative:"),
          br(),
          "- Robust ANCOVA",
          br(),
          "- Generalized Linear Models (GLM)",
          br(),
          br(),
          strong("Non-Parametric Test:"),
          br(),
          "- Quade's Rank Analysis of Covariance",
          br(),
          "- GLM with bootstrapping")
      } else if (input$number_of_dv == "Single" && 
                 input$number_of_group == "Three or more groups" && 
                 input$existence_of_cv == "No") {
        p("I can recommend you to use the following.", 
          br(),
          br(),
          strong("Parametric Test:"),
          br(),
          "- One-Way ANOVA (for just one IV)",
          br(),
          br(),
          "- Factorial ANOVA (for two or more IVs)",
          br(),
          br(),
          strong("Robust Alternative:"),
          br(),
          "- Welch's ANOVA (for just one IV)",
          br(),
          "- Extended Welch's ANOVA (for two or more IVs)",
          br(),
          br(),
          strong("Non-Parametric Test:"),
          br(),
          "- Kruskal-Wallis H Test (for one IV)",
          br(),
          "- Friedman Two-Way ANOVA (for two IVs in block design)",
          br(),
          "- Quade's Two way ANOVA (for two IVs in block design)")
      } else if (input$number_of_dv == "Single" && 
                 input$number_of_group == "Three or more groups" && 
                 input$existence_of_cv == "Yes") {
        p("I can recommend you to use the following.", 
          br(),
          br(),
          strong("Parametric Test:"),
          br(),
          "- One-way Analysis of Covariance (ANCOVA) (for one IV)",
          br(),
          "- Factorial ANCOVA (for two or more IVs)",
          br(),
          br(),
          strong("Robust Alternative:"),
          br(),
          "- Robust ANCOVA",
          br(),
          "- Generalized Linear Models (GLM)",
          br(),
          br(),
          strong("Non-Parametric Test:"),
          br(),
          "- Quade's Rank Analysis of Covariance",
          br(),
          "- GLM with bootstrapping")
      } else if (input$number_of_dv == "Multiple" && 
                 input$number_of_group == "Just two groups" && 
                 input$existence_of_cv == "No") {
        p("I can recommend you to use the following.", 
          br(),
          br(),
          strong("Parametric Test:"),
          br(),
          "- Multivariate Analysis of Variance (MANOVA)",
          br(),
          br(),
          strong("Robust Alternative:"),
          br(),
          "- Robust MANOVA",
          br(),
          "- Multivariate GLM",
          br(),
          br(),
          strong("Non-Parametric Test:"),
          br(),
          "- PERMANOVA")
      } else if (input$number_of_dv == "Multiple" && 
                 input$number_of_group == "Just two groups" && 
                 input$existence_of_cv == "Yes") {
        p("I can recommend you to use the following.", 
          br(),
          br(),
          strong("Parametric Test:"),
          br(),
          "- Multivariate Analysis of Covariance (MANCOVA)",
          br(),
          br(),
          strong("Robust Alternative:"),
          br(),
          "- Robust MANCOVA",
          br(),
          "- Multivariate GLM",
          br(),
          br(),
          strong("Non-Parametric Test:"),
          br(),
          "- PERMANOVA with covariates")
      } else if (input$number_of_dv == "Multiple" && 
                 input$number_of_group == "Three or more groups" && 
                 input$existence_of_cv == "No") {
        p("I can recommend you to use the following.", 
          br(),
          br(),
          strong("Parametric Test:"),
          br(),
          "- One-way Multivariate Analysis of Variance (MANOVA) (for one IV)",
          br(),
          "- Factorial MANOVA (for two or more IVs)",
          br(),
          br(),
          strong("Robust Alternative:"),
          br(),
          "- Robust MANOVA",
          br(),
          "- Multivariate GLM")
      } else if (input$number_of_dv == "Multiple" && 
                 input$number_of_group == "Three or more groups" && 
                 input$existence_of_cv == "Yes") {
        p("I can recommend you to use the following.", 
          br(),
          br(),
          strong("Parametric Test:"),
          br(),
          "- One-way Multivariate Analysis of Covariance (MANCOVA) (for one IV)",
          br(),
          "- Factorial MANCOVA (for two or more IVs)",
          br(),
          br(),
          strong("Robust Alternative:"),
          br(),
          "- Robust MANCOVA",
          br(),
          "- Multivariate GLM")
      } else {
        p("Please complete the related inquiries to get a recommendation.")
      }

    ##Module-4 for Column-3
    } else if (input$module == "Module 4. Testing the effects in an experimental design") {
      if (input$experiment_design == "Single-subject") {
        p("I can recommend you to use:", 
          br(),
          "- ", strong("Visual inspections"),
          br(),
          "-", strong("Descriptive statistics"),
           br(),
          "- ", strong("Time series analysis"),
          br(),
          "-", strong("Trend analysis"))
      } else if (input$experiment_design == "One-group" && input$experiment_dv == "1" && 
                 input$experiment_measures == "Posttest only" && 
                 input$experiment_cv == "No") {
        p("I can recommend you to use:",
          br(),
          br(),
          "- ", strong("One-sample t-test"), " as a parametric model.",
          br(),
          br(),
          "- ", strong("One-sample Wilcoxon signed rank test"), " as a non-parametric model if there are some certain violations 
            in parametric assumptions.")
      } else if (input$experiment_design == "One-group" && input$experiment_dv == "1" && 
                 input$experiment_measures == "Posttest only" && 
                 input$experiment_cv == "Yes") {
        p("Typically not applicable")
      } else if (input$experiment_design == "One-group" && input$experiment_dv == "1" && 
                 input$experiment_measures == "Pretest - Posttest" && 
                 input$experiment_cv == "No") {
        p("I can recommend you to use:",
          br(),
          br(),
          "- ", strong("Paired-samples t-test"), " as a parametric model.",
          br(),
          br(),
          "- ", strong("Wilcoxon signed rank test"), " as a non-parametric model if there are some certain violations 
            in parametric assumptions.")
      } else if (input$experiment_design == "One-group" && input$experiment_dv == "1" && 
                 input$experiment_measures %in% c("Pretest - Posttest", "3 or more repeated tests") && 
                 input$experiment_cv == "Yes") {
        p("I can recommend you to use ", strong("Repeated Measures Analysis of Covariance (RM-ANCOVA)"), " as a parametric model.",
          br(),
          br(),
          "There is no appropriate non-parametric technique for this design that I can recommend you as an alternative. 
            If there are some hypothetical violations such as non-normality, perhaps you could consider ", 
            strong("robust RM-ANCOVA"), " methods.")
      } else if (input$experiment_design == "One-group" && 
                 input$experiment_dv == "1" && 
                 input$experiment_measures %in% c("Pretest - Posttest", "3 or more repeated tests") && 
                 input$experiment_cv == "No") {
        p("I can recommend you to use:",
          br(),
          br(),
          "- ", strong("Repeated Measures Analysis of Variance (RM-ANOVA)"), " as a parametric model.",
          br(),
          br(),
          "- ", strong("Friedman ANOVA"), " as a non-parametric model if there are some certain violations in parametric assumptions.")
      } else if (input$experiment_design %in% c("One-group", "Multi-group") && 
                 input$experiment_dv == "2 or more" && 
                 input$experiment_measures == "Posttest only" && input$experiment_cv == "No") {
        p("I can recommend you to use ", strong("Multivariate Analysis of Variance (MANOVA)"), " as a parametric model.",
          br(),
          br(),
          "There is no appropriate non-parametric technique for this design that I can recommend you as an alternative. 
            If there are some hypothetical violations such as non-normality, perhaps you could consider ", 
            strong("robust MANOVA"), " methods.")
      } else if (input$experiment_design %in% c("One-group", "Multi-group") && 
                 input$experiment_dv == "2 or more" && 
                 input$experiment_measures == "Posttest only" && 
                 input$experiment_cv == "Yes") {
        p("I can recommend you to use ", strong("Multivariate Analysis of Covariance (MANCOVA)"), " as a parametric model.",
          br(),
          br(),
          "There is no appropriate non-parametric technique for this design that I can recommend you as an alternative. 
            If there are some hypothetical violations such as non-normality, perhaps you could consider ", 
            strong("robust MANCOVA"), " methods.")
      } else if (input$experiment_design == "One-group" && 
                 input$experiment_dv == "2 or more" && 
                 input$experiment_measures %in% c("Pretest - Posttest", "3 or more repeated tests") && 
                 input$experiment_cv == "No") {
        p("I can recommend you to use ", strong("Repeated Measures Multivariate Analysis of Variance (RM-MANOVA)"), 
            " as a parametric model.",
          br(),
          br(),
          "There is no appropriate non-parametric technique for this design that I can recommend you as an alternative. 
            If there are some hypothetical violations such as non-normality, perhaps you could consider ", 
            strong("robust RM-MANOVA"), " methods.")
      } else if (input$experiment_design == "One-group" && 
                 input$experiment_dv == "2 or more" && 
                 input$experiment_measures %in% c("Pretest - Posttest", "3 or more repeated tests") && 
                 input$experiment_cv == "Yes") {
        p("I can recommend you to use ", strong("Repeated Measures Multivariate Analysis of Covariance (RM-MANCOVA)"), 
            " as a parametric model.",
          br(),
          br(),
          "There is no appropriate non-parametric technique for this design that I can recommend you as an alternative. 
            If there are some hypothetical violations such as non-normality, perhaps you could consider ", 
            strong("robust RM-MANCOVA"), " methods.")
      } else if (input$experiment_design == "Multi-group" && 
                 input$experiment_dv == "1" && 
                 input$experiment_measures == "Posttest only" && 
                 input$experiment_cv == "No") {
        p("I can recommend you to use:",
          br(),
          br(),
          strong("Parametric tests:"),
          br(),
          "- Independent samples t-test (for two groups such as experiment and control)",
          br(),
          "- One-way ANOVA (for two or more groups)",
          br(),          
          br(),
          strong("Non-parametric tests:"),
          br(),
          "- Wilcoxon Rank-Sum Test (for two groups)",
          br(),
          "- Mann-Whitney U Test (for two groups)",
          br(),
          "- Kruskal-Wallis H Test (for two or more groups)")
      } else if (input$experiment_design == "Multi-group" && 
                 input$experiment_dv == "1" && 
                 input$experiment_measures == "Posttest only" && 
                 input$experiment_cv == "Yes") {
        p("I can recommend you to use ", strong("Analysis of Covariance (ANCOVA)"),
          br(),
          br(),
          "There is no appropriate non-parametric technique for this design that I can recommend you as an alternative. 
            If there are some hypothetical violations such as non-normality, perhaps you could consider ", 
            strong("robust ANCOVA"), " methods.")
      } else if (input$experiment_design == "Multi-group" && 
                 input$experiment_dv == "1" && 
                 input$experiment_measures == "Pretest - Posttest" && 
                 input$experiment_cv == "No") {
        p("I can recommend you to use ", strong("Mixed-Design ANOVA"), " or ", strong("ANCOVA (with pretests as covariate)"),
          br(),
          br(),
          "There is no appropriate non-parametric technique for this design that I can recommend you as an alternative. 
            If there are some hypothetical violations such as non-normality, perhaps you could consider ", strong("robust"), 
            " methods.")
      } else if (input$experiment_design == "Multi-group" && 
                 input$experiment_dv == "1" && 
                 input$experiment_measures %in% c("Pretest - Posttest", "3 or more repeated tests") && 
                 input$experiment_cv == "Yes") {
        p("I can recommend you to use ", strong("Mixed-Design ANCOVA"),
          br(),
          br(),
          "There is no appropriate non-parametric technique for this design that I can recommend you as an alternative. 
            If there are some hypothetical violations such as non-normality, perhaps you could consider ", 
            strong("robust mixed-ANCOVA"), " methods.")
      } else if (input$experiment_design == "Multi-group" && 
                 input$experiment_dv == "1" && 
                 input$experiment_measures == "3 or more repeated tests" && 
                 input$experiment_cv == "No") {
        p("I can recommend you to use ", strong("Mixed-Design ANOVA"),
          br(),
          br(),
          "There is no appropriate non-parametric technique for this design that I can recommend you as an alternative. 
            If there are some hypothetical violations such as non-normality, perhaps you could consider ", 
            strong("robust mixed-ANOVA"), " methods.")
      } else if (input$experiment_design == "Multi-group" && 
                 input$experiment_dv == "2 or more" && 
                 input$experiment_measures %in% c("Pretest - Posttest", "3 or more repeated tests") && 
                 input$experiment_cv == "No") {
        p("I can recommend you to use ", strong("Mixed-Design MANOVA"),
          br(),
          br(),
          "There is no appropriate non-parametric technique for this design that I can recommend you as an alternative. 
            If there are some hypothetical violations such as non-normality, perhaps you could consider ", 
            strong("robust mixed-MANOVA"), " methods.")
      } else if (input$experiment_design == "Multi-group" && 
                 input$experiment_dv == "2 or more" && 
                 input$experiment_measures %in% c("Pretest - Posttest", "3 or more repeated tests") && 
                 input$experiment_cv == "Yes") {
        p("I can recommend you to use ", strong("Mixed-Design MANCOVA"),
          br(),
          br(),
          "There is no appropriate non-parametric technique for this design that I can recommend you as an alternative. 
            If there are some hypothetical violations such as non-normality, perhaps you could consider ", 
            strong("robust mixed-MANCOVA"), " methods.")
      } else {
        p("Please complete the related inquiries to get a recommendation.")
      }

    ##Module-5 for Column-3
    } else if (input$module == "Module 5. Analyzing the longitudinal data or repeated measurements") {
      if (input$purpose_of_rm == "1.Examine changes in a single dependent variable within the same group over time") {
        p(strong("- Repeated Measures ANOVA"),
        br(),
        strong("- Repeated Measures ANCOVA"),
        br(),
        strong("- Linear Mixed Effects Models"))
      } else if (input$purpose_of_rm == "2.Examine changes in a dependent variable across multiple groups over time") {
        p(strong("- Mixed-Design ANOVA"),
        br(),
        strong("- Repeated Measures ANCOVA"))
      } else if (input$purpose_of_rm == "3.Analyze multiple dependent variables over time within a group") {
        p(strong("- Repeated Measures MANOVA"),
        br(),
        strong("- Multivariate Linear Mixed Effects Models"))
      } else if (input$purpose_of_rm == "4.Analyze multiple dependent variables across groups over time") {
        p(strong("- Mixed-Design MANOVA"),
        br(),
        strong("- Multivariate Linear Mixed Effects Models"))
      } else if (input$purpose_of_rm == "5.Structural model relationships between latent and manifest variables over time") {
        p(strong("- Latent Growth Modeling"),
        br(),
        strong("- Cross-Lagged Panel Models"),
        br(),
        strong("- Dynamic SEM"),
        br(),
        strong("- Multilevel Structural Equation Modeling (MSEM)"))
      } else if (input$purpose_of_rm == "6.Examine trends and patterns in descriptive measures (such as mean or median) over time") {
        p(strong("- Time Series Analysis"),
        br(),
        strong("- Trend Analysis"))
      } else if (input$purpose_of_rm == "7.Analyze population-averaged effects with correlated data") {
        p(strong("- Generalized Estimating Equations (GEE)"))
      } else {
        p("Please complete the related inquiries to get a recommendation.")
      }

    ##Module-6 for Column-3
    } else if (input$module == "Module 6. Correlations between variables") {
      if (input$type_corr == "Bivariate" && input$measurement_level_1 == "Continuous X Continuous") {
        p("I can recommend you to use ", strong("Pearson Product-Moments Correlation"), " ,also known as ", 
            strong("Simple Correlation"), " or ", strong("zero-order correlation"))
      } else if (input$type_corr == "Bivariate" && input$measurement_level_1 == "Ordinal X Ordinal") {
        p("I can recommend you to use:",
        br(),
        br(),
        strong("- Spearman's Rank Correlation"),
        br(),
        strong("- Kendall's Tau"),
        br(),
        strong("- Polychoric Correlation"))
      } else if (input$type_corr == "Bivariate" && input$measurement_level_1 == "Continuous X Dichotomous") {
        p("I can recommend you to use:",
        br(),
        br(),
        strong("- Point-Biserial Correlation"),
        br(),
        strong("- Biserial Correlation"))
      } else if (input$type_corr == "Bivariate" && input$measurement_level_1 == "Dichotomous X Dichotomous") {
        p("I can recommend you to use:",
        br(),
        br(),
        strong("- Phi Coefficient"),
        br(),
        strong("- Tetrachoric Correlation"))
      } else if (input$type_corr == "Bivariate" && input$measurement_level_1 == "Continuous X Categorical") {
        p("I can recommend you to use ", strong("Eta Correlation"))
      } else if (input$type_corr == "Bivariate" && input$measurement_level_1 == "Continuous X Ordinal") {
        p("I can recommend you to use ", strong("Polyserial Correlation"))
      } else if (input$type_corr == "Multiple" && 
                 input$measurement_level_2 == "One continuous dependent, multiple continuous independent") {
        p("I can recommend you to use ", strong("Multiple Correlation"), " wich can be estimated with linear regression model")
      } else if (input$type_corr == "Multiple" && 
                 input$measurement_level_2 == "Two sets of continuous variables") {
        p("I can recommend you to use ", strong("Canonical Correlation"))
      } else if (input$type_corr == "Partial") {
        p("I can recommend you to use:",
        br(),
        br(),
        strong("- Partial Correlation"),
        br(),
        strong("- Semi-partial (Part) Correlation"))    
      } else {
        p("Please complete the related inquiries to get a recommendation.")
      }

    ##Module-7 for Column-3
    } else if (input$module == "Module 7. Predicting outcomes or group memberships") {
      if (input$purpose_of_design == "Predicting continuous outcome" && 
          input$type_of_outcome_1 == "Single" && input$type_of_predictor == "Single" && 
          input$linearity_exist_1 == "Yes. Use linear model") {
        p("I can recommend you to use ", strong("Simple Linear Regression Analysis"),
        br(),
        br(),
        "Also you can consider fallowings as robust alternatives:",
        br(),
        "- ", strong("Ridge Regression"),
        br(),
        "- ", strong("Lasso Regression"),
        br(),
        "- ", strong("Elastic Net Regression"))
      } else if (input$purpose_of_design == "Predicting continuous outcome" && 
                 input$type_of_outcome_1 == "Single" && input$type_of_predictor == "Multiple" && 
                 input$linearity_exist_1 == "Yes. Use linear model") {
        p("I can recommend you to use ", strong("Multiple Linear Regression Analysis"),
        br(),
        br(),
        "Also you can consider fallowings as robust alternatives:",
        br(),
        "- ", strong("Ridge Regression"),
        br(),
        "- ", strong("Lasso Regression"),
        br(),
        "- ", strong("Elastic Net Regression"))
      } else if (input$purpose_of_design == "Predicting continuous outcome" && 
                 input$type_of_outcome_1 == "Single" && 
                 input$type_of_predictor %in% c("Single", "Multiple") && input$linearity_exist_1 == "No. Use non-linear model") {
        p("I can recommend you to use:",
        br(),
        br(),
        strong("- Polynomial Regression"),
        br(),
        strong("- Quantile Regression"))
      } else if (input$purpose_of_design == "Predicting continuous outcome" && 
                 input$type_of_outcome_1 == "Multiple" && 
                 input$type_of_predictor %in% c("Single", "Multiple") && 
                 input$linearity_exist_1 == "Yes. Use linear model") {
        p("I can recommend you to use ", strong("Multivariate Linear Regression Analysis"))
      } else if (input$purpose_of_design == "Predicting continuous outcome" && 
                 input$type_of_outcome_1 == "Multiple" && 
                 input$type_of_predictor %in% c("Single", "Multiple") && 
                 input$linearity_exist_1 == "No. Use non-linear model") {
        p("Sadly, there is no thechnique I can recommend to you.")
      } else if (input$purpose_of_design == "Predicting continuous outcome in a hierarchical/nested structure" && 
                 input$type_of_outcome_1 == "Single" && input$type_of_predictor %in% c("Single", "Multiple") && 
                 input$linearity_exist_1 == "Yes. Use linear model") {
        p("I can recommend you to use ", strong("Multilevel (or Hierarchical) Linear Regression"))
      } else if (input$purpose_of_design == "Predicting continuous outcome in a hierarchical/nested structure" && 
                 input$type_of_outcome_1 == "Single" && 
                 input$type_of_predictor %in% c("Single", "Multiple") && 
                 input$linearity_exist_1 == "No. Use non-linear model") {
        p("Sadly, there is no thechnique I can recommend to you.")
      } else if (input$purpose_of_design == "Predicting continuous outcome in a hierarchical/nested structure" && 
                 input$type_of_outcome_1 == "Multiple") {
        p("Sadly, there is no thechnique I can recommend to you.")
      } else if (input$purpose_of_design == "Predicting group memberships" && 
                 input$type_of_outcome_2 %in% c("Single discrete (Dichotomous)", "Single discrete (Multinomial)", "Single discrete (Ordinal)") && 
                 input$linearity_exist_2 == "Yes. Use linear model") {
        p("I can recommend you to use ", strong("Discriminant Function Analysis (DFA)"))
      } else if (input$purpose_of_design == "Predicting group memberships" && 
                 input$type_of_outcome_2 == "Single discrete (Dichotomous)" && 
                 input$linearity_exist_2 == "No. Use non-linear model") {
        p("I can recommend you to use ", strong("Binary Logistic Regression"),
        br(),
        br(),
        "Also you can consider the folowings:",
        br(),
        "- ", strong("Decision Trees (CART)"),
        br(),
        "- ", strong("Random Forest"),
        br(),
        "- ", strong("Support Vector Machines (SVM)"))
      } else if (input$purpose_of_design == "Predicting group memberships" && 
                 input$type_of_outcome_2 == "Single discrete (Multinomial)" && 
                 input$linearity_exist_2 == "No. Use non-linear model") {
        p("I can recommend you to use ", strong("Multinominal Logistic Regression"),
        br(),
        br(),
        "Also you can consider the folowings:",
        br(),
        "- ", strong("Decision Trees (CART)"),
        br(),
        "- ", strong("Random Forest"),
        br(),
        "- ", strong("Support Vector Machines (SVM)"))
      } else if (input$purpose_of_design == "Predicting group memberships" && 
                 input$type_of_outcome_2 == "Single discrete (Ordinal)" && 
                 input$linearity_exist_2 == "No. Use non-linear model") {
        p("I can recommend you to use ", strong("Ordinal Logistic Regression"),
        br(),
        br(),
        "Also you can consider the folowings:",
        br(),
        "- ", strong("Decision Trees (CART)"),
        br(),
        "- ", strong("Random Forest"),
        br(),
        "- ", strong("Support Vector Machines (SVM)"))
      } else if (input$purpose_of_design == "Predicting group memberships" && 
                 input$type_of_outcome_2 == "Multiple discrete" && 
                 input$linearity_exist_2 == "Yes. Use linear model") {
        p("Sadly, there is no thechnique I can recommend to you.")
      } else if (input$purpose_of_design == "Predicting group memberships" && 
                 input$type_of_outcome_2 == "Multiple discrete" && 
                 input$linearity_exist_2 == "No. Use non-linear model") {
        p("I can recommend you to use:", 
        br(),
        br(),
        strong("- Multivariate Logistic Regression"), 
        br(),
        strong("- Multivariate Probit Models"), 
        br(),
        strong("- Multivariate Random Forest (MVRF)")) 
      } else if (input$purpose_of_design == "Predicting group memberships in a hierarchical/nested structure" && 
                 input$type_of_outcome_2 %in% c("Single discrete (Dichotomous)", "Single discrete (Multinomial)", "Single discrete (Ordinal)") && 
                 input$linearity_exist_2 == "Yes. Use linear model") {
        p("Sadly, there is no thechnique I can recommend to you.")
      } else if (input$purpose_of_design == "Predicting group memberships in a hierarchical/nested structure" && 
                 input$type_of_outcome_2 %in% c("Single discrete (Dichotomous)", "Single discrete (Multinomial)") && 
                 input$linearity_exist_2 == "No. Use non-linear model") {
        p("I can recommend you to use ", strong("Multilevel Logistic Regression"))
      } else if (input$purpose_of_design == "Predicting group memberships in a hierarchical/nested structure" && 
                 input$type_of_outcome_2 == "Single discrete (Ordinal)" && 
                 input$linearity_exist_2 == "No. Use non-linear model") {
        p("I can recommend you to use ", strong("Multilevel Ordinal Logistic Regression"))
      } else if (input$purpose_of_design == "Predicting group memberships in a hierarchical/nested structure" && 
                 input$type_of_outcome_2 == "Multiple discrete") {
        p("Sadly, there is no thechnique I can recommend to you.")
      } else {
        p("Please complete the related inquiries to get a recommendation.")
      }

    ##Module-8 for Column-3
    } else if (input$module == "Module 8. Data reduction") {
      if (input$data_type == "Metric or continuous" && 
          input$assumption_meet == "Yes. There is no serious assumptional violation in my dataset.") {
        p("I can recommend you to use: ",
        br(),
        br(),
        "- ", strong("Principal Component Analysis (PCA)"),
        br(),
        br(),
        "- ", strong("Exploratory Factor Analysis (EFA)"))
      } else if (input$data_type == "Metric or continuous" && 
                 input$assumption_meet == "No. There are some violations of normality or linearity in my data.") {
        p("I can recommend you to use: ",
        br(),
        br(),
        "- ", strong("Robust Principal Component Analysis"),
        br(),
        br(),
        "- ", strong("Robust Exploratory Factor Analysis"), " such as Principal Axis Factoring",
        br(),
        br(),
        "- ", strong("Metric-Multidimensional Scaling (metric MDS)"),
        br(),
        br(),
        "- ", strong("Bayesian methods"))
      } else if (input$data_type == "Metric or continuous" && 
                 input$assumption_meet == "No. I don't have enough sample size, it's small.") {
        p("I can recommend you to use: ", 
        br(),
        br(),
        "- ", strong("Metric-Multidimensional Scaling (Metric-MDS)"))
      } else if (input$data_type == "Ordinal" && 
                 input$assumption_meet == "Yes. There is no serious assumptional violation in my dataset.") {
        p("I can recommend you to use: ", 
        br(),
        br(),
        "- ", strong("Principal Component Analysis (PCA)"), 
        br(),
        "- ", strong("Exploratory Factor Analysis (EFA)"), 
        br(),
        " with polychoric correlation or covariance matrix")
      } else if (input$data_type == "Ordinal" && 
                 input$assumption_meet == "No. There are some violations of normality or linearity in my data.") {
        p("I can recommend you to use: ", 
        br(),
        br(),
        "- ", strong("Robust Principal Component Analysis"), 
        br(),
        "- ", strong("Robust Exploratory Factor Analysis"), 
        br(),
        " with polychoric correlation or covariance matrix",
        br(),
        br(),
        "- ", strong("Non-metric Multidimensional Scaling (non-metric MDS)"),
        br(),
        br(),
        "- ", strong("Categorical Principal Componenet Analysis (CATPCA)"),
        br(),
        br(),
        "- ", strong("Multiple Correspondance Analysis (MCA)"))
      } else if (input$data_type == "Ordinal" && 
                 input$assumption_meet == "No. I don't have enough sample size, it's small.") {
        p("Unfortunately, there is no technique that I can recommend in cases where the sample size is insufficient. 
            Some resampling techniques or bootstrapping may be considered.")
      } else if (input$data_type == "Nominal or multinominal" && 
                 input$assumption_meet == "Yes. There is no serious assumptional violation in my dataset.") {
        p("I can recommend you to use: ", 
        br(), 
        br(), 
        "- ", strong("Principal Component Analysis (PCA)"), " or ", 
        br(), 
        "- ", strong("Exploratory Factor Analysis (EFA)"), 
        br(), 
        " with tetrachoric correlation matrix for dichotomous variables.")
      } else if (input$data_type == "Nominal or multinominal" && 
                 input$assumption_meet == "No. There are some violations of normality or linearity in my data.") {
        p("I can recommend you to use: ",
        br(),
        br(),
        "- ", strong("Robust Principal Component Analysis"), 
        br(),
        "- ", strong("Robust Exploratory Factor Analysis"), 
        br(),
        " with tetrachoric correlation matrices in dichotomous data.",
        br(),
        br(),
        "- ", strong("Non-metric Multidimensional Scaling (non-metric MDS)"),
        br(),
        br(),
        "- ", strong("Categorical Principal Componenet Analysis (CATPCA)"),
        br(),
        br(),
        "- ", strong("Multiple Correspondance Analysis (MCA)"))
      } else if (input$data_type == "Nominal or multinominal" && 
                 input$assumption_meet == "No. I don't have enough sample size, it's small.") {
        p("Unfortunately, there is no technique that I can recommend in cases where the sample size is insufficient. 
            Some resampling techniques or bootstrapping may be considered.")
      } else {
        p("Please complete the related inquiries to get a recommendation.")
      }

    ##Module-9 for Column-3
    } else if (input$module == "Module 9. Scaling or Re-Scaling") {
      if(input$scaling_purpose == "Scaling") {
        p("I can recommend you to consider some traditional methods:",
          br(),
          "- ", strong("Thurstone type scaling"),
          br(),
          "- ", strong("Guttman type scaling"),
          br(),
          "- ", strong("Likert type scaling"))
      } else if (input$scaling_purpose == "Re-scaling" && 
                 input$dimension_type == "One. Consider univariate techniques." && 
                 input$model_type == "Linear") {
        p("I can recommend you to consider:",
          br(),
          "- ", strong("Z-score Standardization"),
          br(),
          "- ", strong("Min-Max Scaling"))
      } else if (input$scaling_purpose == "Re-scaling" && 
                 input$dimension_type == "One. Consider univariate techniques." && 
                 input$model_type == "Robust-linear") {
        p("I can recommend you to consider:",
          br(),
          "- ", strong("Robust Z-score Standardization"),
          br(),
          "- ", strong("Robust Min-Max Scaling"),
          br(),
          "- ", strong("Winsorized Scaling"),
          br(),
          "- ", strong("Huber M-Estimation"),
          br(),
          "- ", strong("Trimmed Mean Scaling"),
          br(),
          "- ", strong("Robust Quantile Transformation"))
      } else if (input$scaling_purpose == "Re-scaling" && 
                 input$dimension_type == "One. Consider univariate techniques." && 
                 input$model_type == "Non-linear") {
      p("I can recommend you to consider:",
          br(),
          "- ", strong("Log Transformation"),
          br(),
          "- ", strong("Box-Cox Transformation"),
          br(),
          "- ", strong("Robust Log Transformation"),
          br(),
          "- ", strong("Rank-Based Transformation"),
          br(),
          "- ", strong("Quantile Transformation"),
          br(),
          "- ", strong("Logistic Regression Scaling"),
          br(),
          "- ", strong("Polynomial Scaling"))
      } else if (input$scaling_purpose == "Re-scaling" && 
                 input$dimension_type == "Multiple. Consider multivariate techniques" && 
                 input$model_type == "Linear") {
        p("I can recommend you to consider:",
          br(),
          "- ", strong("Principal Component Analysis (PCA)"),
          br(),
          "- ", strong("Exploratory Factor Analysis (EFA)"),
          br(),
          "- ", strong("Metric Multidimensional Scaling (metric-MDS)"),
          br(),
          "- ", strong("Canonical Correlation Analysis (CCA)"),
          br(),
          "- ", strong("Correspondence Analysis (CA)"),
          br(),
          "- ", strong("Multiple Correspondence Analysis (MCA)"))
      } else if (input$scaling_purpose == "Re-scaling" && 
                 input$dimension_type == "Multiple. Consider multivariate techniques" && 
                 input$model_type == "Robust-linear") {
        p("I can recommend you to consider:",
          br(),
          "- ", strong("Robust Principal Component Analysis (Robust PCA)"),
          br(),
          "- ", strong("Robust Exploratory Factor Analysis (Robust EFA)"))
      } else if (input$scaling_purpose == "Re-scaling" && 
                 input$dimension_type == "Multiple. Consider multivariate techniques" && 
                 input$model_type == "Non-linear") {
        p("I can recommend you to consider:",
          br(),
          "- ", strong("Non-metric Multidimensional Scaling (non-metric MDS)"),
          br(),
          "- ", strong("Item Response Theory Models"),
          br(),
          "- ", strong("Multivariate Polynomial Scaling"))
      } else {
        p("Please complete the related inquiries to get a recommendation.")
      }

    ##Module-10 for Column-3
    } else if (input$module == "Module 10. Item and test analyses in scale development and adaptation") {
      if(input$theory_type == "Classical Test Theory (CTT)" &&
         input$study_type == "Item and test statistics for descriptive purposes") {
        p("You can consider following studies in item level:",
          br(),
          br(),
          "- ", strong("Frequency tables or graphs"), " of the distribution of responses.",
          br(),
          br(),
          "- Appropriate ", strong("Descriptive statistics"), " for each item, such as mean, variance, median, quantiles etc.",
          br(),
          br(),
          "- ", strong("Item difficulty index"),
          br(),
          br(),
          "- ", strong("Item discrimination index"),
          br(),
          br(),
          br(),
          "Also you can consider the following in test level:",
          br(),
          "- ", strong("Mean of item difficulty indexes"),
          br(),
          "- ", strong("Mean of item discrimination indexes"))
      } else if (input$theory_type == "Item Response Theory (IRT)" &&
                 input$study_type == "Item and test statistics for descriptive purposes" &&
                 input$dimension_type_1 == "Unidimensional" &&
                 input$item_type_1 == "Dichotomous") {
        p("You can use the following IRT models to get the estimations of item parameters:",
          br(),
          "- ", strong("1-parameter logistic model (1PL)"), " or ", strong("Rasch model"),
          br(),
          "- ", strong("2-parameters logistic model (2PL)"),
          br(),
          "- ", strong("3-parameters logistic model (3PL)"))
      } else if (input$theory_type == "Item Response Theory (IRT)" &&
                 input$study_type == "Item and test statistics for descriptive purposes" &&
                 input$dimension_type_1 == "Unidimensional" &&
                 input$item_type_1 == "Polytomous") {
         p("You can use the following IRT models to get the estimations of item parameters:",
          br(),
          "- ", strong("Graded Response Model (GRM)"),
          br(),
          "- ", strong("Partial Credit Model (PCM)"),
          br(),
          "- ", strong("Rating Scale Model (RSM)"))
      } else if (input$theory_type == "Item Response Theory (IRT)" &&
                 input$study_type == "Item and test statistics for descriptive purposes" &&
                 input$dimension_type_1 == "Unidimensional" &&
                 input$item_type_1 == "Mixed") {
         p("You can consider ", strong("Mixed-IRT models"))
      } else if (input$theory_type == "Item Response Theory (IRT)" &&
                 input$study_type == "Item and test statistics for descriptive purposes" &&
                 input$dimension_type_1 == "Multidimensional") {
         p("You can consider ", strong("Multidimensional-IRT models (MIRT)"), " with appropriate unidimensional IRT models 
             such as 1PL, 2PL, 3PL or GRM, PCM, RSM")
      } else if (input$theory_type == "Classical Test Theory (CTT)" &&
                 input$study_type == "Reliability studies" &&
                 input$reliability_type == "Internal consistency" &&
                 input$dimension_type_2 == "Unidimensional" &&
                 input$item_type_2 == "Dichotomous") {
         p("I can recommend you to use:", 
           br(),
           strong("Kuder-Richardson Formulas"),
           br(),
           "- ", strong("KR-20"),
           br(),
           "- ", strong("KR-21"))
      } else if (
                 input$theory_type == "Classical Test Theory (CTT)" &&
                 input$study_type == "Reliability studies" &&
                 input$reliability_type == "Internal consistency" &&
                 input$dimension_type_2 == "Unidimensional" &&
                 input$item_type_2 == "Polytomous") {
         p(HTML("I can recommend you to use <strong>Cronbach's &alpha;</strong> coefficient"))
      } else if (input$theory_type == "Classical Test Theory (CTT)" &&
                 input$study_type == "Reliability studies" &&
                 input$reliability_type == "Internal consistency" &&
                 input$dimension_type_2 == "Unidimensional" &&
                 input$item_type_2 == "Mixed") {
         p("I can recommend you to use:",
           br(),
           HTML("- <strong>McDonald's &omega;</strong>"), 
           br(),
           HTML("- <strong>Stratified Cronbach's &alpha;</strong>"),
           br(),
           "- ", strong("Angoff-Feldt Reliability Estimate"), 
           br(),
           "- ", strong("Feldt-Raju Reliability Estimate"))
      } else if (input$theory_type == "Classical Test Theory (CTT)" &&
                 input$study_type == "Reliability studies" &&
                 input$reliability_type == "Internal consistency" &&
                 input$dimension_type_2 == "Multidimensional") {
         p(HTML("I can recommend you to use <strong>McDonald's &omega;</strong> coefficient"))
      } else if (input$theory_type == "Classical Test Theory (CTT)" &&
                 input$study_type == "Reliability studies" &&
                 input$reliability_type == "Test-retest" &&
                 input$item_type_3 == "Dichotomous") {
         p("I can recommend you to use", strong("Pearson Correlation Coefficient"), "in test level, if there are no assumptional 
             violance.",
           br(),
           br(),
           "In item level, you may consider using the ", strong("McNemar's Test"), " for each item.")
      } else if (input$theory_type == "Classical Test Theory (CTT)" &&
                 input$study_type == "Reliability studies" &&
                 input$reliability_type == "Test-retest" &&
                 input$item_type_3 == "Polytomous") {
         p("I can recommend you to use", strong("Pearson Correlation Coefficient"), "in test level, if there are no assumptional 
             violance.",
           br(),
           br(),
           "In item level, you may consider using the ", strong("Spearman's Rank Correlation"), " for each item.")
      } else if (input$theory_type == "Classical Test Theory (CTT)" &&
                 input$study_type == "Reliability studies" &&
                 input$reliability_type == "Test-retest" &&
                 input$item_type_3 == "Mixed") {
         p("In test level, I can recommend you to use:",
           br(), 
           "- ", strong("Pearson Correlation Coefficient"), "with total scores if there are no assumptional violance.",
           br(),
           br(),
          "In item level, you may consider using:",
           br(),
           "- ", strong("McNemar's Test"), " for dichotomous items.",
           br(),
           "- ", strong("Spearman's Rank Correlation"), " for polytomous items.")
      } else if (input$theory_type == "Classical Test Theory (CTT)" &&
                 input$study_type == "Reliability studies" &&
                 input$reliability_type == "Alternate forms" &&
                 input$item_type_3 == "Dichotomous") {
         p("I can recommend you to use", strong("Pearson Correlation Coefficient"), "in test level, if there are no assumptional 
             violance.",
           br(),
           br(),
           HTML("In item level, you may consider using <strong>&phi; Coefficient</strong> for each item."))
      } else if (input$theory_type == "Classical Test Theory (CTT)" &&
                 input$study_type == "Reliability studies" &&
                 input$reliability_type == "Alternate forms" &&
                 input$item_type_3 == "Polytomous") {
         p("I can recommend you to use", strong("Pearson Correlation Coefficient"), "in test level, if there are no assumptional 
             violance.",
           br(),
           br(),
           "In item level, you may consider using the ", strong("Spearman's Rank Correlation"), " for each item.")
      } else if (input$theory_type == "Classical Test Theory (CTT)" &&
                 input$study_type == "Reliability studies" &&
                 input$reliability_type == "Alternate forms" &&
                 input$item_type_3 == "Mixed") {
         p("In test level, I can recommend you to use:",
           br(), 
           "- ", strong("Pearson Correlation Coefficient"), "with total scores if there are no assumptional violance.",
           br(),
           br(),
           "In item level, you may consider using:",
           br(),
           HTML("- <strong>&phi; coefficient</strong> for dichotomous items."),
           br(),
           "- ", strong("Spearman's Rank Correlation"), " for polytomous items.")
      } else if (input$theory_type == "Classical Test Theory (CTT)" &&
                 input$study_type == "Reliability studies" &&
                 input$reliability_type == "Inter-rater reliability") {
         p("Depending on the number of raters and the measurement level of the ratings, you may consider the following.",
           br(),
           HTML("- <strong>Cohen's &kappa;</strong>"),
           br(),
           HTML("- <strong>Fleiss's &kappa;</strong>"),
           br(),
           "- ", strong("Intraclass Correlation Coefficient (ICC)"),
           br(),
           HTML("- <strong>Krippendorff’s &alpha;</strong>"),
           br(),
           "- ", strong("Simple agreement percentage"),
           br(),
           br(),
           br(),
           HTML("<i><strong>Reminder-1:</strong> If your data is multidimensional, you may consider to study on each dimension 
             seperately with these techniques</i>"),
           br(),
           br(),
           HTML("<i><strong>Reminder-2:</strong> Although commonly used in the context of inter-rater reliability, these coefficients 
             indicate the level of agreement between raters or judgments and are indirect indicators of inter-rater reliability. 
             To obtain evidence of the reliability of a test or scale, they must be correlated with the trait being measured.<br><br>
             Additionally, complex models that include variance arguments such as <strong>Generalizability Theory</strong> or
             <strong>Multi-Facet Rasch</strong> may be more appropriate for inter-rater reliability.</i>"))
      } else if (input$theory_type == "Item Response Theory (IRT)" &&
                 input$study_type == "Reliability studies" &&
                 input$dimension_type_3 == "Unidimensional") {
         p("I can recommend you to consider:",
           br(),
           "- ", strong("Item Information Function (IIF)"),
           br(),
           "- ", strong("Test Information Function (TIF)"))
      } else if (input$theory_type == "Item Response Theory (IRT)" &&
                 input$study_type == "Reliability studies" &&
                 input$dimension_type_3 == "Multidimensional") {
         p("I can recommend you to consider:",
           br(),
           "- ", strong("Multivariate Item Information Function (MIIF)"),
           br(),
           "- ", strong("Multivariate Test Information Function (MTIF)"))
      } else if (input$theory_type == "Classical Test Theory (CTT)" && input$validity_type_1 == "Content validity") {
         p("I can recommend you to consider:",
           br(),
           "- ", strong("Content Validity Index (CVI)"),
           br(),
           "- ", strong("Content Mapping"),
           br(),
           "- ", strong("Q-Sort Method"))
      } else if (input$theory_type == "Item Response Theory (IRT)" && input$validity_type_1 == "Content validity") {
         p("I can recommend you to consider similar techniques with CTT:",
           br(),
           "- ", strong("Content Validity Index (CVI)"),
           br(),
           "- ", strong("Content Mapping"),
           br(),
           "- ", strong("Q-Sort Method"),
           br(),
           br(),
           "Additionally, you may consider in IRT context:",
           br(),
           "- ", strong("Item parameter estimates"),
           br(),
           "- ", strong("Model-data fit"),
           br(),
           "- ", strong("Test Information Function (TIF)"))
      } else if (input$theory_type == "Classical Test Theory (CTT)" && input$validity_type_1 == "Criterian-based validity") {
         p("This is a comprehensive topic. There are many subtypes of criterion-based validity. Basically almost all of them use 
             the following in the total scores of a test or scale:",
           br(),
           "- Apropriate", strong("correlation coefficients"), " between total scores and criterian scores, such as Pearson 
             correlation",
           br(),
           "- Appropriate ", strong("univariate regression models"),
           br(),
           "- Appropriate ", strong("multivariate regression models"), ", especially if data is multidimensional",
           br(),
           br(),
           em("For more detailed information, you may take a look at the cloumn of the brief explanations."))
      } else if (input$theory_type == "Item Response Theory (IRT)" && input$validity_type_1 == "Criterian-based validity") {
         p("In the context of IRT, you can consider the following in the study of criterian-based validity:",
           br(),
           "- ", strong("Latent Trait Correlation"),
           br(),
           "- ", strong("Item-Level Information"),
           br(),
           "- ", strong("Test Information Function (TIF)"),
           br(),
           br(),
           em("For more detailed information, you may take a look at the cloumn of the brief explanations."))
      } else if (input$theory_type == "Classical Test Theory (CTT)" && input$validity_type_1 == "Discriminative validity") {
         p("In the context of CTT, you can consider the following techniques in the study of discriminative validity:",
           br(),
           br(),
           "- Group comparisions (eg. lower-upper groups) with hyphothesis tests, such as ", strong("ANOVA"), " or ", strong("t-test."),
           br(),
           br(),
           "- Item-total scores correlations with ", strong("Point-biserial correlation"), " or ", strong("polyserial correlation"),
           br(),
           br(),
           "- Classification accuracy between sub-groups with ", strong("Discriminant Function Analysis"), " or  ", 
             strong("Logistic Regression."))
      } else if (input$theory_type == "Item Response Theory (IRT)" && input$validity_type_1 == "Discriminative validity") {
         p("In the context of IRT, you can consider the following in the study of discriminative validity:",
           br(),
           "- Item Discrimination Parameter (a-parameter)",
           br(),
           "- Item Characteristic Curves (ICC)",
           br(),
           "- Likelihood Ratio Tests between nested models")
      } else if (input$theory_type == "Classical Test Theory (CTT)" && input$validity_type_2 == "Structural validity") {
         p("I can recommend you to consider:",
           br(),
           br(),
           strong("If your items are continuous:"),
           br(),
           "- Principal Component Analysis (PCA)",
           br(),
           "- Exploratory Factor Analysis (EFA)",
           br(),
           "- Confirmatory Factor Analysis (CFA)",
           br(),
           br(),
           strong("If your items are polytomous:"),
           br(),
           "- PCA or EFA with polyserial correlation matrix",
           br(),
           "- Ordinal Confirmatory Factor Analysis (Ordinal-CFA)",
           br(),
           "- Categorical Principal Component Analysis (CATPCA)",
           br(),
           "- Multiple Correspondance Analysis (MCA)",
           br(),
           br(),
           strong("If your items are dichotomous:"),
           br(),
           "- PCA or EFA with tetrachoric correlation matrix",
           br(),
           "- Categorical Principal Component Analysis (CATPCA)",
           br(),
           "- Multiple Correspondance Analysis (MCA)",
           br(),
           br(),
           br(),
           em(strong("Reminder:"), " You can use these techniques together to obtain stronger evidence about the underlying structure 
             of a test or a scale."),
           br(),
           br(),
           em("Additionally, PCA and EFA may be considered as more appropriate for test development and CFA for
             test adaptation."))
      } else if (input$theory_type == "Item Response Theory (IRT)" && input$validity_type_2 == "Structural validity") {
         p("I can recommend you to consider:",
           br(),
           "- ", strong("Item Fit Analysis"),
           br(), 
           "- ", strong("Multidimensional Item Response Theory (MIRT)"))
      } else if (input$theory_type == "Classical Test Theory (CTT)" && input$validity_type_2 == "Differential item functioning") {
         p("I can recommend you to consider:",
           br(),
           HTML("- <strong>Angoff's Transformed Item Difficulties (Angoff' &Delta;)</strong>"),
           br(),
           "- ", strong("Dorans Standardization"),
           br(),
           HTML("- <strong>Mantel-Haenszel <i>&chi;<sup>2</sup></i></strong>"), 
           br(),
           "- ", strong("Logistic Regression"),
           br(),
           br(),
           br(),
           em(strong("Reminder:"), " These techniques are based on unidimensionality and includes two groups as reference and focal.
             For multiple groups, you may consider the 'generalized' versions of these techniques."))
      } else if (input$theory_type == "Item Response Theory (IRT)" && input$validity_type_2 == "Differential item functioning") {
         p("I can recommend you to consider:",
           br(),
           HTML("- <strong>Lord <i>&chi;<sup>2</sup></i></strong>"), 
           br(),
           "- ", strong("Raju's Signed/Unsigned Area Tests"),
           br(),
           "- ", strong("SIBTEST"),
           br(),
           "- ", strong("TSW-Likelihood Ratio Test"),
           br(),
           br(),
           br(),
           em(strong("Reminder:"), " These techniques are based on unidimensionality and includes two groups as reference and focal.
             For multiple groups, you may consider the 'generalized' versions of these techniques or 'Mixed-IRT models'. 
             Additionally, for multidimensional structures, you may consider 'Multivariate-IRT models'"))
      } else if (input$theory_type == "Classical Test Theory (CTT)" && input$validity_type_2 == "Test equating") {
         p("I can recommend you to consider:",
           br(),
           "- ", strong("Linear Transformation"),
           br(),
           "- ", strong("Equipercentile Equating"),
           br(),
           "- ", strong("Polynomial Equating"))
      } else if (input$theory_type == "Item Response Theory (IRT)" && input$validity_type_2 == "Test equating") {
         p("I can recommend you to consider:",
           br(),
           "- ", strong("Stocking and Lord Method"),
           br(),
           "- ", strong("Lord's Method"),
           br(),
           "- ", strong("Haebara Method"),
           br(),
           "- ", strong("Holland and Rubin Method"))
      } else if (input$theory_type == "Classical Test Theory (CTT)" && input$validity_type_2 == "Test equating") {
         p("I can recommend you to consider:",
           br(),
           "- ", strong("Linear Transformation"),
           br(),
           "- ", strong("Equipercentile Equating"),
           br(),
           "- ", strong("Polynomial Equating"))
      } else if (input$theory_type == "Item Response Theory (IRT)" && input$validity_type_2 == "Test equating") {
         p("I can recommend you to consider:",
           br(),
           "- ", strong("Stocking and Lord Method"),
           br(),
           "- ", strong("Lord's Method"),
           br(),
           "- ", strong("Haebara Method"),
           br(),
           "- ", strong("Holland and Rubin Method"))
      } else if (input$theory_type == "Classical Test Theory (CTT)" && input$validity_type_2 == "Measurement invariance") {
         p("I can recommend you to consider:",
           br(),
           br(),
           "- ", strong("Multigroup Confirmatory Factor Analysis (Multigroup CFA)"),
           br(),
           br(),
           "- ", strong("Differential Item Functioning Analysis"))
      } else if (input$theory_type == "Item Response Theory (IRT)" && input$validity_type_2 == "Measurement invariance") {
         p("I can recommend you to consider:",
           br(),
           "- ", strong("Multigroup IRT Modeling"))
      } else {
        p("Please complete the related inquiries to get a recommendation.")
      }
    } else {
      p("Please select a module to get recommendations.")
    }

  })


  # Render the brief explanation
  output$brief_explanations <- renderUI({

    #Module-1 for Column-4
    if (input$module == "Module 1. Analyzing the text documents") {
      if (input$doc_pool_size %in% c("Small", "Medium") && input$themes_clear == "Clear") {
        p(strong("Simple Document Analysis"), " is appropriate for small to medium-sized document pools. This technique involves 
            a straightforward examination of documents to extract basic information or summarize content. It’s less complex and 
            does not require extensive coding or categorization.")
      } else if (input$doc_pool_size == "Small" && input$themes_clear == "Unclear") {
        p(strong("Thematic Analysis"), " is best for small to medium-sized document pools. This method focuses on identifying and 
            analyzing themes or patterns within qualitative data. It involves coding data into categories and grouping these codes 
            into themes. While it is systematic, it is generally less complex than content analysis and does not involve extensive 
            quantification.")
      } else if (input$doc_pool_size == "Medium" && input$themes_clear == "Unclear") {
        p(strong("Thematic Analysis"), " is best for small to medium-sized document pools. This method focuses on identifying and 
            analyzing themes or patterns within qualitative data. It involves coding data into categories and grouping these codes 
            into themes. While it is systematic, it is generally less complex than content analysis and does not involve extensive 
            quantification.",
          br(),
          br(),
          strong("Simple Content Analysis"), " is appropriate for small to medium-sized document pools. This technique involves 
            basic coding and quantification of content elements, such as counting the frequency of specific words or phrases. 
            It is less detailed than full content analysis and is often used for initial explorations of textual data.")
      } else if (input$doc_pool_size == "Large" && input$themes_clear %in% c("Clear", "Unclear")) {
        p(strong("Content Analysis"), " is effective for medium to large-sized document pools. This method involves 
            systematic coding and quantifying the content of documents. It aims to identify the frequency and significance of 
            specific elements within the text. Content analysis is more complex due to its detailed coding process and its ability 
            to handle large volumes of text.")
      } else if (input$doc_pool_size == "Very large" && input$themes_clear %in% c("Clear", "Unclear")) {
        p(strong("Text Mining"), " is ideal for large to very large document pools. This computational technique uses 
            advanced methods like natural language processing (NLP) and machine learning to extract and analyze information from 
            extensive textual data. It is highly automated and suitable for handling vast amounts of text with complex patterns and 
            trends.")
      } else {
        p("Please complete the related inquiries to get a brief explanation.")
      }

    #Module-2 for Column-4
    } else if (input$module == "Module 2. Checking the basic assumptions") {
      if (input$assumption_check == "Normality") {
        p("Both ", strong("Shapiro-Wilk test"), " and", strong("Kolmogorov-Smirnov test"), " can use for comparing sample 
            distribution to a reference distribution such as normal. A p-value < 0.05 indicates significant deviation from 
            normality.",
          br(),
          br(),
          "These tests are sensitive for sample size. It’s recommended that the sample size should be more than 30, preferably. 
            On the other hand, large samples may show significant results for minor deviations from normality. In this case, 
            you can consider more conservative significant level such as 0.01 or 0.001.",
          br(),
          br(),
          "Non-normal data can lead to invalid results in parametric tests and in general linear models. Consider to use robust 
            alternatives or transformations or non-parametric tests if normality is violated.")
      } else if (input$assumption_check == "Multivariate normality") {
        p("Multivariate normality can be taken into account in multivariate parametric tests such as MANOVA, canonical correlation 
            analysis, factor analysis.",
          br(),
          br(),
          strong("Mardia's test"), " assesses multivariate normality based on skewness and kurtosis.",
          br(),
          br(),
          strong("Henze-Zirkler’s test"), " evaluates multivariate normality using a characteristic function approach.",
          br(),
          br(),
          "Both tests, a p-value < 0.05 suggests deviations from multivariate normality. Large samples may show significant results 
            for minor deviations from normality. In this case, you can consider more conservative significant level such as 0.01 or 
            0.001.",
          br(),
          br(),
          "Multivariate normality assumes normality for all variables jointly. Violations can affect the power and accuracy of 
            multivariate tests. Use transformations or robust methods if necessary.")
      } else if (input$assumption_check == "Homogeneity of variances (Homoscedasticity)") {
        p("Homogeneity of variances, also known as homoscedasticity, refers to the assumption that different groups have the same 
            variance. This assumption is important in tests like ANOVA, regression analysis, and t-tests.",
          br(),
          br(),
          strong("Levene’s Test:"), " Tests if the variances are equal across groups. It is less sensitive to deviations from 
           normality compared to other tests. Can be sensitive to departures from normality in the data.",
          br(),
          br(),
          strong("Bartlett’s Test:"), " Tests if variances are equal across groups. It assumes normality of the data. 
            Not robust to deviations from normality. It can produce misleading results if data is not normally distributed.",
          br(),
          br(),
          strong("Brown-Forsythe Test:"), " Similar to Levene’s test but uses the median instead of the mean, making it 
            more robust to non-normality. May be less powerful than Levene’s test in some cases but more robust to non-normal data.",
          br(),
          br(),
          strong("Fligner-Killeen Test:"), " Unlike some other tests, the Fligner-Killeen test is non-parametric, 
            meaning it does not rely on the assumption of a specific data distribution, which makes it particularly robust 
            against deviations from normality. While it is typically used for comparing variances across three or more groups, 
            it can technically be applied to just two groups as well.",          
          br(),
          br(),
          "All these tests, a significant p-value (typically p < 0.05) indicates that variances are not equal.")
      } else if (input$assumption_check == "Homogeneity of variance-covariance matrices") {
        p(strong("Box’s M Test"), " may be considered for the use of multivariate models such as MANOVA or 
            Discriminant Function Analysis. It tests if the variance-covariance matrices are equal across groups. 
            A significant p-value (typically p < 0.05) suggests that variance-covariance matrices are not equal. 
            This test can be sensitive to sample size and deviations from multivariate normality. Often requires 
            large samples to provide reliable results.")
      } else if (input$assumption_check == "Linearity") {
        p("Linearity can be considered in correlation and regression analysis. In linear regression, the significance of 
            coefficients (p-value < 0.05) indicates a linear relationship.",
          br(),
          br(),
          "It’s sensitive to sample size. Large samples may show significant results for minor deviations from linearity.",
          br(),
          br(),
          "Non-linearity can lead to biased estimates and incorrect conclusions. Consider polynomial or non-linear models if 
            linearity is violated.")
      } else if (input$assumption_check == "Multivariate linearity") {
        p("Multivariate linearity can be taken into account in MANOVA, canonical correlation.", 
          br(),
          br(),
          strong("Multivariate regression analysis"), " tests if the relationship among multiple dependent and independent variables 
            is linear. Non-significant p-values for interaction terms suggest linear relationships among variables. 
            Non-multivariate linearity can affect the validity of multivariate analyses.")
      } else if (input$assumption_check == "Independence of residuals (Autocorrelation)") {
        p("Analyses such as regression analysis or time series analysis require that the independence of model residuals be met. 
            Autocorrelation can inflate Type I error rates.",
          br(),
          br(),
          strong("Durbin-Watson test"), " tests for autocorrelation in the residuals of a regression model. Durbin-Watson statistic 
            close to 2 (between 1.5 and 2.5) indicates no significant autocorrelation. Values significantly below 1 or above 3 
            suggest positive or negative autocorrelation, respectively.")
      } else if (input$assumption_check == "Sphericity") {
        p("Sphericity is a requiring for repeated measure ANOVA model. Violations can lead to inflated Type I error rates. 
            You can use Greenhouse-Geisser or Huynh-Feldt corrections if sphericity is violated in this model.",
          br(),
          br(),
          strong("Mauchly's test"), " tests the assumption of sphericity in repeated measures ANOVA. A p-value < 0.05 indicates 
            a violation of sphericity.")
      } else if (input$assumption_check == "Outliers") {
        p(strong("Grubbs' test"), " identifies outliers in a univariate dataset. A p-value < 0.05 suggests the presence of 
            an outlier.",
          br(),
          br(),
          strong("Mahalanobis distance"), " measures the distance of a data point from the mean of a multivariate distribution, 
            identifying outliers. Values greater than a critical value (based on chi-square distribution) indicate outliers.",
          br(),
          br(),
          "Outliers can distort results. Consider removing or transforming outliers, or using robust statistical methods.")
      } else if (input$assumption_check == "Missing value pattern") {
        p(strong("Little's MCAR test"), " tests whether missing data are Missing Completely At Random (MCAR). A p-value < 0.05 
            indicates that data are not MCAR. Non-random missing data can bias results. This test is sensitive to sample size. 
            Large samples may show significant results for minor patterns of missing data.")
      } else {
        p("Please completethe related inquiries to get a brief explanation.")
      }

    #Module-3 for Column-4
    } else if (input$module == "Module 3. Comparison of independent groups") {
      if (input$number_of_dv == "Single" && 
          input$number_of_group == "Just two groups" && 
          input$existence_of_cv == "No") {
        p(strong("Independent samples t-test"), " compares the means of two independent groups, assuming normality and 
            equal variances.",
          br(),
          br(),
          strong("Welch’s t-test"), " adjusts for unequal variances. It's robust alternative of t-test when there is a violation of 
            homoscedasticity.",
          br(),
          br(),
          strong("Wilcoxon Runk Sum Test"), " and ", strong("Mann-Whitney U Test"), " compare ranks between groups and are 
            distrubition-free tests.") 
      } else if (input$number_of_dv == "Single" && 
                 input$number_of_group == "Just two groups" && 
                 input$existence_of_cv == "Yes") {
        p(strong("ANCOVA"), " adjusts for covariates while comparing group means, assuming homogeneity of regression slopes.", 
          strong("One-way ANCOVA"), " compares means across groups, assuming homogeneity of regression slopes.", 
          br(),
          br(),
          strong("Robust ANCOVA"), " and ", strong("GLM"), " handle assumption violations. These are robust to the violation of 
            basic assumptions such as skewness or heterocedasticity.",
          br(),
          br(),        
          strong("Quade's Rank Analysis of Covariance"), " and ", strong("bootstrapped GLMs"), " are non-parametric alternatives 
            that can be used in case parametric assumptions are violated.")
      } else if (input$number_of_dv == "Single" && 
                 input$number_of_group == "Three or more groups" && 
                 input$existence_of_cv == "No") {
        p(strong("One-Way ANOVA"), " compares means across multiple groups with one IV, assuming normality and equal variances.",
          br(),
          br(),
          strong("Factorial ANOVA"), " includes multiple IVs and provides to describe the interaction effects. Give more details 
            for differences among groups.",
          br(),
          br(),
          strong("Welch’s ANOVA"), " adjusts for unequal variances while there are one IV.", 
          br(),
          br(),
          strong("Kruskal-Wallis Test"), " compares ranks across groups and is a distrubition-free test.",
          br(),
          br(),
          strong("Friedman Two-Way ANOVA"), " and ", strong("Quade's Two-Way ANOVA"), " can be considered as non-parametric 
            alternatives of ", strong("Two-Way ANOVA"), "but in block design. These techniques depend on ranking and 
            less sensitive the violations of normality.")
      } else if (input$number_of_dv == "Single" && 
                 input$number_of_group == "Three or more groups" && 
                 input$existence_of_cv == "Yes") {
        p(strong("ANCOVA"), " adjusts for covariates while comparing group means, assuming homogeneity of regression slopes.", 
          br(),
          br(),
          strong("One-way ANCOVA"), " compares means across groups, assuming homogeneity of regression slopes.", 
          br(),
          br(),
          strong("Factorial ANCOVA"), " includes multiple IVs and one or more CVs, and provides to describe the interaction effects. Give more details for 
            differences among groups.",
          br(),
          br(),
          strong("Robust ANCOVA"), " and ", strong("GLM"), " handle assumption violations. These are robust to the violation of 
            basic assumptions such as skewness or heterocedasticity.",
          br(),
          br(),        
          strong("Quade's Rank Analysis of Covariance"), " and ", strong("bootstrapped GLMs"), " are non-parametric alternatives 
            that can be used in case parametric assumptions are violated.")
      } else if (input$number_of_dv == "Multiple" && 
                 input$number_of_group == "Just two groups" && 
                 input$existence_of_cv == "No") {
        p(strong("MANOVA"), " compares mean vectors of multiple dependent variables, assuming multivariate normality.", 
          br(),
          br(),
          strong("Robust MANOVA"), " and ", strong("Multivariate GLM"), " handle assumption violations.", 
          br(),
          br(),
          strong("PERMANOVA"), " is a non-parametric alternative that can be used in case some certain parametric assumptions are 
            violated.")
      } else if (input$number_of_dv == "Multiple" && 
                 input$number_of_group == "Just two groups" && 
                 input$existence_of_cv == "Yes") {
        p(strong("MANCOVA"), " controls for covariates while comparing mean vectors, assuming homogeneity of regression slopes.",
          br(),
          br(),
          strong("Robust MANCOVA"), " and ", strong("Multivariate GLM"), " handle assumption violations.", 
          br(),
          br(),
          "Non-parametric alternatives, such as ", strong("PERMANOVA with covariates"), " adjust for covariates.")
      } else if (input$number_of_dv == "Multiple" && 
                 input$number_of_group == "Three or more groups" && 
                 input$existence_of_cv == "No") {
        p(strong("One-way MANOVA"), " compares mean vectors of multiple dependent variables, assuming multivariate normality. 
            There is one IV in this model", 
          br(),
          br(),
          strong("Factorial MANOVA"), " includes multiple IVs  and provides to describe the interaction effects of IVs. 
            Give more details for differences among groups.",
          br(),
          br(),
          strong("Robust MANOVA"), " and ", strong("Multivariate GLM"), " handle assumption violations.")
      } else if (input$number_of_dv == "Multiple" && 
                 input$number_of_group == "Three or more groups" && 
                 input$existence_of_cv == "Yes") {
        p(strong("One-way MANCOVA"), " compares mean vectors, assuming homogeneity of regression slopes.", 
          br(),
          br(),
          strong("Factorial MANCOVA"), " includes multiple IVs besides covariates and provides to describe the interaction effects 
            of IVs. Give more details for differences among groups.",
          br(),
          br(),
          strong("Robust MANCOVA"), " and ", strong("Multivariate GLM"), " handle assumption violations.")
      } else {
        p("Please complete the related inquiries to get a brief explanation.")
      }

    ##Module-4 for Column-4
    } else if (input$module == "Module 4. Testing the effects in an experimental design") {
      if (input$experiment_design == "Single-subject") {
        p(strong("Single-subject designs"), " focus on analyzing the effects of interventions on individual participants 
           by observing changes over time. Key types include the AB, ABA, ABAB, Multiple Baseline Design and etc. These designs 
           emphasize detailed, individual-level data analysis to assess the impact of treatments and are especially useful 
           when group-based research is impractical.",
          br(),
          br(),
          "In single-subject designs, traditional statistical methods and hypothesis tests, like ANOVA, MANOVA, or Wilcoxon tests, 
            are often not appropriate due to the design's focus on a single participant or a few participants over time. Instead;",
          br(),
          br(),
          "- ", strong("Visual Analysis"), " and ", strong("Descriptive Statistics"), " are key initial steps.",
          br(),
          br(),
          "- ", strong("Trend analysis"), " in single-subject design involves examining the direction and pattern of data changes 
            over time. This method helps to identify whether there are consistent increases or decreases in the outcome measures 
            and to assess the impact of interventions or changes in conditions.",
          br(),
          br(),
          "- ", strong("Time series analysis"), " examines patterns, trends, and changes in data over time. 
            It is particularly useful in single-subject designs for assessing the impact of interventions or changes within 
            an individual’s data. Interrupted Time Series Analysis (ITSA), ARIMA Models, CUSUM Charts, 
            and Segmented Regression Analysis are all appropriate methods for analyzing time series data in single-subject designs. 
            These techniques are tailored to understanding changes and trends over time, making them suitable even for 
            a small number of subjects or just one subject.")
      } else if (input$experiment_design == "One-group" && input$experiment_dv == "1" && 
                 input$experiment_measures == "Posttest only" && input$experiment_cv == "No") {
        p(strong("One-Sample t-test"), " tests whether the sample mean differs from a known value.",
          br(),
          br(),
          strong("Wilcoxon Signed-Rank Test"), " is a non-parametric alternative to the one-sample t-test, used when data is not 
            normally distributed.")
      } else if (input$experiment_design == "One-group" && input$experiment_dv == "1" && 
                 input$experiment_measures == "Posttest only" && input$experiment_cv == "Yes") {
        p("With only post-test data and a single group, covariates are not typically used.")
      } else if (input$experiment_design == "One-group" && input$experiment_dv == "1" && 
                 input$experiment_measures == "Pretest - Posttest" && input$experiment_cv == "No") {
        p(strong("Paired t-test:"), " Compares means of two related groups (pretest vs. posttest).",
          br(),
          br(),
          strong("Wilcoxon Signed-Rank Test:"), " Non-parametric alternative to the paired t-test.")
      } else if (input$experiment_design == "One-group" && input$experiment_dv == "1" && 
                 input$experiment_measures %in% c("Pretest - Posttest", "3 or more repeated tests") && 
                 input$experiment_cv == "Yes") {
        p("In a pretest-posttest design with only one group, ", strong("Repeated Measures ANCOVA"), " allows you to determine 
          the effect of an intervention by comparing pretest and posttest scores while controlling for covariates. It involves 
          adjusting the posttest scores based on the covariates and then comparing the adjusted means. This helps in reducing 
          error variance and provides a more accurate estimate of the treatment effect.",
          br(),
          br(), 
          strong("Assumptions:"),
          br(),
          br(),
          strong("1- Independence of Observations:"), " The data collected should be from the same individuals at both pretest 
            and posttest (repeated measures), but the measurements themselves should be independent.",
          br(),
          br(),
          strong("2- Normality:"), " The distribution of the residuals (errors) should be approximately normally distributed for 
            each group (pretest and posttest).",
          br(),
          br(),
          strong("3- Sphericity:"), " If there are more than two time points, sphericity (the equality of variances of the differences 
          between levels of the repeated measures) is assumed. However, in a simple pretest-posttest design, this assumption is not 
          applicable.",
          br(),
          br(),
          strong("4- Homogeneity of Regression Slopes:"), " Without modelling interaction effects, the relationship between 
            the covariate(s) and the dependent variable should be the same across different levels of the repeated measure 
            (pretest and posttest).",
          br(),
          br(),
          strong("5- Sample Size:"), " While there’s no strict rule, a larger sample size increases the power of the ANCOVA. 
            Generally, a minimum of 20-30 participants is recommended, but more may be needed depending on the effect size 
            and the number of covariates.",
          br(),
          br(),
          strong("6- Linearity:"), " The relationship between the covariate(s) and the dependent variable should be linear.",
          br(),
          br(),
          strong("7- Covariate Measurement:"), " The covariate(s) should be measured without error. This is crucial because 
            measurement error in the covariate can lead to biased estimates.")
      } else if (input$experiment_design == "One-group" && input$experiment_dv == "1" && 
                 input$experiment_measures %in% c("Pretest - Posttest", "3 or more repeated tests") && 
                 input$experiment_cv == "No") {
        p(strong("Repeated Measures ANOVA"), " for one group with 3 or more repeated measures is powerful for detecting 
          within-subject effects, such as changes over time, while controlling for individual variability. RM-ANOVA helps 
          to determine whether there are statistically significant differences in the means across the repeated measurements. 
          By accounting for the correlation between measurements taken from the same participants, it reduces error variance 
          and improves the ability to detect true differences. This is particularly useful when you want to understand 
          patterns of change or effects of conditions over time.",
          br(),
          br(),
          strong("Assumptions:"),
          br(),
          br(),
          strong("1- Normality:"), " The differences between the repeated measures should be approximately normally distributed. 
            This assumption is more critical for smaller sample sizes.",
          br(),
          br(),
          strong("2- Sphericity:"), " Sphericity requires that the variances of the differences between all possible pairs of 
            repeated measures (time points or conditions) are equal. Violations of sphericity can lead to inaccurate p-values. 
            If this assumption is violated, corrections like the Greenhouse-Geisser or Huynh-Feldt adjustments are used to correct 
            the degrees of freedom.",
          br(),
          br(),
          strong("3- Sample Size:"), " While there is no strict rule, a sample size of 20-30 participants is often recommended for 
            each group, but more may be necessary depending on the effect size and the number of repeated measures.",
          br(),
          br(),
          strong("4- Homogeneity of Covariance Matrices:"), " While not as common as sphericity, this assumption refers to 
            the equality of covariances between pairs of measurements. It is a more general form of the sphericity assumption.",
          br(),
          br(),
          strong("5- Linearity:"), " The relationship between time (or conditions) and the dependent variable should be approximately 
            linear for the tests to be valid.",
          br(),
          br(),
          br(),
          strong("Friedman Test"), " is a robust method for analyzing ordinal or non-normally distributed data from 
            within-subject designs with three or more conditions. It is commonly used in psychology, education, and medical research
            where parametric assumptions cannot be met.",
          br(),
          br(),
          "Friedman ANOVA ranks the data across the different conditions for each participant and then tests whether the mean ranks 
            differ significantly across conditions. It is often used when the dependent variable is ordinal or when the data do not  
            meet the assumptions required for parametric tests. The test can indicate whether there are statistically significant 
            differences between conditions, but it does not specify which conditions differ from each other—post-hoc tests 
            are needed for that.",
          br(),
          br(),
          "There is no strict requirement for sample size, but like all statistical tests, larger sample sizes provide 
            more reliable results. A minimum of 10-15 participants is often recommended for each group, though more may be needed 
            depending on the variability in the data.")
      } else if (input$experiment_design %in% c("One-group", "Multi-group") && input$experiment_dv == "2 or more" && 
                 input$experiment_measures == "Posttest only" && input$experiment_cv == "No") {
        p("If you have just one group and are measuring multiple dependent variables, you can still use ", strong("MANOVA"), 
          " to analyze the relationships among these dependent variables. The focus will be on understanding how these variables 
            interact with each other within the single group.",
          br(),
          br(),
          "MANOVA is used in experiments where you have two or more groups and want to compare them on multiple dependent variables 
            simultaneously after a posttest. This is useful when you believe that the dependent variables are related and 
            measuring them together could provide more insight than analyzing them separately. For example, you might compare 
            different treatment groups on a combination of outcomes, such as anxiety, depression, and stress levels, 
            after an intervention.", 
          br(),
          br(),
          "If MANOVA finds a significant effect, it indicates that there are group differences on the multivariate combination of 
            dependent variables. Subsequent univariate ANOVAs or post-hoc tests can be performed to understand which specific 
            dependent variables contribute to the observed differences.",
          br(),
          br(),
          strong("Assumptions:"),
          br(),
          br(),
          strong("1- Multivariate Normality:"), " The dependent variables should follow a multivariate normal distribution within 
            each group. This assumption is more stringent than the univariate normality assumption required for ANOVA. 
            Violations can affect the validity of the results, especially in small samples.",
          br(),
          br(),
          strong("2- Homogeneity of Covariance Matrices:"), " The covariance matrices of the dependent variables should be equal 
            across groups. This assumption is an extension of the homogeneity of variances assumption in ANOVA. Box’s M test is 
            often used to assess this assumption, but it can be sensitive to sample size.",
          br(),
          br(),
          strong("3- Linear Relationships:"), " There should be linear relationships among all pairs of dependent variables within 
            each group. This is important because MANOVA assesses the relationship between the dependent variables.",
          br(),
          br(),
          strong("4- Adequate Sample Size:"), " MANOVA generally requires a larger sample size than univariate ANOVA because 
            it needs sufficient power to detect differences across multiple dependent variables. A general rule of thumb is to have 
            more participants than the number of dependent variables in each group, but the exact number can vary depending on 
            the effect size and number of groups.",
          br(),
          br(),
          strong("5- No Multicollinearity:"), " The dependent variables should not be too highly correlated with each other. 
            If they are, it can make the results difficult to interpret, as it would suggest that the dependent variables are 
            measuring the same underlying construct.",
          br(),
          br(),
          strong("6- Balanced Groups:"), " While not a strict requirement, equal group sizes help to satisfy the assumptions 
            and increase the robustness of the test.")
      } else if (input$experiment_design %in% c("One-group", "Multi-group") && input$experiment_dv == "2 or more" && 
                 input$experiment_measures == "Posttest only" && input$experiment_cv == "Yes") {
        p(strong("MANCOVA"), " is similar to MANOVA but adjusts for covariates, providing a more accurate analysis of 
          group differences on multiple dependent variables.",
          br(),
          br(),
          "Although you have just one group, you can still use MANCOVA to analyze the relationships among these dependent variables. 
            The focus will be on understanding how these variables interact with each other within the single group.")
      } else if (input$experiment_design == "One-group" && input$experiment_dv == "2 or more" && 
                 input$experiment_measures %in% c("Pretest - Posttest", "3 or more repeated tests") && 
                 input$experiment_cv == "No") {
        p(strong("Repeated Measures MANOVA"), " allows you to examine whether there are statistically significant differences 
          in the multivariate combination of the dependent variables across the repeated measures. It evaluates both 
          the main effects (e.g., time, treatment) and interaction effects (e.g., time × treatment) on the set of 
          dependent variables. If significant differences are found, follow-up analyses such as univariate ANOVAs or post-hoc tests 
          can help to determine which specific dependent variables and time points are driving these differences.",
          br(),
          br(), 
          strong("Assumptions:"),
          br(),
          br(),
          strong("1- Multivariate Normality:"), " The dependent variables should follow a multivariate normal distribution for 
            each combination of levels of the repeated measures (e.g., at each time point). This assumption is critical for 
            the validity of the test.",
          br(),
          br(),
          strong("2- Sphericity"), " (for univariate tests): If you are conducting univariate tests after MANOVA, sphericity 
          (equal variances of the differences between all pairs of repeated measures) is assumed. Violations can be addressed with 
          corrections like Greenhouse-Geisser or Huynh-Feldt adjustments.",
          br(),
          br(),
          strong("3- Homogeneity of Covariance Matrices:"), " The covariance matrices of the dependent variables should be similar 
            across groups (if groups exist) and conditions. This assumption is crucial for the MANOVA test, and violations can lead 
            to biased results. Box’s M test is often used to check this assumption.",
          br(),
          br(),
          strong("4- Linearity:"), " There should be a linear relationship between pairs of dependent variables for each level of 
            the repeated measures. Non-linearity can distort the MANOVA results.",
          br(),
          br(),
          strong("5- Adequate Sample Size:"), "- Repeated Measures MANOVA generally requires a larger sample size due to 
            the complexity of analyzing multiple dependent variables across time or conditions. A common guideline is to have 
            more subjects than the number of dependent variables and repeated measures combined, but the exact requirement 
            depends on the effect sizes and the number of groups or conditions.",
          br(),
          br(),
          strong("6- No Multicollinearity:"), " The dependent variables should not be excessively correlated with each other. 
            High multicollinearity can make it difficult to interpret the results because it implies that the dependent variables 
            may be measuring the same construct.",
          br(),
          br(),
          strong("7- Complete Data:"), " Ideally, there should be no missing data across the repeated measures. Missing data can 
            lead to issues in estimation and reduce the power of the analysis.")
      } else if (input$experiment_design == "One-group" && input$experiment_dv == "2 or more" && 
                 input$experiment_measures %in% c("Pretest - Posttest", "3 or more repeated tests") && 
                 input$experiment_cv == "Yes") {
        p(strong("Repeated Measures MANCOVA"), " examines whether there are statistically significant differences 
          in the multivariate combination of dependent variables across repeated measures while controlling for the effects of 
          covariates. It assesses the main effects (e.g., time, treatment), interaction effects (e.g., time × treatment), 
          and the effects of covariates on the dependent variables. This analysis provides a more precise understanding of 
          the relationships between the variables by adjusting for the covariates' influence, thereby reducing error variance 
          and improving the accuracy of the results.",
          br(),
          br(),
          strong("Assumptions:"),
          br(),
          br(),
          strong("1- Multivariate Normality:"), " The dependent variables should be multivariate normally distributed for 
            each level of the repeated measures. The covariates should also follow a normal distribution.",
          br(),
          br(),
          strong("2- Sphericity"), " (for univariate tests): If conducting univariate tests as part of the analysis, the sphericity 
            assumption (equal variances of differences between pairs of repeated measures) should be met. Violations can be 
            corrected using methods like Greenhouse-Geisser or Huynh-Feldt adjustments.",
          br(),
          br(),
          strong("3- Homogeneity of Regression Slopes:"), " The relationship between each covariate and the dependent variables 
            should be consistent across the levels of the repeated measures (e.g., time points). This assumption ensures that 
            the effect of the covariate is the same at each time point or condition.",
          br(),
          br(),
          strong("4- Homogeneity of Covariance Matrices:"), " The covariance matrices of the dependent variables should be equal 
            across groups (if there are groups) and conditions. This assumption is essential for valid MANOVA results and can be 
            tested using Box’s M test.",
          br(),
          br(),
          strong("5- Linearity:"), " The relationship between the covariates and each dependent variable, as well as 
            the relationship between pairs of dependent variables, should be linear.",
          br(),
          br(),
          strong("6- No Multicollinearity:"), " The dependent variables should not be too highly correlated with each other, 
            as high multicollinearity can complicate the interpretation of the results. The covariates should also not be 
            too highly correlated with each other or with the dependent variables.",
          br(),
          br(),
          strong("7- Adequate Sample Size:"), " RM-MANCOVA requires a larger sample size than RM-MANOVA 
            because it includes additional covariates in the model. The sample size should be sufficient to detect effects 
            across multiple dependent variables and time points, with a general recommendation of more participants than 
            the number of dependent variables plus the number of covariates.",
          br(),
          br(),
          strong("8- Accurate Covariate Measurement:"), " The covariates should be measured without error, as inaccuracies can bias 
            the results. The covariates should also be continuous and theoretically relevant to the dependent variables.")
      } else if (input$experiment_design == "Multi-group" && input$experiment_dv == "1" && 
                 input$experiment_measures == "Posttest only" && input$experiment_cv == "No") {
        p(strong("Independent Samples t-test"), " compares the means of two independent groups.",
          br(),
          br(),
          strong("One-Way ANOVA"), " tests differences between means of three or more independent groups.",
          br(),
          br(),
          "Suggested non-parametric tests basicaly depend on ranks. These tests are distribution-free and do not effect 
            the violations of normality.")
      } else if (input$experiment_design == "Multi-group" && input$experiment_dv == "1" && 
                 input$experiment_measures == "Posttest only" && input$experiment_cv == "Yes") {
        p(strong("ANCOVA"), " adjusts the posttest scores based on the covariate(s), allowing you to test whether there are 
          significant differences between the groups on the adjusted posttest means. The analysis provides a way to statistically 
          control for variables that might influence the dependent variable, improving the validity of the comparisons between 
          groups.",
          br(),
          br(),
          strong("Assumptions:"),
          br(),
          br(),
          strong("1- Normality:"), " The dependent variable and the covariate(s) should be normally distributed within each group. 
            This assumption is particularly important when the sample sizes are small.",
          br(),
          br(),
          strong("2- Homogeneity of Variances:"), " The variances of the dependent variable should be equal across groups.",
          br(),
          br(),
          strong("3- Linearity:"), " There should be a linear relationship between the covariate(s) and the dependent variable. 
            This assumption ensures that the covariate effectively adjusts the dependent variable.",
          br(),
          br(),
          strong("4- Homogeneity of Regression Slopes:"), " The relationship between the covariate(s) and the dependent variable 
            should be the same across all groups. This is a key assumption of ANCOVA. If this assumption is violated, 
            it suggests that the effect of the covariate is different for different groups, and ANCOVA may not be appropriate.",
          br(),
          br(),
          strong("5- No Interaction between Covariate and Treatment:"), " The covariate should not interact with the treatment 
            effect. In other words, the effect of the covariate on the dependent variable should be consistent across 
            all treatment groups.",
          br(),
          br(),
          strong("6- Adequate Sample Size:"), " A larger sample size is generally preferred to meet the assumptions to ensure 
            sufficient power to detect significant effects. A general rule of thumb is to have at least 20-30 participants 
            per group, though more may be necessary depending on the number of covariates and the expected effect size.")
      } else if (input$experiment_design == "Multi-group" && input$experiment_dv == "1" && 
                 input$experiment_measures == "Pretest - Posttest" && input$experiment_cv == "No") {
        p(strong("Mixed-ANOVA"), " (also known as Split-Plot ANOVA) is used when an experiment involves both within-subjects 
          (repeated measures) and between-subjects factors. This type of ANOVA is appropriate when you want to analyze the effects 
          of one or more between-subjects factors (e.g., different groups) and one or more within-subjects factors 
          (e.g., measurements taken at different time points) simultaneously. For example, you might have two groups 
          (control and treatment) and measure their performance on a task at three different time points 
          (pretest, posttest, and follow-up).",
          br(),
          br(),
          strong("Assumptions:"),
          br(),
          br(),
          strong("1- Normality:"), " The dependent variable should be approximately normally distributed for each combination of 
            the levels of the within-subjects and between-subjects factors. This assumption is particularly important for 
            the between-subjects factor, especially with smaller sample sizes.",
          br(),
          br(),
          strong("2- Sphericity"), " (for the within-subjects factor): The sphericity assumption states that the variances of 
            the differences between all possible pairs of repeated measures (levels of the within-subjects factor) 
            should be equal. Violations of this assumption can lead to inaccurate p-values, which can be corrected using 
            Greenhouse-Geisser or Huynh-Feldt corrections.",
          br(),
          br(),
          strong("3- Homogeneity of Variances"), " (for the between-subjects factor): The variances of the dependent variable 
            should be equal across the levels of the between-subjects factor. Levene’s test is commonly used to check this 
            assumption.",
          br(),
          br(),
          strong("4- No Significant Interaction Between Covariates and Factors:"), " There should be no significant interaction 
            between the covariates and the between-subjects or within-subjects factors.",
          br(),
          br(),
          strong("5- Linearity:"), " The relationship between the dependent variable and the levels of both the within-subjects 
            and between-subjects factors should be approximately linear.",
          br(),
          br(),
          strong("6- Sample Size:"), " The technique generally requires a larger sample size to meet its assumptions and ensure 
            sufficient power. The exact number depends on the number of levels in the within-subjects and between-subjects factors, 
            as well as the expected effect sizes. A minimum of 20-30 participants per group is often recommended, 
            but more may be necessary depending on the design.",
          br(),
          br(),
          strong("7- Balanced Design:"), " Ideally, the design should be balanced, meaning that each group has the same number of 
            participants. This helps to meet the assumptions and improves the robustness of the results.",
          br(),
          br(),
          br(),
          "As an another technique, when there are two repeated measurements such as pretest-posttest, ", strong("ANCOVA"), 
            " can be used by defining pretests as covariate.")
      } else if (input$experiment_design == "Multi-group" && input$experiment_dv == "1" && 
                 input$experiment_measures %in% c("Pretest - Posttest", "3 or more repeated tests") && 
                 input$experiment_cv == "Yes") {
        p(strong("Mixed Design ANCOVA"), " evaluates the main effects of both between-subjects and within-subjects factors, 
          as well as their interactions, while adjusting for the influence of covariates. This approach provides a more accurate 
          assessment of the treatment effects by accounting for variability due to covariates, thereby increasing the precision of 
          the comparisons between groups and conditions.",
          br(),
          br(),
          strong("Assumptions:"),
          br(),
          br(),
          strong("1- Normality:"), " The dependent variable should be approximately normally distributed within each combination of 
            the levels of the within-subjects and between-subjects factors. The covariates should also be normally distributed.",
          br(),
          br(),
          strong("2- Sphericity"), " (for the within-subjects factor): The assumption of sphericity requires that the variances of 
            the differences between all possible pairs of repeated measures (levels of the within-subjects factor) be equal. 
            Violations can be corrected using adjustments like Greenhouse-Geisser or Huynh-Feldt corrections.",
          br(),
          br(),
          strong("3- Homogeneity of Variances"), " (for the between-subjects factor): The variances of the dependent variable should be 
            equal across the levels of the between-subjects factor.",
          br(),
          br(),
          strong("4- Homogeneity of Regression Slopes:"), " The relationship between each covariate and the dependent variable 
            should be the same across all levels of the within-subjects and between-subjects factors. This means that the effect of 
            the covariate should be consistent across the different groups and conditions.",
          br(),
          br(),
          strong("5- No Significant Interaction Between Covariates and Factors:"), " The covariates should not interact with 
            the between-subjects or within-subjects factors. This ensures that the adjustment for covariates is valid and does not 
            confound the results.",
          br(),
          br(),
          strong("6- Linearity:"), " The relationship between each covariate and the dependent variable should be linear, 
            and the relationships between the dependent variable and the factors should also be linear.",
          br(),
          br(),
          strong("7- Adequate Sample Size:"), " Mixed ANCOVA generally requires a larger sample size to ensure sufficient power and 
            to meet the assumptions. The sample size should exceed the number of dependent variables plus the number of covariates 
            and factors in the design.")
      } else if (input$experiment_design == "Multi-group" && input$experiment_dv == "1" && 
                 input$experiment_measures == "3 or more repeated tests" && input$experiment_cv == "No") {
        p(strong("Mixed-ANOVA"), " (also known as Split-Plot ANOVA) is used when an experiment involves both within-subjects 
          (repeated measures) and between-subjects factors. This type of ANOVA is appropriate when you want to analyze the effects 
          of one or more between-subjects factors (e.g., different groups) and one or more within-subjects factors 
          (e.g., measurements taken at different time points) simultaneously. For example, you might have two groups 
          (control and treatment) and measure their performance on a task at three different time points 
          (pretest, posttest, and follow-up).",
          br(),
          br(),
          strong("Assumptions:"),
          br(),
          br(),
          strong("1- Normality:"), " The dependent variable should be approximately normally distributed for each combination of 
            the levels of the within-subjects and between-subjects factors. This assumption is particularly important for 
            the between-subjects factor, especially with smaller sample sizes.",
          br(),
          br(),
          strong("2- Sphericity"), " (for the within-subjects factor): The sphericity assumption states that the variances of 
            the differences between all possible pairs of repeated measures (levels of the within-subjects factor) 
            should be equal. Violations of this assumption can lead to inaccurate p-values, which can be corrected using 
            Greenhouse-Geisser or Huynh-Feldt corrections.",
          br(),
          br(),
          strong("3- Homogeneity of Variances"), " (for the between-subjects factor): The variances of the dependent variable 
            should be equal across the levels of the between-subjects factor. Levene’s test is commonly used to check this 
            assumption.",
          br(),
          br(),
          strong("4- No Significant Interaction Between Covariates and Factors:"), " There should be no significant interaction 
            between the covariates and the between-subjects or within-subjects factors.",
          br(),
          br(),
          strong("5- Linearity:"), " The relationship between the dependent variable and the levels of both the within-subjects 
            and between-subjects factors should be approximately linear.",
          br(),
          br(),
          strong("6- Sample Size:"), " The technique generally requires a larger sample size to meet its assumptions and ensure 
            sufficient power. The exact number depends on the number of levels in the within-subjects and between-subjects factors, 
            as well as the expected effect sizes. A minimum of 20-30 participants per group is often recommended, 
            but more may be necessary depending on the design.",
          br(),
          br(),
          strong("7- Balanced Design:"), " Ideally, the design should be balanced, meaning that each group has the same number of 
            participants. This helps to meet the assumptions and improves the robustness of the results.")
      } else if (input$experiment_design == "Multi-group" && input$experiment_dv == "2 or more" && 
                 input$experiment_measures %in% c("Pretest - Posttest", "3 or more repeated tests") && 
                 input$experiment_cv == "No") {
        p(strong("Mixed-Design MANOVA"), " assesses whether there are significant differences between groups on the combined set of 
          dependent variables, considering both the within-subjects and between-subjects factors. It evaluates the main effects of 
          each factor and their interactions on the dependent variables simultaneously. This approach allows for understanding 
          the multivariate effects and interactions among the factors, providing a comprehensive view of 
          how the independent variables influence the set of dependent variables.",
          br(),
          br(),
          strong("Assumptions"),
          br(),
          strong("- Multivariate Normality:"),
          br(),
          strong("- Sphericity"), " (for within-subjects factors)",
          br(),
          strong("- Homogeneity of Covariance Matrices"), 
          br(),
          strong("- Linearity"),
          br(),
          strong("- Adequate Sample Size"),
          br(),
          strong("- No Multicollinearity"),
          br(),
          strong("- No missings in data"),
          br(),
          br(),
          "Mixed-MANOVA generally requires a larger sample size to ensure that the results are reliable and to meet 
            the assumptions. A common guideline is to have more participants than the number of dependent variables and 
            levels of the factors. Larger sample sizes help in achieving reliable estimates and detecting significant effects.")
      } else if (input$experiment_design == "Multi-group" && input$experiment_dv == "2 or more" && 
                 input$experiment_measures %in% c("Pretest - Posttest", "3 or more repeated tests") && 
                 input$experiment_cv == "Yes") {
        p(strong("Mixed-Design MANCOVA"), " is used when you have both within-subjects (repeated measures) and 
          between-subjects factors and you want to control for one or more covariates while analyzing multiple dependent variables. 
          This technique is useful in experiments where you measure multiple outcomes at different times or under different 
          conditions and wish to adjust for additional variables that might influence these outcomes. For example, 
          you might compare the effectiveness of different educational interventions (between-subjects factor) on 
          various cognitive skills (dependent variables) measured at several points in time (within-subjects factor), 
          while controlling for a baseline measure of cognitive ability or another relevant covariate.",
          br(),
          br(),
          strong("Assumptions"),
          br(),
          strong("- Multivariate Normality:"),
          br(),
          strong("- Sphericity"), " (for within-subjects factors)",
          br(),
          strong("- Homogeneity of Covariance Matrices"), 
          br(),
          strong("- Homogeneity of Regression Slopes"),
          br(),
          strong("- No Significant Interaction Between Covariates and Factors"),
          br(),
          strong("- Linearity"),
          br(),
          strong("- Adequate Sample Size"),
          br(),
          br(),
          "Mixed-Design MANCOVA typically requires a larger sample size to meet assumptions and provide reliable results. 
          A guideline is to have more participants than the number of dependent variables and covariates. Larger sample sizes 
          improve the robustness of the results and the ability to detect significant effects.")
      } else {
        p("Please complete the related inquiries to get a brief explanation.")
      }

    ##Module-5 for Column-4
    } else if (input$module == "Module 5. Analyzing the longitudinal data or repeated measurements") {
      if (input$purpose_of_rm == "1.Examine changes in a single dependent variable within the same group over time") {
        p(strong("Repeated Measures ANOVA:"), " It is generally used in cases where the number of repetitions is low (such as 4-5). 
            Works better with moderate (e.g., 30-50 per group) to large sample sizes.",
          br(),
          br(),
          strong("Repeated Measures ANCOVA:"), " Adjusts for covariates while analyzing a single dependent variable over time. 
            Best used with moderate (e.g., 30-50 per group) to large sample sizes.",
          br(),
          br(),
          strong("Linear Mixed Effects Models:"), " Useful for handling both fixed and random effects in repeated measures. 
            Works effectively with moderate to large samples (e.g., 50-100+).",
          br(),
          br(),
          "These techniques are appropriate for panel or cohort data.")
      } else if (input$purpose_of_rm == "2.Examine changes in a dependent variable across multiple groups over time") {
        p(strong("Mixed-Design ANOVA:"), " Analyzes interactions between within-subjects (time) and between-subjects (groups) 
            effects. Requires sufficient sample sizes in each group (e.g., 30-50 per group).",
          br(),
          br(),
          strong("Repeated Measures ANCOVA:"), " Analyzes one dependent variable over time across different groups while adjusting 
            for covariates. This technique works best with moderate to large sample sizes (e.g., 30-50 per group).",
          br(),
          br(), 
          "These techniques are appropriate for panel or cohort data.")
      } else if (input$purpose_of_rm == "3.Analyze multiple dependent variables over time within a group") {
        p(strong("Repeated Measures MANOVA:"), " Examines multiple dependent variables measured over time within the same group. 
            It performs better with larger sample sizes (e.g., 50-100+).",
          br(),
          br(),
          strong("Multivariate Linear Mixed Effects Models:"), " Handles multiple dependent variables measured over time, requiring 
            larger sample sizes (e.g., 50-100+) for reliability.",
          br(),
          br(), 
          "These models work well for panel or cohort data.")
      } else if (input$purpose_of_rm == "4.Analyze multiple dependent variables across groups over time") {
        p(strong("Mixed-Design MANOVA:"), " Tests multiple dependent variables across different groups over time. It works best 
            with larger sample sizes (e.g., 50-100+).",
          br(),
          br(),
          strong("Multivariate Linear Mixed Effects Models:"), " Analyzes multiple dependent variables and handles complex structures 
            involving both fixed and random effects. Requires larger sample sizes (e.g., 50-100+)",
          br(),
          br(),
          "These techniques are suitable for panel or cohort data.")
      } else if (input$purpose_of_rm == "5.Structural model relationships between latent and manifest variables over time") {
        p("These are sub-models of Structural Equation Modeling (SEM), and models  complex relationships between latent and manifest 
            variables over time.",
          br(),
          br(),
          strong("Latent Growth Modeling (LGM):"), " Analyzes growth trajectories of latent variables over time. Works well with 
            moderate to large sample sizes (e.g., 100-200+). This model is appropriate for panel or cohort data.",
          br(),
          br(),
          strong("Cross-Lagged Panel Models:"), " Examines the directionality of relationships between variables over time, 
            requiring larger sample sizes (e.g., 100-200+). Suitable for panel or cohort data.",
          br(),
          br(),
          strong("Dynamic SEM:"), " Models interactions between variables over time and works best with large samples (e.g., 200+). 
            This technique is fitting for trend data.",
          br(),
          br(),
          strong("Multilevel Structural Equation Modeling (MSEM):"), " Appropriate for longitudinal studies where data is structured 
            hierarchically, such as individuals measured repeatedly over time within different groups or contexts. Extends SEM to 
            multilevel data, needing substantial samples at both levels (e.g., 200+ overall). Suitable for panel or cohort data.")
      } else if (input$purpose_of_rm == "6.Examine trends and patterns in descriptive measures (such as mean or median) over time") {
        p(strong("Time Series Analysis:"), " Analyzes trends and patterns in descriptive measures over time, effective with 
            relatively small to large samples (e.g., 20-50+ observations).",
          br(),
          br(),
          strong("Trend Analysis:"), " Identifies trends in descriptive statistics over time, working well with smaller (e.g., 20-30) 
            or larger samples (e.g., 50+) for clearer results.",
          br(),
          br(),
          "These techniques are appropriate for trend data.")
      } else if (input$purpose_of_rm == "7.Analyze population-averaged effects with correlated data") {
        p(strong("GEE:"), " Estimates population-averaged effects with correlated observations. Best used with smaller to moderate 
            sample sizes (e.g., 50-100+), with larger samples providing more reliable estimates. This technique is suitable for 
            panel or cohort data.")
      } else {
        p("Please complete the related inquiries to get a brief explanation.")
      }

    ##Module-7 for Column-4
    } else if (input$module == "Module 6. Correlations between variables") {
      if (input$type_corr == "Bivariate" && input$measurement_level_1 == "Continuous X Continuous") {
        p(strong("Pearson Correlation:"), " Measures linear relationship. Requires normally distributed data with no significant 
            outliers. Frequently recommended minimum sample size is 30.")
      } else if (input$type_corr == "Bivariate" && input$measurement_level_1 == "Ordinal X Ordinal") {
        p(strong("Spearman's Rank Correlation:"), " Non-parametric, and assesses monotonic relationships. Less sensitive to outliers. 
            Requires at least 10 pairs of observations.",
          br(),
          br(),
          strong("Kendall's Tau:"), " Non-parametric, robust for small samples and tied ranks. Lower power than Spearman but more 
            reliable in small datasets. Recommended for samples as small as 5.",
          br(),
          br(),
          strong("Polychoric Correlation:"), " Assumes underlying normal distribution for both ordinal variables. Used in factor 
            analysis. Requires larger samples, ideally 100+.")
      } else if (input$type_corr == "Bivariate" && input$measurement_level_1 == "Continuous X Dichotomous") {
        p(strong("Point-Biserial Correlation:"), " Measures the strength and direction between continuous and binary variables. 
            A special case of Pearson correlation. Requires at least 20 observations.",
          br(),
          br(),
          strong("Biserial Correlation:"), " Assumes the dichotomous variable represents an underlying continuous variable. Useful 
          for latent trait analysis. Requires larger samples due to the latent assumption.")
      } else if (input$type_corr == "Bivariate" && input$measurement_level_1 == "Dichotomous X Dichotomous") {
        p(strong("Phi Coefficient:"), " Measures association in 2x2 contingency tables. Equivalent to Pearson correlation for 
            binary variables. Recommended minimum sample size: 20.",
          br(),
          br(),
          strong("Tetrachoric Correlation:"), " Assumes both dichotomous variables represent underlying continuous distributions. 
            Used in psychometrics. Requires larger samples, ideally 50+.")
      } else if (input$type_corr == "Bivariate" && input$measurement_level_1 == "Continuous X Categorical") {
        p(strong("Eta Correlation:"), " Assesses the strength of association in non-linear relationships. Useful for ANOVA contexts. 
            Requires a minimum of 20 cases per group for reliable results.")
      } else if (input$type_corr == "Bivariate" && input$measurement_level_1 == "Continuous X Ordinal") {
        p(strong("Polyserial Correlation:"), " Measures the relationship assuming the ordinal variable has an underlying normal 
            distribution. Used in psychometrics. Requires larger samples, ideally 50+.")
      } else if (input$type_corr == "Multiple" && 
                 input$measurement_level_2 == "One continuous dependent, multiple continuous independent") {
        p(strong("Multiple Correlation:"), " Measures combined effect of multiple predictors on one outcome. Assumes linear 
            relationships. Requires a large sample size, ideally 10 observations per predictor variable.")
      } else if (input$type_corr == "Multiple" && 
                 input$measurement_level_2 == "Two sets of continuous variables") {
        p(strong("Canonical Correlation:"), " Assesses relationships between two multivariate sets. Useful in analyzing complex 
            interrelated datasets. Requires large samples, ideally 10 cases per variable.")
      } else if (input$type_corr == "Partial") {
        p(strong("Partial Correlation:"), " Measures correlation between two continuous variables, controlling for other continuous 
            variables. Useful in controlling confounding variables. Minimum sample size: 30, but larger is better.",
        br(),
        br(),
        strong("Semi-partial (Part) Correlation:"), " Similar to partial but focuses on one variable. Measures unique contribution 
          of one variable while controlling others.  Minimum sample size: 30, but larger is recommended.")    
      } else {
        p("Please complete the related inquiries to get a brief explanation.")
      }

    ##Module-7 for Column-4
    } else if (input$module == "Module 7. Predicting outcomes or group memberships") {
      if (input$purpose_of_design == "Predicting continuous outcome" && 
          input$type_of_outcome_1 == "Single" && 
          input$type_of_predictor == "Single" && 
          input$linearity_exist_1 == "Yes. Use linear model") {
        p(strong("Linear Regression:"), " Models linear relationship between a dependent variable and a single independent variable. 
            Assumes linearity, independence, homoscedasticity, and normality of errors. Requires at least 10-20 observations 
            per predictor.",
          br(),
          br(),
          strong("Ridge Regression:"), " A regularized version of linear regression that includes an L2 penalty to handle 
            multicollinearity. Assumes the same conditions as linear regression but is more robust in cases where predictors are 
            highly correlated. Requires balancing the regularization parameter with model fit, and is effective with smaller samples.",
          br(),
          br(),
          strong("Lasso Regression:"), " Similar to Ridge Regression, but uses an L1 penalty, allowing it to shrink some coefficients 
            to zero, effectively performing variable selection. Assumes similar conditions to linear regression and is useful for 
            models with many predictors. Performs well with smaller datasets but requires careful tuning of the regularization 
            parameter.",
          br(),
          br(),
          strong("Elastic Net Regression:"), " Combines Lasso and Ridge regression penalties, balancing variable selection and 
            handling multicollinearity. It assumes conditions similar to linear regression and is appropriate for datasets where 
            predictors are highly correlated and variable selection is necessary.")
      } else if (input$purpose_of_design == "Predicting continuous outcome" && 
                 input$type_of_outcome_1 == "Single" && 
                 input$type_of_predictor == "Multiple" && 
                 input$linearity_exist_1 == "Yes. Use linear model") {
        p(strong("Multiple Linear Regression:"), " Models linear relationships between a dependent variable and multiple independent 
            variables. Assumes linearity, independence, homoscedasticity, normality of errors, and no multicollinearity. 
            Requires 10-20 observations per predictor.",
          br(),
          br(),
          strong("Ridge Regression:"), " A regularized version of linear regression that includes an L2 penalty to handle 
            multicollinearity. Assumes the same conditions as linear regression but is more robust in cases where predictors are 
            highly correlated. Requires balancing the regularization parameter with model fit, and is effective with smaller 
            samples.",
          br(),
          br(),
          strong("Lasso Regression:"), " Similar to Ridge Regression, but uses an L1 penalty, allowing it to shrink some coefficients 
            to zero, effectively performing variable selection. Assumes similar conditions to linear regression and is useful for 
            models with many predictors. Performs well with smaller datasets but requires careful tuning of the regularization 
            parameter.",
          br(),
          br(),
          strong("Elastic Net Regression:"), " Combines Lasso and Ridge regression penalties, balancing variable selection and 
            handling multicollinearity. It assumes conditions similar to linear regression and is appropriate for datasets where 
            predictors are highly correlated and variable selection is necessary.")
      } else if (input$purpose_of_design == "Predicting continuous outcome" && 
                 input$type_of_outcome_1 == "Single" && 
                 input$type_of_predictor %in% c("Single", "Multiple") && 
                 input$linearity_exist_1 == "No. Use non-linear model") {
        p(strong("Polynomial Regression:"), " Extends linear regression by including polynomial terms to model nonlinear relationships. 
            Assumes linearity in parameters, potential multicollinearity, and requires careful consideration to avoid overfitting. 
            Requires larger samples as the degree of the polynomial increases.",
          br(),
          br(),
          strong("Quantile Regression:"), " Models conditional quantiles of the dependent variable, offering a more comprehensive 
            analysis of the potential outcomes. It’s robust to outliers and heteroscedasticity, making it useful when standard 
            linear regression assumptions are not met. Requires a larger sample size for stable estimates.")
      } else if (input$purpose_of_design == "Predicting continuous outcome" && 
                 input$type_of_outcome_1 == "Multiple" && 
                 input$type_of_predictor %in% c("Single", "Multiple") && 
                 input$linearity_exist_1 == "Yes. Use linear model") {
        p(strong("Multivariate Linear Regression:"), " Extends linear regression to predict multiple continuous outcomes 
            simultaneously. It considers the correlations among the outcomes and assumes multivariate normality, independence, and 
            no multicollinearity among predictors. Requires a larger sample size to manage the increased complexity.")
      } else if (input$purpose_of_design == "Predicting continuous outcome" && 
                 input$type_of_outcome_1 == "Multiple" && 
                 input$type_of_predictor %in% c("Single", "Multiple") && 
                 input$linearity_exist_1 == "No. Use non-linear model") {
        p(" ")
      } else if (input$purpose_of_design == "Predicting continuous outcome in a hierarchical/nested structure" && 
                 input$type_of_outcome_1 == "Single" && 
                 input$type_of_predictor %in% c("Single", "Multiple") && 
                 input$linearity_exist_1 == "Yes. Use linear model") {
        p(strong("MLM or HLM:"), " Predicts a continuous outcome while accounting for the nested structure of the data, such as 
            students nested within schools. Assumes normality within groups, normal distribution of random effects, and independence 
            within groups.", 
          br(), 
          br(),
          "The sample size required for Hierarchical Linear Modeling (HLM) depends on various factors, including the complexity of 
            your model, the number of levels, and the expected effect sizes. For example if you describe two-levels, typically, 
            you need at least 30-50 observations per level 1 unit to achieve reliable estimates. For level 2 units 
            (e.g., schools, clinics), a common rule of thumb is to have at least 30-50 groups. More groups can improve the stability 
            of estimates and generalizability of results. In total, there would be 900-2500 observations from 30-50 units for reliable 
            estimations of each level variability.")
      } else if (input$purpose_of_design == "Predicting continuous outcome in a hierarchical/nested structure" && 
                 input$type_of_outcome_1 == "Single" && 
                 input$type_of_predictor %in% c("Single", "Multiple") && 
                 input$linearity_exist_1 == "No. Use non-linear model") {
        p(" ")
      } else if (input$purpose_of_design == "Predicting continuous outcome in a hierarchical/nested structure" && 
                 input$type_of_outcome_1 == "Multiple") {
        p(" ")
      } else if (input$purpose_of_design == "Predicting group memberships" && 
                 input$type_of_outcome_2 %in% c("Single discrete (Dichotomous)", "Single discrete (Multinomial)", "Single discrete (Ordinal)") && 
                 input$linearity_exist_2 == "Yes. Use linear model") {
        p(strong("Discriminant Function Analysis (DFA):"), " Separates groups based on characteristics and predicts group membership. 
            Assumes multivariate normality of predictors within each group, equal covariance matrices across groups, and independence 
            of observations. Typically requires 5-10 cases per group for stable estimates.")
      } else if (input$purpose_of_design == "Predicting group memberships" && 
                 input$type_of_outcome_2 == "Single discrete (Dichotomous)" && 
                 input$linearity_exist_2 == "No. Use non-linear model") {
        p(strong("Binary Logistic Regression:"), " Predicts the probability of a binary outcome based on one or more predictor 
            variables. Assumes linearity of logits, independence of observations, and no multicollinearity among predictors. 
            Requires a minimum sample size of 10 events per predictor for reliable estimates.",
          br(),
          br(),
          strong("Decision Trees (CART):"), " A nonparametric model that recursively partitions the data into subsets based on 
            predictor values. No distributional assumptions, though independence of observations is required. Effective with both 
            large and small datasets.",
          br(),
          br(),
          strong("Random Forest:"), " An ensemble method of decision trees that combines multiple trees to improve prediction 
            accuracy and reduce overfitting. It works well with large datasets and can manage complex variable relationships.",
          br(),
          br(),
          strong("Support Vector Machines (SVM):"), " A classification method that finds the optimal hyperplane to separate classes 
            in high-dimensional space. Requires careful kernel selection and performs well with medium to large datasets.")
      } else if (input$purpose_of_design == "Predicting group memberships" && 
                 input$type_of_outcome_2 == "Single discrete (Multinomial)" && 
                 input$linearity_exist_2 == "No. Use non-linear model") {
        p(strong("Multinomial Logistic Regression:"), " Generalizes logistic regression to handle multiple categories of 
            the dependent variable. Assumes independence of irrelevant alternatives, linearity of logits, and independence of 
            observations. Typically requires 10-20 observations per category per predictor to ensure reliable estimates.",
          br(),
          br(),
          strong("Decision Trees (CART):"), " A nonparametric model that recursively partitions the data into subsets based on 
            predictor values. No distributional assumptions, though independence of observations is required. Effective with both 
            large and small datasets.",
          br(),
          br(),
          strong("Random Forest:"), " An ensemble method of decision trees that combines multiple trees to improve prediction 
            accuracy and reduce overfitting. It works well with large datasets and can manage complex variable relationships.",
          br(),
          br(),
          strong("Support Vector Machines (SVM):"), " A classification method that finds the optimal hyperplane to separate classes 
            in high-dimensional space. Requires careful kernel selection and performs well with medium to large datasets.")
      } else if (input$purpose_of_design == "Predicting group memberships" && 
                 input$type_of_outcome_2 == "Single discrete (Ordinal)" && 
                 input$linearity_exist_2 == "No. Use non-linear model") {
        p(strong("Ordinal Logistic Regression:"), " Models ordinal outcomes by predicting the probability of each level, assuming 
            proportional odds and linearity of logits. Requires at least 10-20 observations per category per predictor to ensure 
            reliable model estimates, and it works well with ordinal data structures.",
          br(),
          br(),
          strong("Decision Trees (CART):"), " A nonparametric model that recursively partitions the data into subsets based on 
            predictor values. No distributional assumptions, though independence of observations is required. Effective with both 
            large and small datasets.",
          br(),
          br(),
          strong("Random Forest:"), " An ensemble method of decision trees that combines multiple trees to improve prediction 
            accuracy and reduce overfitting. It works well with large datasets and can manage complex variable relationships.",
          br(),
          br(),
        strong("Support Vector Machines (SVM):"), " A classification method that finds the optimal hyperplane to separate classes 
          in high-dimensional space. Requires careful kernel selection and performs well with medium to large datasets.")
      } else if (input$purpose_of_design == "Predicting group memberships" && 
                 input$type_of_outcome_2 == "Multiple discrete" && 
                 input$linearity_exist_2 == "Yes. Use linear model") {
        p(" ")
      } else if (input$purpose_of_design == "Predicting group memberships" && 
                 input$type_of_outcome_2 == "Multiple discrete" && 
                 input$linearity_exist_2 == "No. Use non-linear model") {
        p(strong("Multivariate Logistic Regression"), " extends logistic regression to handle multiple categorical dependent 
            variables simultaneously. It models the probability of each outcome for each dependent variable based on 
            multiple independent variables. This technique is nonlinear, as it models the log-odds (logistic function) of 
            the outcomes. The main assumptions include the linearity in the logit, independence of observations, and 
            no multicollinearity among independent variables. Typically, a sample size with at least 10 events 
            per predictor variable per outcome is recommended to ensure stable estimates, with a larger sample size needed 
            for more complex models.",
          br(),
          br(),
          strong("Multivariate Probit Models"), " are used for analyzing multiple binary or ordinal dependent variables, where the 
            underlying latent variables follow a multivariate normal distribution. This nonlinear model assumes that the errors of 
            the latent variables are jointly normally distributed. Key assumptions include independence of observations and 
            no multicollinearity among independent variables. The model requires a relatively large sample size, usually several 
            hundred observations, due to its complexity and the need for stable parameter estimation.",
          br(),
          br(),
          "Standard Random Forest models are also designed for single dependent variables, either categorical (classification) or 
            continuous (regression). ", strong("Multivariate Random Forest (MVRF) approaches"), " exist for multiple dependent 
            variables, where the model can simultaneously predict multiple outcomes by modifying the loss function and 
            tree-building criteria.")
      } else if (input$purpose_of_design == "Predicting group memberships in a hierarchical/nested structure" && 
                 input$type_of_outcome_2 %in% c("Single discrete (Dichotomous)", "Single discrete (Multinomial)", "Single discrete (Ordinal)") && 
                 input$linearity_exist_2 == "Yes. Use linear model") {
        p(" ")
      } else if (input$purpose_of_design == "Predicting group memberships in a hierarchical/nested structure" && 
                 input$type_of_outcome_2 %in% c("Single discrete (Dichotomous)", "Single discrete (Multinomial)") && 
                 input$linearity_exist_2 == "No. Use non-linear model") {
        p(strong("Multilevel Logistic Regression:"), " Extends logistic regression to predict binary or categorical outcomes 
            within hierarchical data structures, such as patients within hospitals. Assumes similar conditions to multilevel linear 
            regression but with binary outcomes, requiring more events per predictor.")
      } else if (input$purpose_of_design == "Predicting group memberships in a hierarchical/nested structure" && 
                 input$type_of_outcome_2 == "Single discrete (Ordinal)" && 
                 input$linearity_exist_2 == "No. Use non-linear model") {
        p(strong("Multilevel Ordinal Logistic Regression:"), " Models ordinal outcomes, like levels of satisfaction, within 
           hierarchical structures. Assumes proportional odds and normality within groups, typically requiring more observations 
           per category per predictor.")
      } else if (input$purpose_of_design == "Predicting group memberships in a hierarchical/nested structure" && 
                 input$type_of_outcome_2 == "Multiple discrete") {
        p(" ")
      } else {
        p("Please complete the related inquiries to get a brief recommendations.")
      }

    ##Module-8 for Column-4
    } else if (input$module == "Module 8. Data reduction") {
      if (input$data_type == "Metric or continuous" && 
          input$assumption_meet == "Yes. There is no serious assumptional violation in my dataset.") {
        p(strong("Principal Component Analysis (PCA)"), " is a dimensionality reduction technique that transforms a large set of 
            correlated variables into a smaller set of uncorrelated components, known as principal components. 
             These components capture the maximum variance in the data.",
          br(),
          br(),
          "Main Assumptions:",
          br(),
          "- The data should be continuous and approximately normally distributed.",
          br(),
          "- The variables should be linearly related.",
          br(),
          "- The components are orthogonal to each other.",
          br(),
          br(),
          "Required or Recommended Sample Size:",
          br(),
          "A common rule of thumb is to have at least 100-300 observations per variable or 8-10 times of number of variables. 
            Larger sample sizes are preferable to ensure stable and reliable components.",
          br(),
          br(),
          "PCA is sensitive to the scaling of variables, so it's important to standardize variables before applying PCA, especially 
            when they are on different scales.",
          br(),
          br(),
          br(),
          strong("Exploratory Factor Analysis (EFA)"), " is a statistical technique used to identify underlying latent factors that 
            explain the patterns of correlations among observed variables. It aims to model the relationships between observed 
            variables and these unobserved factors.",
          br(),
          br(),
          "Main Assumptions:",
          br(),
          "- The observed variables should be continuous and approximately normally distributed.",
          br(),
          "- The latent factors are assumed to be linearly related to the observed variables.",
          br(),
          "- The correlations among variables are assumed to arise from common underlying factors, with unique variances 
            (including error variance) being uncorrelated.",
          br(),
          br(),
          "Required or Recommended Sample Size:",
          br(),
          "The minimum sample size is often suggested to be around 100-300 participants, though larger samples are preferred for 
            more accurate factor extraction.",
          br(),
          br(),
          br(),
          strong("Main Differences between PCA and EFA:"),
          br(),
          "- PCA creates components that are linear combinations of observed variables without considering underlying constructs.",
          br(),
          "- PCA does not consider latent variables or error variance and is purely a data-driven technique.",
          br(),
          "- EFA assumes that the observed variables are influenced by latent factors.",
          br(),
          "- EFA also accounts for error variance and uses maximum likelihood estimation or other estimation methods that focus on 
            explaining correlations rather than just variance.")
      } else if (input$data_type == "Metric or continuous" && 
                 input$assumption_meet == "No. There are some violations of normality or linearity in my data.") {
        p(strong("Robust PCA"), " is an extension of traditional PCA designed to handle data with outliers or noise. 
            It decomposes a data matrix into a low-rank component representing the underlying structure and a sparse component 
            capturing outliers or noise, providing a more accurate dimensionality reduction in the presence of anomalies.",
          br(),
          br(),
          "Unlike traditional PCA, which can be severely affected by outliers, Robust PCA explicitly models and separates out 
            the outliers, leading to more reliable components when data contains anomalies.",
          br(),
          br(),
          br(),
          strong("Robust EFA"), " is an adaptation of traditional Exploratory Factor Analysis designed to account for the presence of 
            outliers or non-normality in the data. It seeks to identify latent factors while minimizing the influence of outliers, 
            leading to more reliable factor structures in such cases.",
          br(),
          br(),
          "While standard EFA assumes normality and can be sensitive to outliers, Robust EFA employs techniques to reduce 
            the influence of outliers, such as using robust covariance or correlation matrices. This makes it more reliable 
            in datasets with anomalies.",
          br(),
          br(),
          "Unlike Robust PCA, which separates the data into low-rank and sparse components, Robust EFA maintains the focus on 
            modeling latent factors while specifically addressing the impact of outliers on the factor structure.",
          br(),
          br(),
          br(),
          strong("Metric Multidimensional Scaling (MDS)"), " is a data reduction and visualization technique that represents 
            the similarity or dissimilarity between pairs of objects (e.g., observation units) as distances in a low-dimensional space, 
            typically preserving the rank order of these distances.",
          br(),
          br(),
          "There are no strict rules for assumptions. The sample size should be large enough to provide reliable estimates 
            of dissimilarities between objects. While there is no strict rule, having at least 10-20 objects per dimension 
            in the solution is generally recommended.
            Additionally, metric-MDS might perform well in small sample sizes such as 50-100, depending on the structure of the 
            variables.",
          br(),
          br(),
          "While PCA reduces dimensionality based on variance among variables, Metric MDS focuses on reducing dimensionality 
            based on the distances or dissimilarities between observation units, making it more suitable for visualizing 
            relationships in terms of similarity.",
          br(),
          br(),
          "The quality of the MDS solution is often assessed using the ", strong("stress value"), " where lower stress indicates 
            a better fit between the dissimilarities and the distances in the reduced space.",
          br(),
          br(),
          "Metric MDS is sensitive to the scaling of dissimilarities, so it’s important to standardize or appropriately preprocess 
            the dissimilarity matrix before applying the technique.",
          br(),
          br(),
          br(),
          strong("Bayesian methods"), " for data reduction involve applying Bayesian statistical principles to reduce 
            the dimensionality of data while incorporating prior knowledge or beliefs. These methods typically use probabilistic 
            models to identify the most relevant features or components and estimate their distributions, allowing for uncertainty 
            quantification in the reduced data representation.",
          br(),
          br(),
          "The relationships among variables can be described through a Bayesian model, such as a Bayesian factor model or 
            Bayesian principal component analysis. Prior distributions are appropriately chosen to reflect beliefs or information 
            about the parameters before observing the data.",
          br(),
          br(),
          "Bayesian methods often involve complex computations, such as Markov Chain Monte Carlo (MCMC) sampling, to estimate 
            posterior distributions, which can be computationally intensive.",
          br(),
          br(),
          "Bayesian methods can be more flexible with sample size due to the incorporation of prior information. 
            However, larger sample sizes generally provide more robust posterior estimates and reduce the influence of the prior.",
          br(),
          br(),
          "Unlike frequentist methods that rely solely on the data at hand, Bayesian methods incorporate prior information, 
            allowing for more nuanced inferences and the ability to update beliefs as new data becomes available. 
            Bayesian methods also provide a full posterior distribution of parameters, offering a richer understanding of uncertainty.")
      } else if (input$data_type == "Metric or continuous" && 
                 input$assumption_meet == "No. I don't have enough sample size, it's small.") {
        p(strong("Metric Multidimensional Scaling (MDS)"), " is a data reduction and visualization technique that represents 
            the similarity or dissimilarity between pairs of objects (e.g., observation units) as distances in a low-dimensional space, 
            typically preserving the rank order of these distances.",
          br(),
          br(),
          "There are no strict rules for assumptions. The sample size should be large enough to provide reliable estimates of 
            dissimilarities between objects. While there is no strict rule, having at least 10-20 objects per dimension 
            in the solution is generally recommended. Additionally, metric-MDS might perform well in small sample sizes such as 
            50-100, depending on the structure of the variables.",
          br(),
          br(),
          "While PCA reduces dimensionality based on variance among variables, Metric MDS focuses on reducing dimensionality 
             based on the distances or dissimilarities between observation units, making it more suitable for visualizing relationships 
             in terms of similarity.",
          br(),
          br(),
          "The quality of the MDS solution is often assessed using the ", strong("stress value"), " where lower stress indicates 
            a better fit between the dissimilarities and the distances in the reduced space.",
          br(),
          br(),
          "Metric MDS is sensitive to the scaling of dissimilarities, so it’s important to standardize or appropriately preprocess 
            the dissimilarity matrix before applying the technique.")
      } else if (input$data_type == "Ordinal" && 
                 input$assumption_meet == "Yes. There is no serious assumptional violation in my dataset.") {
        p(strong("PCA and EFA with polychoric correlation or covariance matrices"), " are adaptations of these techniques 
            for ordinal data. Polychoric correlations estimate the correlation between two theorized continuous variables that 
            underlie observed ordinal variables. These matrices are then used in PCA or EFA to handle ordinal data 
            more appropriately, preserving the structure of relationships among variables.",
          br(),
          br(),
          "The ordinal variables should have more than two categories for reliable polychoric correlations. The underlying 
            continuous variables are assumed to be normally distributed. A larger sample size is recommended—generally at least 
            200-300 observations, especially if the ordinal variables have few categories.",
          br(),
          br(),
          "Polychoric correlation matrices provide a more accurate reflection of the relationships among ordinal variables 
            by considering the latent continuous variables. Estimating polychoric correlations can be computationally intensive 
            and sensitive to small sample sizes, particularly when dealing with highly skewed ordinal variables or variables 
            with few categories.")
      } else if (input$data_type == "Ordinal" && 
                 input$assumption_meet == "No. There are some violations of normality or linearity in my data.") {
        p(strong("Robust PCA and Robust EFA with polychoric correlation or covariance matrices"), 
            " combine robust statistical methods with polychoric correlations to analyze ordinal data. These techniques 
            aim to handle outliers or deviations from normality while accurately modeling the underlying latent structures 
            using polychoric matrices.",
          br(),
          br(),
          "For robust PCA and EFA with polychoric matrices, a larger sample size is recommended to ensure accurate estimation of 
            polychoric correlations and reliable factor or component extraction. A typical guideline is at least 
            200-300 observations, especially when handling complex models or multiple outliers.",
          br(),
          br(),
          "Specialized software or packages may be required for robust PCA and EFA with polychoric matrices. Tools like 
            the robustbase package in R for robust statistics and the polycor package for polychoric correlations can be useful.",
          br(),
          br(),
          br(),
          strong("Non-Metric Multidimensional Scaling (Non-Metric MDS)"), " is a technique used to visualize the similarity or 
            dissimilarity between objects by representing these relationships in a low-dimensional space. 
            Unlike Metric MDS, Non-Metric MDS focuses on preserving the rank order of dissimilarities rather than the exact 
            distances.",
          br(),
          br(),
          "Non-Metric MDS typically minimizes a stress function (such as Shepard’s stress) that measures the discrepancy between 
           the rank order of original dissimilarities and the distances in the reduced space.",
          br(),
          br(),
          "A common recommendation is to have at least 10-20 objects per dimension. The exact sample size may vary depending on 
            the complexity of the data and the number of dimensions desired. Additionally, non-metric MDS might perform well 
            in small sample sizes such as 50-100, depending on the structure of the variables.",
          br(),
          br(),
          br(),
          strong("Categorical Principal Component Analysis (CATPCA)"), " is a dimensionality reduction technique designed 
            specifically for categorical data. It extends traditional Principal Component Analysis (PCA) to handle categorical 
            variables by transforming them into a continuous latent space, allowing for the extraction of principal components 
            that represent the underlying structure of the categorical data.",
          br(),
          br(),
          "CATPCA uses optimal scaling methods to transform categorical variables into numerical forms. This process involves 
            assigning numerical values to categorical levels in a way that preserves the data's structure and relationships.",
          br(),
          br(),
          "The data consists of categorical variables, which can be nominal or ordinal. Categorical variables are assumed to be 
            indicators of underlying latent dimensions.",
          br(),
          br(),
          "A larger sample size is generally recommended to ensure reliable estimation of components, with a typical guideline 
            being at least 200-300 observations",
          br(),
          br(),
          br(),
          strong("Multiple Correspondence Analysis (MCA)"), " is a dimensionality reduction technique used for categorical data. 
            It extends Correspondence Analysis (CA) to handle multiple categorical variables simultaneously. 
            MCA transforms categorical variables into a lower-dimensional space to reveal underlying patterns and relationships 
            between variables.",
          br(),
          br(),
          "MCA involves optimal scaling of categorical data, converting categorical variables into numerical scores based on 
            their associations.",
          br(),
          br(),
          "MCA often provides visualizations such as biplots or scatter plots, which help in interpreting the relationships between 
            categories and variables in the reduced-dimensional space.",
          br(),
          br(),
          "Typically, at least 200-300 observations are advised, especially when dealing with many categories or variables.")
      } else if (input$data_type == "Ordinal" && 
                 input$assumption_meet == "No. I don't have enough sample size, it's small.") {
        p(" ")
      } else if (input$data_type == "Nominal or multinominal" && 
                 input$assumption_meet == "Yes. There is no serious assumptional violation in my dataset.") {
        p(strong("PCA and EFA with a tetrachoric correlation matrices"), " are adaptations of these techniques designed for 
            dichotomous (binary) variables. The tetrachoric correlation matrix estimates the correlation between 
            latent continuous variables that underlie the observed binary variables. This approach enables PCA and EFA to handle 
            binary data more effectively by capturing underlying relationships that might be masked by the dichotomous nature of 
            the variables.",
          br(), 
          br(), 
          "The underlying continuous variables are assumed to follow a normal distribution.",
          br(), 
          br(), 
          "A larger sample size is generally recommended to provide stable estimates of tetrachoric correlations. Typically, 
          at least 200-300 observations are advised, especially if the data includes multiple dichotomous variables.",
          br(), 
          br(),
          "Estimating tetrachoric correlations can be computationally complex and may require specialized software or packages, 
            such as the polycor package in R, which can compute tetrachoric correlations.")
      } else if (input$data_type == "Nominal or multinominal" && 
                 input$assumption_meet == "No. There are some violations of normality or linearity in my data.") {
        p(strong("Robust PCA and Robust EFA with a tetrachoric correlation matrices"), " extend traditional PCA and EFA techniques 
            to handle dichotomous (binary) variables while accounting for outliers or deviations from normality.
            The tetrachoric correlation matrix is used to estimate the relationships between underlying continuous variables from 
            binary data, and robustness techniques mitigate the influence of outliers or non-normality in the analysis.",
          br(), 
          br(),
          "Dichotomous variables are assumed to be indicators of underlying continuous latent variables. A typical guideline is 
            at least 200-300 observations, especially when dealing with complex models or numerous binary variables.",
          br(), 
          br(),
          br(),
          strong("Non-Metric Multidimensional Scaling (Non-Metric MDS)"), " is a technique used to visualize the similarity or 
            dissimilarity between objects by representing these relationships in a low-dimensional space. 
            Unlike Metric MDS, Non-Metric MDS focuses on preserving the rank order of dissimilarities rather than the exact 
            distances.",
          br(),
          br(),
          "Non-Metric MDS typically minimizes a stress function (such as Shepard’s stress) that measures the discrepancy between 
           the rank order of original dissimilarities and the distances in the reduced space.",
          br(),
          br(),
          "A common recommendation is to have at least 10-20 objects per dimension. The exact sample size may vary depending on 
            the complexity of the data and the number of dimensions desired. Additionally, non-metric MDS might perform well 
            in small sample sizes such as 50-100, depending on the structure of the variables.",
          br(), 
          br(),
          br(),
          strong("Categorical Principal Component Analysis (CATPCA)"), " is a dimensionality reduction technique designed 
            specifically for categorical data. It extends traditional Principal Component Analysis (PCA) to handle categorical 
            variables by transforming them into a continuous latent space, allowing for the extraction of principal components 
            that represent the underlying structure of the categorical data.",
          br(),
          br(),
          "CATPCA uses optimal scaling methods to transform categorical variables into numerical forms. This process involves 
            assigning numerical values to categorical levels in a way that preserves the data's structure and relationships.",
          br(),
          br(),
          "The data consists of categorical variables, which can be nominal or ordinal. Categorical variables are assumed to be 
            indicators of underlying latent dimensions.",
          br(),
          br(),
          "A larger sample size is generally recommended to ensure reliable estimation of components, with a typical guideline 
            being at least 200-300 observations",
          br(),
          br(),
          br(),
          strong("Multiple Correspondence Analysis (MCA)"), " is a dimensionality reduction technique used for categorical data. 
            It extends Correspondence Analysis (CA) to handle multiple categorical variables simultaneously. 
            MCA transforms categorical variables into a lower-dimensional space to reveal underlying patterns and relationships 
            between variables.",
          br(),
          br(),
          "MCA involves optimal scaling of categorical data, converting categorical variables into numerical scores based on 
            their associations.",
          br(),
          br(),
          "MCA often provides visualizations such as biplots or scatter plots, which help in interpreting the relationships between 
            categories and variables in the reduced-dimensional space.",
          br(),
          br(),
          "Typically, at least 200-300 observations are advised, especially when dealing with many categories or variables.")
      } else if (input$data_type == "Nominal or multinominal" && 
                 input$assumption_meet == "No. I don't have enough sample size, it's small.") {
          p(" ")
      } else {
          p("Please complete the related inquiries to get a brief explanation.")
      }

    ##Module-9 for Column-4
    } else if (input$module == "Module 9. Scaling or Re-Scaling") {
      if(input$scaling_purpose == "Scaling") {
        p(strong("Thurstone scaling"), ", developed by psychologist Louis Thurstone, is a judgmental scaling technique used to 
          measure attitudes, opinions, and other subjective phenomena. It quantifies qualitative data by placing it on a continuous 
          scale. The process begins with collecting a diverse set of statements about the attitude or opinion of interest. 
          These statements are then evaluated by judges who rate each one based on how favorable or unfavorable it is.",
          br(), 
          br(),
          "Key steps in Thurstone scaling include calculating the median score and interquartile range for each statement based on 
            judges' ratings. Statements with wide variability or ambiguity are discarded, while those with clear, consistent ratings 
            are selected. The final scale consists of these carefully chosen statements, which cover a broad range of attitudes. 
            Respondents indicate their agreement or disagreement with the statements, and their attitude score is determined by 
            the median value of the statements they agree with.",
          br(),
          br(),
          "There are different types of Thurstone scaling methods, including the Method of Equal-Appearing Intervals, 
            where judges ensure equal intervals between points on the scale; the Method of Successive Intervals, which does not 
            require equal intervals; and Paired Comparison, where judges choose the more representative statement from pairs. 
            Despite its reliance on subjective judgments, Thurstone scaling offers a detailed measurement of attitudes but can be 
            resource-intensive and assumes uniform interpretation of statements across respondents.",
          br(),
          br(),
          br(),
          strong("Guttman scaling"), ", developed by Louis Guttman, is a judgmental scaling technique used to measure attitudes and 
            other constructs in a hierarchical manner. Unlike Thurstone scaling, which focuses on placing statements along 
            a continuum, Guttman scaling creates a cumulative scale where items are arranged in a sequence. If a respondent 
            agrees with a more difficult or extreme item, they should also agree with all the less difficult items that precede it.",
          br(),
          br(),
          "The process involves selecting items that represent different levels of the construct being measured. These items are 
            then ordered based on their difficulty or extremity. The scale is considered effective if responses fit the expected 
            cumulative pattern, where agreeing with higher-level items implies agreement with lower-level ones. 
            This hierarchical structure simplifies interpretation by clearly identifying stages or levels within the construct.",
          br(),
          br(),
          "Guttman scaling assumes that the construct being measured is unidimensional, meaning it can be represented on a single 
            scale. While it provides a clear and logical progression, it requires careful item selection and validation to ensure 
            the cumulative pattern holds true. Despite its advantages in creating a structured measurement, Guttman scaling can be 
            challenging to implement and may not always accurately reflect complex, multidimensional constructs.",
          br(),
          br(),
          br(),
          strong("Likert scaling"), ", developed by Rensis Likert, is a popular method for measuring attitudes and 
            opinions using a series of statements. Respondents indicate their level of agreement or disagreement with 
            each statement on a scale, typically ranging from 'strongly agree' to 'strongly disagree.' This approach allows for 
            a nuanced understanding of attitudes by capturing degrees of agreement.",
          br(),
          br(),
          "The scale usually consists of 5 or 7 points, offering a range of responses that help quantify the intensity of 
            respondents' feelings. Each response is assigned a numerical value, which is then aggregated to provide 
            an overall measure of the respondent's attitude. Likert scales are designed to measure a single dimension or construct, 
            ensuring that all items reflect the same underlying concept.",
          br(),
          br(),
          "Unlike judgmental scaling techniques, such as Thurstone or Guttman scaling, which rely on expert evaluations or 
            hierarchical item arrangements, Likert scaling is a self-report method. Respondents self-report their feelings or 
            opinions directly, and the scale is designed with predefined response options to quantify the intensity of 
            their attitudes. Each response is assigned a numerical value, which is aggregated to provide an overall measure of 
            the respondent's attitude.",
          br(),
          br(),
          "While Likert scaling is easy to construct and administer, it can have limitations such as a tendency for respondents 
            to select neutral options or a potential central tendency bias. Despite these challenges, it remains widely used in 
            surveys and research due to its ability to capture nuanced attitudes and opinions in a structured format.")
      } else if (input$scaling_purpose == "Re-scaling" && 
                 input$dimension_type == "One. Consider univariate techniques." && 
                 input$model_type == "Linear") {
        p(strong("Z-score Standardization"), " converts data to have a mean of 0 and a standard deviation of 1, 
            which normalizes the data and makes it easier to compare across different scales.",
          br(),
          br(),
          strong("Min-Max Scaling"), " rescales the data to a fixed range, typically [0, 1], which can be useful 
            for algorithms that require normalized data.")
      } else if (input$scaling_purpose == "Re-scaling" &&
                 input$dimension_type == "One. Consider univariate techniques." && 
                 input$model_type == "Robust-linear") {
        p(strong("Robust Z-score Standardization:"), "  Adjusts Z-score standardization to be less sensitive to outliers, 
            making it more robust for data with extreme values.",
          br(),
          br(),
          strong("Robust Min-Max Scaling:"), "  Similar to Min-Max scaling but less affected by outliers, which provides 
            a scaled range with less influence from extreme values.",
          br(),
          br(),
          strong("Winsorized Scaling:"), " Limits the impact of outliers by capping extreme values, which helps in 
            normalizing data in the presence of extreme values.",
          br(),
          br(),
          strong("Huber M-Estimation:"), " Combines least squares and absolute deviations to scale data robustly, 
            reducing the influence of outliers.",
          br(),
          br(),
          strong("Trimmed Mean Scaling:"), "  Uses a mean calculated after removing a percentage of the highest 
            and lowest values, which provides a robust measure of central tendency.",
          br(),
          br(),
          strong("Robust Quantile Transformation:"), " Transforms data based on quantiles while mitigating the impact of outliers.")
      } else if (input$scaling_purpose == "Re-scaling" &&
                 input$dimension_type == "One. Consider univariate techniques." && 
                 input$model_type == "Non-linear") {
        p(strong("Log Transformation:"), " Converts data to a logarithmic scale to stabilize variance and normalize 
            skewed distributions.",
          br(),
          br(),
          strong("Box-Cox Transformation:"), " Applies a power transformation to stabilize variance and make data 
            more normally distributed.",
          br(),
          br(),
          strong("Robust Log Transformation:"), " Applies a log transformation while handling outliers more effectively, 
            stabilizing variance in skewed data.",
          br(),
          br(),
          strong("Rank-Based Transformation:"), " Converts data into ranks and then scales these ranks, useful for 
            non-parametric approaches.",
          br(),
          br(),
          strong("Quantile Transformation:"), " Maps data to a uniform distribution based on quantiles, which normalizes 
            data distribution.",
          br(),
          br(),
          strong("Logistic Regression Scaling:"), " Scales data using the logistic function, useful for converting data 
            to probabilities.",
          br(),
          br(),
          strong("Polynomial Scaling:"), " Applies polynomial functions to scale data, useful for capturing non-linear relationships.")
      } else if (input$scaling_purpose == "Re-scaling" &&
                 input$dimension_type == "Multiple. Consider multivariate techniques" && 
                 input$model_type == "Linear") {
        p(strong("PCA"), " and ", strong("EFA"),
          "are both statistical techniques that relate closely to scaling, as they involve the transformation and reduction 
            of complex datasets into simpler forms.",
          br(),
          br(),
          "In PCA, the original variables are transformed into principal components, which are linear combinations of the variables 
            ordered by the variance they explain. This transformation typically involves scaling the data, especially 
            when the variables are measured on different scales, to ensure a balanced contribution to the components. 
            The factor scores generated in PCA are scaled values that represent each observation’s position along the principal 
            components, allowing for a clear depiction of the relative location of each subject within the reduced dimensional space.",
          br(),
          br(), 
          "Similarly, EFA identifies underlying latent factors that explain correlations among observed variables. In this process, 
            the factor loadings indicate how much each variable contributes to a factor, effectively scaling the variables 
            according to their importance to the latent constructs. The factor scores in EFA, much like in PCA, are scaled values 
            that provide a numerical representation of each observation’s level on the latent factors. These scores can be used to 
            compare the relative importance of different variables or to describe the relative location of subjects 
            within the framework of the identified factors.",
          br(),
          br(), 
          "In both PCA and EFA, these scores serve as scaled measures that summarize complex, multidimensional data into 
            more manageable and interpretable forms.",
          br(),
          br(), 
          br(), 
          strong("Metric-MDS"), " is a statistical technique used for visualizing the similarity 
            or dissimilarity between objects in a lower-dimensional space. It is closely related to scaling techniques 
            because it involves transforming the original dissimilarity or distance data into coordinates 
            in a reduced-dimensional space to facilitate interpretation and comparison.",
          br(), 
          br(), 
          "Metric MDS works by taking a matrix of distances or dissimilarities between objects and finding a configuration of points
            in a lower-dimensional space such that the distances between the points reflect the original distances as closely as 
            possible. This process inherently involves scaling, as it aims to map the original distance data into a space 
            where the relative distances between points are preserved. The coordinates of the points in this reduced space are 
            scaled values that represent the relative positions of the objects based on the original distance matrix.",
          br(), 
          br(), 
          "These scaled coordinates allow for the examination of the relative location of subjects or objects 
            in the reduced-dimensional space, providing insights into the underlying structure of the data. By visualizing objects 
            in this way, Metric MDS helps to describe the relative level or location of subjects based on their dissimilarities, 
            making it easier to understand patterns and relationships in the data.",
          br(),
          br(),
          br(),
          strong("CCA"), " is a statistical technique used to explore the relationships 
            between two sets of variables. It is related to scaling techniques in that it involves transforming and 
            scaling the original variables to identify and measure the strength of associations between the two sets.",
          br(),
          br(),
          "In CCA, the goal is to find linear combinations of variables from each set such that the correlations between 
            these combinations are maximized. This involves scaling the original variables to construct canonical variates—linear 
            combinations of the variables from each set. These canonical variates are scaled values that represent 
            the relationships between the sets of variables. By examining the correlations between the canonical variates, 
            CCA reveals how strongly the two sets of variables are related.",
          br(),
          br(),
          "The canonical variates, which are scaled representations, help in understanding the relative importance of the variables 
            within each set and their relationships to variables in the other set. This allows for a clearer interpretation of 
            how changes in one set of variables correspond to changes in the other set. Therefore, CCA provides insights into 
            the relative level or location of subjects with respect to the relationships between the two sets of variables 
            by highlighting how they jointly vary.",
          br(),
          br(),
          br(),
          strong("CA"), " and ", strong("MCA"), " are statistical techniques used to explore and visualize relationships between 
            categorical variables. Both methods are related to scaling because they transform categorical data into 
            a lower-dimensional space to reveal patterns and associations.",
          br(),
          br(),
          "CA is used to analyze the relationships between two categorical variables by representing the data in a two-dimensional 
            space. It creates a graphical representation where rows and columns of a contingency table are plotted as points in 
            this space. The distances between these points reflect the associations between the categories of the variables. 
            Scaling in CA involves transforming the categorical data into coordinates in this reduced-dimensional space, 
            which allows for the visualization of the relationships and the relative positions of categories.",
          br(),
          br(),
          "MCA extends this concept to more than two categorical variables. It generalizes CA to handle complex datasets with 
            multiple categorical variables by simultaneously analyzing the relationships between all variables. MCA scales the data 
            by mapping categories from all variables into a shared lower-dimensional space, where the distances between points 
            represent the associations between the categories across the variables. The resulting coordinates in this space 
            provide a comprehensive view of how categories relate to one another.",
          br(),
          br(),
          "Both CA and MCA produce scaled values that represent the positions of categories in a reduced-dimensional space, 
            allowing for an intuitive understanding of the relative locations and relationships of categories across variables. 
            This scaling facilitates the interpretation of complex categorical data by summarizing it into a format 
            where patterns and associations are more easily visualized.")
      } else if (input$scaling_purpose == "Re-scaling" &&
                 input$dimension_type == "Multiple. Consider multivariate techniques" && 
                 input$model_type == "Robust-linear") {
        p(strong("Robust PCA"), " and ", strong("Robust EFA"), " are variations of PCA and EFA designed to handle data that 
          may be contaminated with outliers or deviations from normality.",
          br(),
          br(),
          "Robust PCA is an adaptation of traditional PCA that aims to provide stable and reliable results even in the presence of 
            outliers or noise in the data. While standard PCA can be sensitive to outliers, which can skew the results and 
            distort the principal components, Robust PCA incorporates techniques to mitigate the influence of such anomalies. 
            It does this by using methods like robust covariance estimation or alternative optimization approaches that 
            downweight the impact of outliers, thus producing principal components that more accurately reflect the underlying 
            structure of the majority of the data. The scaled principal component scores derived from Robust PCA still represent 
            the relative positions of observations but are more robust to irregularities in the data.",
          br(),
          br(),
          "Robust EFA similarly modifies traditional EFA to handle outliers and deviations from standard assumptions. Standard EFA 
            assumes normally distributed errors and may produce biased factor estimates if these assumptions are violated. 
            Robust EFA employs techniques such as robust estimation of factor loadings or adjustment methods that reduce 
            the impact of outliers and non-normality on the factor structure. The factor scores obtained from Robust EFA are 
            scaled to reflect each subject’s position on the latent factors while accounting for irregularities in the data, 
            leading to more reliable and interpretable results.",
          br(),
          br(),
          "In both cases, these robust methods offer enhanced stability and reliability in the presence of data irregularities 
            by producing scaled scores and factor estimates that better reflect the true underlying patterns while minimizing 
            the influence of outliers or deviations.")
      } else if (input$scaling_purpose == "Re-scaling" &&
                 input$dimension_type == "Multiple. Consider multivariate techniques" && 
                 input$model_type == "Non-linear") {
        p(strong("Non-metric MDS"), " is a technique used to explore and visualize the structure of dissimilarity data 
          without assuming that the distances between objects follow a specific metric or linear relationship. Unlike metric MDS, 
          which requires that the distances between objects are preserved in a quantitative sense, non-metric MDS focuses on 
          preserving the rank order of dissimilarities rather than their exact magnitudes.",
          br(),
          br(),
          "In non-metric MDS, the process involves converting the original dissimilarity or similarity data into a rank order of 
            distances, rather than using exact distance values. The technique then seeks a configuration of points 
            in a lower-dimensional space that best preserves these ranks. This means that the distances between points 
            in the reduced space are adjusted to reflect the relative ordering of dissimilarities, rather than 
            their exact numerical values.",
          br(),
          br(),
          "The scaling in Non-metric MDS is achieved by mapping the rank-based dissimilarities into a lower-dimensional space, 
            where the relative distances between points are adjusted to best fit the original rank order. This approach is 
            particularly useful when the data does not meet the assumptions required for metric scaling or when the focus is 
            on understanding the relative rather than absolute differences between objects.",
          br(),
          br(),
          "The result is a visual representation where the scaled coordinates of the objects reflect their relative dissimilarities 
            based on rank order, allowing for an intuitive understanding of the underlying structure and relationships 
            within the data. Non-metric MDS provides insights into how objects are positioned relative to each other 
            in a reduced-dimensional space, making it easier to identify patterns and relationships 
            even when exact distance measurements are not available.",
          br(),
          br(),
          br(),
          strong("In IRT,"), " the responses to test items are analyzed to estimate parameters for both the items and 
            the individuals. The models typically focus on how the probability of a particular response to an item depends on 
            both the individual's latent trait level and the characteristics of the item, such as its difficulty and discrimination.",
          br(),
          br(),
          "IRT models scale item responses to produce estimates of latent traits (e.g., ability levels) on a continuous scale. 
            These estimates are derived from the item parameters and the response patterns of individuals. For instance, 
            a common IRT model is the 2-Parameter Logistic (2PL) model, where each item is characterized by its difficulty and 
            discrimination parameters, and individuals are scaled based on their estimated latent trait levels.",
          br(),
          br(),
          "In IRT, the scaled scores reflect individuals' positions on the latent trait continuum. Items are also scaled based on 
            their parameters, providing insight into how different items contribute to measuring the latent trait. 
            The estimated latent trait scores indicate where individuals stand relative to others on the trait, 
            and the item parameters show how different items differentiate between individuals with different trait levels. 
            This scaling allows for a detailed description of individuals' abilities or attitudes and how they relate to 
            the characteristics of the test items.",
          br(),
          br(),
          br(),
          "In ", strong("Multivariate Polynomial Scaling"), ", the goal is to transform the data into a lower-dimensional space 
            where the relationships among variables are represented by polynomial functions. These polynomials can capture 
            nonlinear associations that linear methods might miss. The technique involves fitting polynomial models to the data 
            and then using these models to scale the variables into a new coordinate system that reflects 
            these nonlinear relationships.",
          br(),
          br(),
          "The technique involves transforming the original variables into a new space defined by polynomial functions of 
            the original variables. This transformation scales the data in such a way that the new coordinates better represent 
            the underlying nonlinear relationships. By fitting polynomial functions of various degrees, the approach can model 
            complex interactions and capture a more nuanced structure of the data.",
          br(),
          br(),
          "The technique provides scaled values that represent the positions of observations in the transformed space. 
            These scaled coordinates reflect the nonlinear relationships among the variables, allowing for a detailed description of 
            how observations relate to one another in terms of the polynomial model. The polynomial coefficients can also indicate 
            the relative importance of different variables in explaining the variability in the data, offering insights 
            into which variables have the most significant impact on the observed relationships.")
      } else {
        p("We can consider two main groups of techniques in the context of scaling.",
          br(),
          br(), 
          strong("1) Scaling techniques:"),
          br(), 
          "These techniques are used when the goal is to construct a new scale for measuring specific attributes or attitudes. 
            They provide direct measurements through structured formats. They can depend on expert judgements or self-reporting 
            They can considered as traditional methods. They are unidimensional and describing the relative locations on 
            a unidimensional continuum.",
          br(), 
          br(), 
          strong("2) Rescaling techniques:"),
          br(), 
          "These methods are designed for analyzing and transforming existing data rather than creating new scales. They are used to
            re-scaling data by identifying underlying patterns, reducing dimensionality, or visualizing relationships between items.",
          br(), 
          br(), 
          strong("Re-scaling techniques"), " refer to statistical methods used to adjust, transform, or map data, typically to bring it 
            within a certain range, standardize it, or reduce its dimensionality. These techniques can be applied to 
            individual variables (univariate scaling) or to sets of variables (multivariate scaling). 
            The goal is often to prepare data for further analysis, to compare variables on a common scale, or to reveal 
            underlying patterns and structures in the data.",
          br(),
          br(),
          "Re-scaling techniques serve several purposes:",
          br(),
          br(),
          strong("- Normalization and Transformation:"), " To standardize data by adjusting the scale of variables, 
            bringing them to a common range, or transforming them to meet statistical assumptions (e.g., normality).",
          br(),
          br(),
          strong("- Comparing and Ranking:"), " To enable comparison across different variables or groups by putting them 
            on the same scale, or to rank subjects based on certain criteria.",
          br(),
          br(),
          strong("- Data Reduction:"), " To reduce the complexity of data by transforming multiple variables into fewer variables 
            (e.g., Principal Component Analysis), making it easier to interpret and analyze.",
          br(),
          br(),
          strong("- Estimating Relative Importance:"), " In multivariate analysis, scaling can help in estimating the relative 
            importance of variables or features within a model.",
          br(),
          br(),
          br(),
          em("Please complete the related inquiries to get a brief explanation about a specific technique or related techniques 
            in some certain conditions"))
      }

    ##Module-10 for Column-4
    } else if (input$module == "Module 10. Item and test analyses in scale development and adaptation") {
      if(input$theory_type == "Classical Test Theory (CTT)" &&
         input$study_type == "Item and test statistics for descriptive purposes") {
        p(strong("Item difficulty"), " is the ratio of correct responses in dichotomous items. In Polytomous items, 
            it refers to the ratio of the mean scores of an item to the possible maxium score for this item. 
            Higher values indicate easines of an item.",
          br(),
          br(),
          strong("Discirimination index"), " refers to the difference between difficulty indexes of lower group and upper group.
            To obtain lower and upper groups, after sorting the total score, the entire group can be seperated by 50% or 
            lower-upper 25% percentiles.",
          br(),
          br(),
          "Also, correlations between item scores and total scores can be considered as item discirimination. In this context,
            'point-biserial correlation' or 'biserial correlation' is appropriate for dichotomous items. For Polytomous items,
            'polyserial correlation' might be one of the best choices.")
      } else if (input$theory_type == "Item Response Theory (IRT)" &&
                 input$study_type == "Item and test statistics for descriptive purposes" &&
                 input$dimension_type_1 == "Unidimensional" &&
                 input$item_type_1 == "Dichotomous") {
         p("In Item Response Theory (IRT), different models are used to estimate item parameters based on how they describe 
             the relationship between a person's ability (or trait level) and their probability of correctly answering an item. 
             For dichotomous items, the three primary models—1PL or Rasch, 2PL, and 3PL—differ in the number of parameters 
             they estimate for each item.",
           br(),
           br(),
           strong("1PL Model"),
           br(),
           "The 1PL model, also known as the Rasch model, estimates a single parameter for each item, 
             called the difficulty parameter. This parameter represents the ability level at which a respondent has a 50% chance of 
             answering the item correctly. In the 1PL model, all items are assumed to have the same discrimination, 
             meaning each item is equally effective at distinguishing between individuals of different ability levels. 
             The simplicity of this model makes it useful for creating measures that are invariant across different groups, 
             ensuring that item difficulty is the same regardless of the sample.",
           br(),
           br(),
           strong("2PL Model"),
           br(),
           "The 2PL model extends the 1PL model by introducing a second parameter, the discrimination parameter. This parameter 
             reflects how well an item can differentiate between individuals with different ability levels. In the 2PL model, 
             items can vary in their ability to distinguish between respondents, meaning some items may be better at identifying 
             differences in ability than others. The difficulty parameter is still present, but now each item has 
             its unique discrimination value, providing a more nuanced understanding of how each item functions.",
           br(),
           br(),
           strong("3PL Model"),
           br(),
           "The 3PL model adds a third parameter, the guessing parameter, to the 2PL model. The guessing parameter accounts for 
             the probability that a respondent with very low ability might guess the correct answer. This is particularly relevant 
             in multiple-choice tests, where there is a chance that even those with low ability might answer correctly by guessing. 
             The 3PL model thus provides a more comprehensive analysis of item performance by considering difficulty, discrimination, 
             and the likelihood of guessing.",
           br(),
           br(),
           br(),
           "In using these models, besides item parameters, you can consider ", strong("item information function (IIF)"), " and ", 
             strong("test information function (TIF)"), "to describe the item or test parameters. Also, IIF and TIF are 
             crucial concepts that describe the precision with which an item or a test measures a respondent's ability. 
             These functions are central to understanding how well items or tests differentiate between individuals at 
             various ability levels.")
      } else if (input$theory_type == "Item Response Theory (IRT)" &&
                 input$study_type == "Item and test statistics for descriptive purposes" &&
                 input$dimension_type_1 == "Unidimensional" &&
                 input$item_type_1 == "Polytomous") {
         p("These three models are extensions of Item Response Theory (IRT) designed to handle polytomous items, 
             where responses are categorized into more than two ordered categories (e.g., Likert scales).",
           br(),
           br(),
           strong("Graded Response Model (GRM)"),
           br(),
           "GRM is an extension of the 2PL model for ordinal responses, such as those found in Likert-type scales. In GRM, 
             each item has multiple thresholds, one for each possible transition between adjacent response categories. 
             The model estimates both a discrimination parameter and a set of threshold parameters for each item. 
             The discrimination parameter indicates how well the item differentiates between individuals with varying levels of 
             the trait, while the threshold parameters represent the points on the trait continuum where respondents are 
             equally likely to choose between adjacent categories. GRM is particularly useful when items have ordered response 
             categories, and the goal is to model the probability of endorsing higher levels of the trait.",
           br(),
           br(),
           strong("Partial Credit Model (PCM)"),
           br(),
           "PCM, is an extension of the Rasch model for polytomous items. In PCM, each response category within an item is 
             associated with its own difficulty parameter. Unlike GRM, PCM does not estimate a discrimination parameter, and 
             it assumes that all items have equal discrimination. The model is particularly flexible because it allows 
             different items to have different numbers of response categories. PCM is well-suited for assessments where the steps 
             between response categories vary in difficulty, such as performance tasks where partial credit is awarded based on 
             the level of completion or accuracy.",
           br(),
           br(),
           strong("Rating Scale Model (RSM)"),
           br(),
           "RSM, is a special case of the PCM, where all items share the same set of thresholds across categories. This means that 
             the difference between adjacent response categories is assumed to be consistent across all items. RSM is particularly 
             useful when a uniform rating scale is applied across different items, such as when all items in a survey use the same 
             Likert scale. This model simplifies analysis by assuming that the structure of the response categories is identical for 
             all items, which can be advantageous in certain types of surveys or questionnaires.")
      } else if (input$theory_type == "Item Response Theory (IRT)" &&
                 input$study_type == "Item and test statistics for descriptive purposes" &&
                 input$dimension_type_1 == "Unidimensional" &&
                 input$item_type_1 == "Mixed") {
         p(strong("Mixed-IRT models"), ", also known as ", strong("Mixture IRT models"), ", are a class of models that 
             combine elements of traditional Item Response Theory (IRT) with mixture modeling techniques. In a Mixed-IRT model, 
             you can incorporate both dichotomous and polytomous items by specifying separate submodels for each item type. 
             The model will estimate the item parameters for each type of item while also identifying latent subgroups 
             in the population if the model assumes that the population is heterogeneous.",
           br(),
           br(),
           "Mixed-IRT models can be computationally complex, especially when combining multiple item types and estimating parameters 
             for multiple latent classes. Ensuring adequate sample size and computational resources is important.",
           br(),
           br(),
           "Many modern statistical software packages support Mixed-IRT modeling, including those that allow for the combination of 
             dichotomous and polytomous items (e.g., Mplus, flexMIRT, and the mirt package in R). These tools provide flexibility 
             in specifying and estimating the model parameters.")
      } else if (input$theory_type == "Item Response Theory (IRT)" &&
                 input$study_type == "Item and test statistics for descriptive purposes" &&
                 input$dimension_type_1 == "Multidimensional") {
         p(strong("Multidimensional Item Response Theory (MIRT)"), " extends the traditional (unidimensional) IRT models 
             by allowing for the assessment of multiple latent traits (or abilities) simultaneously, rather than assuming a single 
             underlying trait. This is particularly useful when a test is designed to measure more than one ability or construct, 
             as is often the case in educational, psychological, or health-related assessments.",
           br(),
           br(),
           "In MIRT, each item can be associated with multiple parameters, each corresponding to the different latent traits. 
             For instance, an item might have different difficulty or discrimination parameters for each trait it is intended to 
             measure. This allows the model to capture how each item contributes to measuring the multiple dimensions.",
           br(),
           br(),
           "There are different types of MIRT such as 'Compensatory Models', 'Non-Compensatory Models', 'Simple Structure Models' or
             'Complex Structure Models'. MIRT models are more complex than unidimensional IRT models, requiring larger sample sizes 
             and more computational resources to estimate parameters accurately. Specialized software is often required to estimate 
             MIRT models (e.g., Mplus, flexMIRT, or the mirt package in R), and the estimation process can be more demanding.")
      } else if (input$theory_type == "Classical Test Theory (CTT)" &&
                 input$study_type == "Reliability studies" &&
                 input$reliability_type == "Internal consistency" &&
                 input$dimension_type_2 == "Unidimensional" &&
                 input$item_type_2 == "Dichotomous") {
         p("KR-20 and KR-21 are both measures of internal consistency reliability specifically designed for dichotomous items, 
             typically used in tests or questionnaires with binary outcomes (e.g., right/wrong, true/false).",
           br(),
           br(),
           strong("KR-20"), " is a reliability coefficient that accounts for the variability in item difficulty across the test. 
             It calculates reliability by considering both the proportion of individuals who answered each item correctly and 
             the overall variance of the test scores. Because KR-20 takes into account the actual performance on each item, 
             it provides a more precise estimate of reliability when item difficulties vary. It's often used when detailed 
             item-level data are available, making it a preferred choice for tests with dichotomous items.",
           br(),
           br(),
           strong("KR-21"), " is a simplified version of KR-20 that assumes all items have the same difficulty level. It uses 
             the overall test mean and variance to estimate reliability, without requiring specific information on individual item 
             performance. While this makes KR-21 easier to calculate, it may lead to an underestimation of reliability if 
             the assumption of equal item difficulty is not met. KR-21 is typically used as a quick estimate of reliability, 
             particularly when detailed item data are unavailable.")
      } else if (input$theory_type == "Classical Test Theory (CTT)" &&
                 input$study_type == "Reliability studies" &&
                 input$reliability_type == "Internal consistency" &&
                 input$dimension_type_2 == "Unidimensional" &&
                 input$item_type_2 == "Polytomous") {
         p(strong("Cronbach's Alpha"), " is a widely used statistic for assessing the internal consistency reliability of 
             a test or questionnaire. It measures how closely related a set of items are as a group, providing an estimate of 
             the overall reliability of the instrument.",
             br(),
             br(),
             "The coefficient is calculated based on the average correlation between items and the number of items in the test. 
               Essentially, it evaluates how well the items in a scale or test measure the same underlying construct. A higher 
               Cronbach's Alpha indicates that the items are more consistently measuring the same concept. Values typically 
               range from 0 to 1, with higher values suggesting better internal consistency. Common thresholds are 0.70 for 
               acceptable reliability and 0.80 or higher for good reliability, although these can vary depending on the context and 
               the nature of the instrument.",
             br(),
             br(),
             "Cronbach's Alpha is particularly useful for polytomous items and is commonly used in social sciences, psychology,
               and education. However, it's important to note that Cronbach’s Alpha assumes unidimensionality; that is, it assumes 
               that all items measure a single construct. If items measure multiple dimensions, the coefficient might 
               underestimate the true reliability of the test. In such cases, it’s helpful to conduct additional analyses, 
               such as factor analysis, to confirm unidimensionality.")
      } else if (input$theory_type == "Classical Test Theory (CTT)" &&
                 input$study_type == "Reliability studies" &&
                 input$reliability_type == "Internal consistency" &&
                 input$dimension_type_2 == "Unidimensional" &&
                 input$item_type_2 == "Mixed") {
         p(strong("McDonald’s Omega"), " is more flexible than Cronbach’s Alpha and can be used with a mix of item types. 
             It provides a measure of reliability that is less affected by the nature of item responses and is particularly useful 
             for more complex scenarios involving different types of items. Omega is designed to handle different types of items 
             more accurately and is often preferred when the assumption of equal item variance (which Cronbach’s Alpha assumes) 
             might not hold.",
             br(),
             br(),
             strong("Stratified Alpha"), " is an extension of Cronbach’s Alpha that accounts for differences in item types and 
               their variances. It is particularly useful when dealing with items that are grouped into different strata or 
               dimensions, even if they are mixed types. By stratifying the items, this method adjusts for the heterogeneity 
               in the item responses and provides a more accurate measure of internal consistency across different item types.",
             br(),
             br(),
             strong("Angoff-Feldt"), " is an adaptation of the classical reliability coefficient, which adjusts for the impact of 
               item difficulty and other factors. It is designed to provide a more nuanced reliability estimate in cases 
               where items vary in difficulty and are not uniformly distributed. This method takes into account the differential 
               impact of various items on the overall score, making it a useful option when working with a mix of item types.",
             br(),
             br(),
             strong("Feldt-Raju"), " is another advanced method that provides a more refined measure of internal consistency 
               by considering item-specific variances and covariances. This estimate is particularly useful in complex scenarios 
               where items have different properties and are not perfectly homogeneous. It can handle mixed item types and offers 
               a reliability measure that better reflects the true consistency of the scale.")
      } else if (input$theory_type == "Classical Test Theory (CTT)" &&
                 input$study_type == "Reliability studies" &&
                 input$reliability_type == "Internal consistency" &&
                 input$dimension_type_2 == "Multidimensional") {
         p(strong("McDonald’s Omega"), " is a reliability coefficient that measures the proportion of variance in test scores 
             attributable to the underlying latent trait or construct. It provides a comprehensive estimate of internal consistency 
             by considering the dimensional structure of the test.",
             br(),
             br(),
             strong("Omega Total"), " reflects the proportion of total variance in the test scores that is attributable to 
               the latent trait or construct. This measure offers an overall estimate of internal consistency and 
               can be applied to tests with dichotomous, polytomous, and mixed items. It gives a general measure of reliability 
               for the entire test.",
             br(),
             br(),
             strong("Omega Hierarchical"), " assesses the proportion of variance in the test scores that is attributable to 
               a specific dimension or factor while accounting for the influence of other dimensions. It is particularly useful 
               for multidimensional tests where you want to evaluate the reliability of each specific dimension. This form of 
               Omega is suitable for dichotomous, polytomous, and mixed items within each dimension.",
             br(),
             br(),
             strong("Omega Subscale"), " estimates the internal consistency of individual subscales or dimensions within the test, 
               providing reliability measures for each subscale separately. It can be used effectively for tests with 
               multiple dimensions and is applicable to tests with dichotomous, polytomous, and mixed items.",
             br(),
             br(),
             "In summary, McDonald’s Omega is versatile and robust. It can be used effectively with dichotomous items, 
               polytomous items, and mixed item types, accommodating the complexity of multidimensional data and varying 
               item characteristics.")
      } else if (input$theory_type == "Classical Test Theory (CTT)" &&
                 input$study_type == "Reliability studies" &&
                 input$reliability_type == "Test-retest" &&
                 input$item_type_3 == "Dichotomous") {
         p(strong("Pearson’s Correlation Coefficient"), " is a measure used to evaluate the strength and direction of the linear 
             relationship between two sets of scores. In the context of test-retest reliability, it is used to assess the stability 
             of test scores over time. The test-retest reliability design involves administering the same test to the same group of 
             individuals at two different points in time and then calculating the correlation between their scores on each occasion.",
           br(),
           br(),
           "When applying Pearson’s correlation in test-retest reliability, you are essentially measuring how consistently 
             individuals score on the test across the two time points. A high positive correlation indicates that individuals 
             who scored high on the test initially tend to score high on the retest, reflecting stable and reliable measurements. 
             Conversely, a low correlation suggests that scores vary considerably over time, indicating potential issues with 
             the test's stability or consistency.",
           br(),
           br(),
           br(),
           strong("McNemar test"), " is used to evaluate changes in paired categorical data, particularly with dichotomous items, 
             across two time points. In test-retest reliability, it assesses whether there is a significant change in responses 
             between the two administrations. By analyzing a 2x2 contingency table, the McNemar test identifies the number of 
             participants who changed their responses and determines if these changes are statistically significant. It focuses on 
             discordant pairs where responses differ between the two tests, providing insight into the stability or shifts in 
             responses over time.",
           br(),
           br(),
           br(),
           em(strong("Reminder:"), " If your data is multidimensional, you may consider to study on each dimension seperately with 
             these techniques"))
      } else if (input$theory_type == "Classical Test Theory (CTT)" &&
                 input$study_type == "Reliability studies" &&
                 input$reliability_type == "Test-retest" &&
                 input$item_type_3 == "Polytomous") {
         p(strong("Pearson’s Correlation Coefficient"), " is a measure used to evaluate the strength and direction of the linear 
             relationship between two sets of scores. In the context of test-retest reliability, it is used to assess the stability 
             of test scores over time. The test-retest reliability design involves administering the same test to the same group of 
             individuals at two different points in time and then calculating the correlation between their scores on each occasion.",
           br(),
           br(),
           br(),
           strong("Spearman’s Rank Correlation Coefficient"), " is used to assess the strength and direction of the monotonic 
             relationship between two sets of ranked scores. In the context of test-retest reliability, it evaluates 
             how consistently rankings of items or responses are maintained between two test administrations.",
           br(),
           br(),
           "When applied to test-retest data, Spearman’s correlation is particularly useful for ordinal or non-normally distributed 
             data. It ranks the responses from each test administration and calculates the correlation between these rankings. 
             A high Spearman correlation indicates that the order of responses remains consistent across the two time points, 
             reflecting reliable measurement over time. This method is valuable when the data are not continuous or 
             when the assumptions for Pearson’s correlation (such as linearity) are not met.",
           br(),
           br(),
           br(),
           em(strong("Reminder:"), " If your data is multidimensional, you may consider to study on each dimension seperately with 
             these techniques"))
      } else if (input$theory_type == "Classical Test Theory (CTT)" &&
                 input$study_type == "Reliability studies" &&
                 input$reliability_type == "Test-retest" &&
                 input$item_type_3 == "Mixed") {
         p("When applying ", strong("Pearson’s correlation"), " in test-retest reliability, you are essentially measuring 
             how consistently individuals score on the test across the two time points. A high positive correlation indicates that 
             individuals who scored high on the test initially tend to score high on the retest, reflecting stable and 
             reliable measurements. Conversely, a low correlation suggests that scores vary considerably over time, indicating 
             potential issues with the test's stability or consistency.",
           br(),
           br(),
           strong("McNemar test"), " is used to evaluate changes in paired categorical data, particularly with dichotomous items, 
             across two time points. In test-retest reliability, it assesses whether there is a significant change in responses 
             between the two administrations. By analyzing a 2x2 contingency table, the McNemar test identifies the number of 
             participants who changed their responses and determines if these changes are statistically significant. It focuses on 
             discordant pairs where responses differ between the two tests, providing insight into the stability or shifts in 
             responses over time.",
           br(),
           br(),
           "When applied to test-retest data, ", strong("Spearman’s correlation"), " is particularly useful for ordinal or 
             non-normally distributed data. It ranks the responses from each test administration and calculates the correlation 
             between these rankings. A high Spearman correlation indicates that the order of responses remains consistent across 
             the two time points, reflecting reliable measurement over time.",
           br(),
           br(),
           br(),
           em(strong("Reminder:"), " If your data is multidimensional, you may consider to study on each dimension seperately with 
             these techniques"))
      } else if (input$theory_type == "Classical Test Theory (CTT)" &&
                 input$study_type == "Reliability studies" &&
                 input$reliability_type == "Alternate forms" &&
                 input$item_type_3 == "Dichotomous") {
         p(strong("Pearson’s Correlation Coefficient"), " is a measure used to evaluate the strength and direction of the linear 
             relationship between two sets of scores. In the context of alternate forms reliability, it is used to assess the stability 
             of test scores between the parallel forms. The alternate forms reliability design involves administering the equal forms of a test to the same group of 
             individuals in the same time and then calculating the correlation between their scores on each form.",
           br(),
           br(),
           "When applying Pearson’s correlation in alternate forms reliability, you are essentially measuring how consistently 
             individuals scores on the parallel forms of a test. A high positive correlation indicates that individuals 
             who scored high on one form of the test tend to score high on the other form, reflecting stable and reliable measurements. 
             Conversely, a low correlation suggests that scores vary considerably over time, indicating potential issues with 
             the test's stability or consistency.",
           br(),
           br(),
           br(),
           strong("Phi Coefficient"), " is a measure of association used to evaluate the relationship between two dichotomous 
             variables. It calculates the correlation between two binary variables by examining the frequency of their 
             co-occurrence in a 2x2 contingency table.",
           br(),
           br(),
           "To use the Phi Coefficient in the context of alternate forms reliability, first, administer both test forms to the same 
             participants. For each pair of dichotomous items—one from each form—construct a 2x2 contingency table that shows 
             the frequencies of each possible combination of responses.Then, calculate the Phi Coefficient using the formula 
             that takes into account these frequencies. This coefficient will provide a value between -1 and 1. A high Phi value 
             suggests that the items on the alternate forms are consistently related, reflecting good reliability between the forms.",
           br(),
           br(),
           br(),
           em(strong("Reminder:"), " If your data is multidimensional, you may consider to study on each dimension seperately with 
             these techniques"))
      } else if (input$theory_type == "Classical Test Theory (CTT)" &&
                 input$study_type == "Reliability studies" &&
                 input$reliability_type == "Alternate forms" &&
                 input$item_type_3 == "Polytomous") {
         p(strong("Pearson’s Correlation Coefficient"), " is a measure used to evaluate the strength and direction of the linear 
             relationship between two sets of scores. In the context of alternate forms reliability, it is used to assess the stability 
             of test scores between the parallel forms. The alternate forms reliability design involves administering the equal forms of a test to the same group of 
             individuals in the same time and then calculating the correlation between their scores on each form.",
           br(),
           br(),
           br(),
           strong("Spearman’s Rank Correlation Coefficient"), " is used to assess the strength and direction of the monotonic 
             relationship between two sets of ranked scores. In the context of alternate forms reliability, it evaluates 
             how consistently rankings of items or responses are maintained between two forms of administrations.",
           br(),
           br(),
           "When applied to alternate forms data, Spearman’s correlation is particularly useful for ordinal or non-normally distributed 
             data. It ranks the responses from each form and calculates the correlation between these rankings. 
             A high Spearman correlation indicates that the order of responses remains consistent across the parallel forms of a test, 
             reflecting reliable measurement over time. This method is valuable when the data are not continuous or 
             when the assumptions for Pearson’s correlation (such as linearity) are not met.",
           br(),
           br(),
           br(),
           em(strong("Reminder:"), " If your data is multidimensional, you may consider to study on each dimension seperately with 
             these techniques"))
      } else if (input$theory_type == "Classical Test Theory (CTT)" &&
                 input$study_type == "Reliability studies" &&
                 input$reliability_type == "Alternate forms" &&
                 input$item_type_3 == "Mixed") {
         p("When applying Pearson’s correlation in alternate forms reliability, you are essentially measuring how consistently 
             individuals scores on the parallel forms of a test. A high positive correlation indicates that individuals 
             who scored high on one form of the test tend to score high on the other form, reflecting stable and reliable measurements. 
             Conversely, a low correlation suggests that scores vary considerably over time, indicating potential issues with 
             the test's stability or consistency.",
           br(),
           br(),
           strong("Phi Coefficient"), " is a measure of association used to evaluate the relationship between two dichotomous 
             variables. It calculates the correlation between two binary variables by examining the frequency of their 
             co-occurrence in a 2x2 contingency table.",
           br(),
           br(),
           "When applied to alternate forms data, ", strong("Spearman’s correlation"), " is particularly useful for ordinal or non-normally distributed 
             data. It ranks the responses from each form and calculates the correlation between these rankings. 
             A high Spearman correlation indicates that the order of responses remains consistent across the parallel forms of a test, 
             reflecting reliable measurement over time. This method is valuable when the data are not continuous or 
             when the assumptions for Pearson’s correlation (such as linearity) are not met.",
           br(),
           br(),
           br(),
           em(strong("Reminder:"), " If your data is multidimensional, you may consider to study on each dimension separately with 
             these techniques"))
      } else if (input$theory_type == "Classical Test Theory (CTT)" &&
                 input$study_type == "Reliability studies" &&
                 input$reliability_type == "Inter-rater reliability") {
         p(strong("Cohen’s Kappa"), " is used to measure the agreement between two raters when classifying items into categorical 
             outcomes. It adjusts for the agreement that might occur by chance, providing a more accurate measure of how well 
             the raters agree. The Kappa statistic ranges from -1 to 1, where 1 indicates perfect agreement, -1 indicates 
             complete disagreement, and 0 suggests that the agreement level is what would be expected by chance alone. 
             This measure is particularly useful when you want to understand how consistently two raters classify items into the 
             same categories.",
           br(),
           br(),
           strong("Fleiss’ Kappa"), " is an extension of Cohen’s Kappa designed for situations involving more than two raters. 
             It evaluates the level of agreement among multiple raters when they are classifying items into categories. 
             Like Cohen’s Kappa, Fleiss’ Kappa adjusts for chance agreement, but it can handle data from multiple raters. 
             It provides a measure of how much consensus there is among the raters, with values ranging from -1 to 1. 
             Positive values indicate agreement beyond chance, while values close to zero suggest that the agreement is no better 
             than what would be expected by chance.",
           br(),
           br(),
           strong("The Intraclass Correlation Coefficient (ICC)"), " assesses the reliability and consistency of ratings when 
             dealing with continuous or ordinal data. It measures how well multiple raters provide similar ratings across 
             different items or subjects. ICC is suitable for both unidimensional and multidimensional datasets and provides 
             a coefficient that reflects the degree of agreement among raters. A high ICC value indicates high consistency and 
             reliability in the ratings provided by the raters, while a low value suggests variability in the ratings.",
           br(),
           br(),
           strong("Krippendorff’s Alpha"), " is a measure of agreement that can be used for categorical, ordinal, or interval data. 
             It is particularly useful for situations with multiple raters and various types of data. Krippendorff’s Alpha 
             calculates the level of agreement beyond what would be expected by chance and adjusts for the type of data and 
             the number of raters involved. It provides a comprehensive measure of inter-rater reliability, accommodating different 
             rating scales and types of data, with higher values indicating better agreement among raters.",
           br(),
           br(),
           strong("Simple agreement percentage"), " is a basic measure used in the context of inter-rater agreement to assess 
             the extent to which different raters or judges agree on their ratings or classifications. It is calculated as 
             the percentage of instances in which all raters give the same rating or make the same classification. While it provides 
             a quick and easy way to assess agreement, it is often used as a preliminary or supplementary measure. For a more accurate 
             assessment of inter-rater agreement, especially when dealing with ordinal or nominal data, it is recommended to use other 
             statistical methods that adjust for chance agreement.")
      } else if (input$theory_type == "Item Response Theory (IRT)" &&
                 input$study_type == "Reliability studies" &&
                 input$dimension_type_3 == "Unidimensional") {
         p(strong("Item Information Function (IIF)"), " assesses how much information each individual item provides about 
             the latent trait. It helps to identify which items contribute most to the measurement of the trait. IFF analyzes 
             the reliability of each item. Items with higher information values are more reliable for measuring the trait.",
           br(),
           br(),
           strong("Test Information Function (TIF)"), " provides information about how well the test measures the latent trait 
             across different levels of the trait. It indicates the precision of the test at various levels of the trait. 
             TIF evaluates how much information the entire test provides about the latent trait. High values of TIF indicate 
             high reliability and precision in measurement.",
           br(),
           br(),
           HTML("Both IIF and TIF produce standard errors depend on <strong>&theta;</strong> continuum. And, these errors can use to 
             evaluate the reliability of items or whole test."))
      } else if (input$theory_type == "Item Response Theory (IRT)" &&
                 input$study_type == "Reliability studies" &&
                 input$dimension_type_3 == "Multidimensional") {
         p(strong("MIIF"), " assesses the amount of information each item provides for each latent trait in a multidimensional 
            framework and analyzes how individual items contribute to measuring each of the multiple traits. This helps in 
            identifying which items are most informative for each dimension.",
           br(),
           br(),
           strong("MTIF"), " extends the concept of the Test Information Function to multidimensional data. It provides information 
             about how well the test measures each of the latent traits across different levels. MTIF evaluates the precision of 
             the test for each dimension. This helps in understanding how well the test measures multiple traits simultaneously.")
      } else if (input$theory_type == "Classical Test Theory (CTT)" && input$validity_type_1 == "Content validity") {
         p(strong("Content validity"), " refers to the extent to which a test or scale accurately represents the entire domain of 
             the construct it is intended to measure. It ensures that the items on the test are comprehensive and relevant to 
             the specific content area being assessed.",
           br(),
           br(),
           "Content validity is often assessed by subject matter experts who review the items to determine how well they represent 
             the content domain. Experts evaluate whether the items are relevant, clear, and representative of the construct.",
           br(),
           br(),
           strong("Content Validity Index (CVI):"), " Experts rate each item on relevance, and the proportion of experts agreeing 
             that an item is relevant is calculated. The I-CVI is typically considered acceptable if it is 0.70 or higher. 
             Aggregating these scores across items, giving an overall measure of content validity for the entire scale.",
           br(),
           br(),
           strong("Content Mapping:"), " This involves matching each item with the specific part of the content domain it is 
             intended to measure. This mapping can then be reviewed by experts to ensure all aspects of the domain are covered and 
             none are over- or under-represented.",
           br(),
           br(),
           strong("Q-Sort Method:"), " Experts categorize items into predefined categories that represent different aspects of 
             the construct. The degree of agreement among experts on these classifications provides evidence of content validity.")
      } else if (input$theory_type == "Item Response Theory (IRT)" && input$validity_type_1 == "Content validity") {
         p("You may check and see the brief explanations about the CTT based techniques by using the related inquiries on the menu.
             Additionaly, there are some other techniques specificaly in IRT context.",
           br(),
           br(),
           "While CTT primarily relies on total test scores and assumes that all items contribute equally to the construct 
             measurement, IRT provides a nuanced item-level analysis. This allows for a more detailed examination of how each item 
             contributes to measuring the construct across various levels of the trait and among different populations. 
             Here's how you can study content validity within the IRT framework.",
           br(),
           br(),
           strong("Item Characteristic Curves (ICCs):"), " Examine the ICCs for each item to assess how well the item discriminates 
             between different levels of the latent trait. Items should show appropriate probability patterns across trait levels, 
             indicating they function as intended.",
           br(),
           br(),
           strong("Item Parameter Estimates:"), " By considering difficulty (b-parameter for dichotomo models, tresholds or 
             step-difficulties for polytom models), ensure items cover a range of difficulties appropriate for the target 
             population. By considering discrimination (a-parameter), evaluate whether items effectively differentiate between 
             individuals with differing levels of the trait. By considering guessing (c-parameter) specificaly in multiple-choice 
             items, assess the likelihood of correct responses due to guessing.",
           HTML("In addition, you may consider the changes of these parameters over the <strong>&theta;-continuum</strong> "),
           br(),
           br(),
           strong("Item Fit Statistics:"), " Use fit indices (e.g., S-X², INFIT, OUTFIT) to determine how well each item conforms to 
             the expected IRT model. Poorly fitting items may not adequately represent the construct and might need revision or 
             removal.",
           br(),
           br(),
           strong("Test Information Function (TIF):"), " Assess the TIF to determine how much information the test provides across 
             different levels of the trait. A well-constructed test should provide ample information across the entire range of 
             the construct, indicating comprehensive content coverage.")
      } else if (input$theory_type == "Classical Test Theory (CTT)" && input$validity_type_1 == "Criterian-based validity") {
         p("Criterion-based validity in CTT involves examining how well the scale or test correlates with an external criterion. 
             Here’s how you can study it:",
           br(),
           br(),
           strong("Concurrent Validity:"), " Give your scale and an established criterion measure to the same group of participants 
             at the same time. Compute the correlation coefficient (e.g., Pearson’s r) between the scores on your test and 
             the criterion measure. A high correlation indicates good concurrent validity.",
           br(),
           br(),
           strong("Predictive Validity:"), "First, administer your test to participants. Follow up at a later time and collect data 
             on the criterion or outcome that you are interested in predicting. Compute the correlation between the test scores and 
             the future criterion data. A high correlation suggests good predictive validity.",
           br(),
           br(),
           "If the criterion involves multiple variables, use multiple regression analysis to determine how well your test scores 
             predict the criterion while controlling for other variables.",
           br(),
           br(),
           strong("Postdictive Validity"), " (if applicable): Give your test to participants.Use available past data or outcomes 
             related to the participants. Assess how well the test scores correlate with the past criterion data.",
           br(),
           br(),
           strong("Cross-Validation:"), " Test the criterion validity using different samples or time periods to ensure that 
             your findings are consistent and generalizable.")
      } else if (input$theory_type == "Item Response Theory (IRT)" && input$validity_type_1 == "Criterian-based validity") {
         p("Criterion-based validity in IRT involves assessing how well the latent trait estimated by the IRT model correlates with 
             external criteria. Here’s how you can study it:",
           br(),
           br(),
           strong("Concurrent Validity:"), " Administer a criterion measure at the same time as the IRT-based test. 
             Correlate the latent trait estimates from the IRT model with the scores from the criterion measure. 
             A strong correlation indicates good concurrent validity.",
           br(),
           br(),
           strong("Predictive Validity:"), " After administering the test, collect data on future outcomes or criteria.
             Correlate the latent trait estimates with the future criterion data to assess how well the IRT-based estimates 
             predict future outcomes.",
           br(),
           br(),
           strong("Model Fit and Diagnostics:"), " Ensure that your IRT model fits the data well. Poor fit can affect the validity 
             of the latent trait estimates and their relationship with external criteria.",
           br(),
           br(),
           strong("Test Information Function (TIF):"), " Review the TIF to determine if the test provides sufficient information 
             about the latent trait at the levels relevant to the criterion. High information at key trait levels supports 
             criterion validity.")
      } else if (input$theory_type == "Classical Test Theory (CTT)" && input$validity_type_1 == "Discriminative validity") {
         p("In CTT, discriminative validity refers to the extent to which a test or scale can distinguish between groups that 
             it theoretically should be able to distinguish. It assesses whether the test differentiates between individuals 
             based on the traits or constructs it intends to measure.",
           br(),
           br(),
           br(),
           strong("Group Comparison:"), 
           br(),
           "Discriminative validity is often examined by comparing the test scores of different groups that are expected 
             to differ on the construct being measured. For instance, comparing the scores of 50% lower group vs. 50% upper group 
             according to the total test scores.",
           br(),
           br(),
           "Techniques such as ", em("'ANOVA'"), " or ", em("'independent samples t-test'"), "are frequently used to compare 
             the means of different groups. If the test has good discriminative validity, significant differences in mean scores 
             between groups should be observed.",
           br(),
           br(),
           br(),
           strong("Correlation Analysis:"), 
           br(),
           "Another approach is to examine the correlation of the item scores with test scores. A moderate or higher correlations 
              provides evidence of discriminative validity in item level. In this context, you can consider different correlation 
              coefficients according to the type of items.",
           br(),
           br(),
           "- For dichotomous items, consider to use ", em("'Point-biserial correlation'"), " or ", em("'Biserial correlation'"),
           br(),
           br(),
           "- For polytomous items, consider to use ", em("'Polyserial correlation'"),
           br(),
           br(),
           br(),
           strong("Classification Accuracy:"), 
           br(),
           "You could use", em("'Discriminant Function Analysis'"), " to examine whether different groups 
             (e.g., high vs. low performers, clinical vs. non-clinical populations) score differently on your test. The analysis
             provides a discriminant function that maximizes the separation between the groups, which can be used as evidence of 
             discriminative validity. If the test scores effectively classify individuals into their correct groups 
             (with a high degree of accuracy), this would support the test's discriminative validity.",
           br(),
           br(),
           "As non-parametric model, you can use ", em("'Logistic Regression Analysis'"), " to predict group membership 
             (e.g., whether an individual belongs to Group A or Group B) based on their test scores. The odds ratios and 
             classification accuracy provide insight into how well the test differentiates between groups. 
             A significant logistic regression model with high classification accuracy would suggest that the test has good 
             discriminative validity, as it effectively distinguishes between different groups.",
           br(),
           br(),
           "Both DFA and logistic regression go beyond simple group comparisons (like t-tests or ANOVA) by allowing you to assess 
             the ability of the test to correctly classify individuals or predict group membership. These techniques can handle 
             multiple predictors simultaneously, giving a more nuanced understanding of how different aspects of the test 
             contribute to discriminative validity.")
      } else if (input$theory_type == "Item Response Theory (IRT)" && input$validity_type_1 == "Discriminative validity") {
         p("In IRT, discriminative validity refers to the ability of individual items on a test to distinguish between respondents 
             with different levels of the latent trait being measured.",
           br(),
           br(),
           strong("Item Discrimination Parameter (a-parameter):"), " In IRT, discriminative validity at the item level is often 
             assessed using the discrimination parameter (a-parameter). This parameter indicates how well an item can distinguish 
             between individuals with different levels of the underlying trait. High discrimination parameters suggest that 
             the items are good at distinguishing between different levels of the trait.",
           br(),
           br(),
           strong("Item Characteristic Curves (ICC):"), " These curves graphically show the probability of a correct response to 
             an item across levels of the latent trait. Steeper slopes indicate higher discrimination.",
           br(),
           br(),
           strong("Likelihood Ratio Tests:"), " These can be used to compare nested models to assess if adding discrimination 
             parameters significantly improves the model fit.")
      } else if (input$theory_type == "Classical Test Theory (CTT)" && input$validity_type_2 == "Structural validity") {
         p(strong("Principal Component Analysis (PCA)"), " is often one of the first methods used in structural validity studies. 
             PCA is a data reduction technique that transforms the original set of variables into a smaller set of uncorrelated 
             components. These components are linear combinations of the original variables and are ordered by the amount of 
             variance they explain in the data. In the context of structural validity, PCA helps identify the main dimensions or 
             components that account for the most variance in the items, which can provide insights into the possible underlying 
             structure of the test or scale.",
           br(),
           br(),
           strong("Exploratory Factor Analysis (EFA)"), " takes the analysis a step further by focusing on uncovering 
             the latent structure of the data. Unlike PCA, which simply reduces data, EFA is specifically designed to identify 
             underlying latent factors that explain the correlations among observed variables. In structural validity studies, 
             EFA is used to explore the number and nature of factors that best represent the data without imposing 
             a predefined structure. EFA provides factor loadings, which indicate the strength of the relationship between 
             each item and the latent factors, helping researchers understand how well the items group together to form 
             coherent factors that align with the theoretical construct.",
           br(),
           br(),
           strong("Confirmatory Factor Analysis (CFA)"), " is employed after EFA when there is a need to test a hypothesized factor 
             structure based on theory or prior research. CFA is used to confirm whether the data fits a predefined factor model 
             by estimating parameters and evaluating model fit indices. In structural validity studies, CFA is crucial for 
             validating the factor structure identified in EFA or proposed by theory, as it allows researchers to test specific 
             hypotheses about the number of factors, the items loading on each factor, and the relationships between factors.",
           br(),
           br(),
           "CFA provides fit indices such as RMSEA, CFI, and TLI, which indicate how well the proposed model fits the observed data, 
            thereby offering evidence for the structural validity of the test or scale.",
           br(),
           br(),
           strong("Multiple Correspondence Analysis (MCA)"), " is another technique used in the context of structural validity 
             studies, particularly when dealing with categorical data. MCA extends the principles of Correspondence Analysis 
             to situations where there are multiple categorical variables, making it well-suited for tests or scales composed of 
             items with nominal or ordinal responses.",
           br(),
           br(),
           "In structural validity studies, MCA helps to uncover the underlying dimensions that organize the relationships among 
             the categories of these variables. By representing both items and response categories in a low-dimensional space, 
             MCA allows researchers to visualize patterns of association and identify clusters of items that may reflect different 
             dimensions or factors within the test or scale. This visual and numerical representation provides insights into 
             whether the items are capturing the intended constructs and how they might group together, supporting or challenging 
             the hypothesized structure of the test.",
           br(),
           br(),
           strong("Categorical Principal Component Analysis (CATPCA)"), " is a specialized technique used in the context of 
             structural validity studies when the test or scale includes categorical data, such as ordinal or nominal items. 
             Unlike traditional PCA, which assumes continuous variables, CATPCA is designed to handle categorical data by 
             transforming these variables into quantifiable components.",
           br(),
           br(),
           "In structural validity studies, CATPCA is used to reduce the dimensionality of the data while preserving as much of 
             the variation as possible among the categorical variables. It identifies the main components or dimensions 
             underlying the categorical items and shows how these components relate to the items and their categories. 
             By doing so, CATPCA provides insights into the structure of the test or scale, helping researchers determine 
             whether the items align with the theoretical constructs they are intended to measure and whether they form 
             coherent dimensions. This makes CATPCA a valuable tool in validating the structural integrity of a test or scale, 
             particularly in situations where traditional methods like PCA or EFA may not be appropriate due to the nature of 
             the data.")
      } else if (input$theory_type == "Item Response Theory (IRT)" && input$validity_type_2 == "Structural validity") {
         p(strong("Item Fit Statistics"), " are used to assess how well individual test items conform to the expectations of 
             the IRT model being used. These statistics evaluate whether each item fits the model’s assumptions and 
             whether it behaves as expected in terms of its relationship with the latent trait being measured.",
           br(),
           br(),
           "Key fit statistics include:",
           br(),
           "- Infit and Outfit Mean Square (MNSQ)",
           br(),
           "- Item-Parameter Fit",
           br(),
           "- Chi-Square Tests between observed and expected frequencies",
           br(),
           br(),
           "These fit statistics help identify items that may not be contributing effectively to the measurement of the latent trait,
             which is crucial for ensuring that the test or scale is structurally valid and that it measures the intended construct 
             reliably.",
           br(),
           br(),
           br(),
           strong("Multidimensional Item Response Theory (MIRT)"), " extends traditional IRT by allowing for the possibility that 
             multiple latent traits or dimensions are being measured by a test. While standard IRT models assume a unidimensional 
            structure, MIRT acknowledges that many tests or scales are designed to measure multiple constructs simultaneously.",
           br(),
           br(),
           "MIRT contributes to structural validity by enabling researchers to identify and validate the number and nature of 
             dimensions within a test. It helps determine whether the data supports a multidimensional structure and provides 
             detailed insights into how items relate to each latent trait. By examining item loadings on different dimensions, 
             MIRT ensures that each item aligns well with the intended constructs and reveals any cross-dimensional loadings that 
             might indicate overlap between constructs.",
           br(),
           br(),
           "Additionally, MIRT provides fit indices and statistical tests to assess how well the proposed multidimensional model 
             fits the data, allowing for comparisons between different models to identify the most accurate representation of 
             the data. This process enhances measurement precision and ensures that the test accurately measures each dimension. 
             Overall, MIRT is a powerful tool for refining test instruments, improving their accuracy, and validating their 
             structural integrity.")
      } else if (input$theory_type == "Classical Test Theory (CTT)" && input$validity_type_2 == "Differential item functioning") {
         p("Differential Item Functioning (DIF) refers to a situation where an item on a test or questionnaire behaves 
             differently for distinct groups of respondents who have the same underlying ability or trait level. Essentially, 
             DIF indicates that the item might be unfair or biased because it favors one group over another, not due to differences 
             in ability but due to some other factor (e.g., cultural background, gender, or language). And, significant DIF 
             indicates validity issues.",
           br(),
           br(),
           strong("Angoff TID"), " is based on transforming item difficulties to a common scale and then comparing 
             these difficulties across groups. The technique primarily focuses on uniform DIF, where the difference in 
             item difficulty is consistent across all levels of ability. It assumes that the test is unidimensional and that 
             the item parameters are estimated accurately.",
           br(),
           br(),
           strong("Dorans Standardization"), " is a method that adjusts item scores by standardizing them across groups to account 
             for differences in group ability distributions. This technique can be used to detect uniform DIF. It assumes that 
             the groups being compared are equivalent in terms of the construct being measured and that any differences observed 
             are due to the item's differential functioning.",
           br(),
           br(),
           strong("Mantel-Haenszel Chi-Square"), " is a widely used statistical technique for detecting uniform DIF. It compares 
             the odds of different groups answering an item correctly, controlling for overall ability. This method is particularly 
             effective for detecting uniform DIF, where the effect is consistent across ability levels. It assumes that 
             the test scores are ordinal and that the comparison groups are equivalent in terms of the trait being measured.",
           br(),
           br(),
           strong("Logistic regression"), " is a versatile technique that can be used to detect both uniform and non-uniform DIF. 
             In this approach, the probability of a correct response is modeled as a function of group membership, ability, and 
             the interaction between group and ability. The presence of uniform DIF is indicated if the group membership 
             significantly predicts item response after controlling for ability. Non-uniform DIF is indicated if the interaction 
             term between group and ability is significant. This method assumes that the relationship between ability and 
             item response follows a logistic function.")
      } else if (input$theory_type == "Item Response Theory (IRT)" && input$validity_type_2 == "Differential item functioning") {
         p("In IRT context, Differential Item Functioning (DIF) occurs when the probability of a correct response to a test item 
             differs between groups of individuals who have the same underlying ability level. This means that an item may be easier 
             or harder for one group compared to another, not due to differences in ability but because the item functions 
             differently across groups.",
           br(),
           br(),
           strong("Lord Chi-Square"), " test compares item parameters (such as difficulty and discrimination) across groups using 
             a chi-square statistic. This test is primarily used for uniform DIF, where the difference in item functioning is 
             consistent across ability levels. It assumes that the IRT model being used fits the data well and that 
             the item parameters are estimated accurately for each group.",
           br(),
           br(),
           strong("Raju's Signed/Unsigned Area Tests"), " compares the area between item characteristic curves (ICCs) for 
             different groups to detect DIF. The signed area test accounts for the direction of the DIF (indicating whether 
             the item favors one group over another), while the unsigned area test focuses only on the magnitude of DIF without 
             considering its direction. This method can detect both uniform and non-uniform DIF. It assumes that the IRT model used 
             fits the data well and that the item characteristic curves accurately reflect the relationship between ability and 
             item response.",
           br(),
           br(),
           strong("SIBTEST (Simultaneous Item Bias Test)"), " is a non-parametric method used to detect DIF. It estimates 
             the difference in probabilities of a correct response between groups at matched ability levels, focusing primarily on 
             uniform DIF. SIBTEST is particularly useful when the assumption of normality in ability distribution does not hold, 
             and it can be adapted to detect non-uniform DIF through extensions like Crossing SIBTEST. It assumes that the matching 
             variable accurately represents the underlying ability and that the groups being compared are equivalent in terms of 
             that ability.",
           br(),
           br(),
           strong("TSW-Likelihood Ratio Test"), " is a two-step method used in the IRT framework to detect both uniform and 
             non-uniform DIF. In the first step, it estimates item parameters separately for each group. In the second step, 
             it uses a likelihood ratio test to compare a constrained model (where item parameters are equal across groups) to 
             an unconstrained model (where item parameters are allowed to differ). This method is highly flexible and can detect 
             both types of DIF. It assumes that the IRT model fits the data well and that the likelihood ratio test is 
             appropriate for the model being used.")
      } else if (input$theory_type == "Classical Test Theory (CTT)" && input$validity_type_2 == "Test equating") {
         p("In CTT, test equating involves adjusting scores from different test forms so that they are comparable. This is typically 
             achieved through methods that align the distributions of scores from different forms, such as linear transformation, 
             or equipercentile equating.",
           br(),
           br(),  
           "- ", em("Horizontal Equating"), " refers to equating different forms of a test administered at the same level or grade. 
             The goal is to ensure that scores from different test forms, which are designed to be parallel, are comparable. 
             Techniques such as linear transformation and equipercentile equating are commonly used.",
           br(),
           br(),  
           "- ", em("Vertical Equating"), " involves equating tests administered at different levels or grades, such as elementary 
             versus high school tests. The aim is to ensure that scores from different levels are comparable and reflect 
             the same construct. This often requires additional adjustments to account for differences in difficulty and 
             construct representation across levels.",
           br(),
           br(),  
           strong("Linear Transformation"), " involves applying a linear transformation to scores from different 
             test forms to make them comparable. Typically, this involves adjusting the mean and standard deviation of scores so 
             that they align with a common scale.",
           br(),
           br(),  
           strong("Equipercentile Equating"), " equates test scores by matching percentiles (or quantiles) from 
             different test forms. It involves creating an equivalency between scores at each percentile rank from the different 
             forms, ensuring that scores corresponding to the same percentile rank are comparable.",
           br(),
           br(),  
           strong("Polynomial Equating"), " involves fitting a polynomial function to the relationship between scores on different 
             test forms. This method is useful for capturing more complex relationships between test forms and adjusting scores 
             accordingly.")
      } else if (input$theory_type == "Item Response Theory (IRT)" && input$validity_type_2 == "Test equating") {
         p("In IRT, test equating involves aligning item parameters (difficulty and discrimination) and ability estimates across 
             different test forms so that scores can be compared on a common scale. This is done using methods that account for 
             the item response functions and can include techniques such as item parameter scaling, linking through anchor items, 
             and multi-group modeling.",
           br(),
           br(),  
           "- ", em("Horizontal Equating"), " refers to equating different forms of a test administered at the same level or grade. 
             The focus is on aligning item parameters and ability estimates between forms to ensure that scores are comparable. 
             Techniques like item parameter scaling and linking through anchor items are used.",
           br(),
           br(),  
           "- ", em("Vertical Equating"), " involves equating tests administered at different levels or grades. The goal is 
             to ensure comparability between scores from different levels, often requiring adjustments for differences in 
             item difficulty and construct representation across levels. Methods such as multi-group modeling and linking through 
             common items can be adapted for this purpose.",
           br(),
           br(),  
           strong("Stocking and Lord Method"), " involves linking item parameters from different test forms using a common metric. 
             The technique uses item parameter estimates and their standard errors to create a transformation that adjusts scores 
             from different test forms to a common scale.",
           br(),
           br(),  
           strong("Lord's Method"), " as an extension of the Stocking and Lord method, involves a series of transformations 
             to align item parameters across different test forms. It uses item characteristic curves (ICCs) to adjust for 
             differences in item difficulty and discrimination.",
           br(),
           br(),  
           strong("Haebara Method"), " involves equating item parameters by adjusting for differences in test difficulty and 
             discrimination across test forms. It uses a common set of anchor items to calibrate and align item parameters.",
           br(),
           br(),  
           strong("Holland and Rubin Method"), " involves using the item parameters from a reference test form to link with 
             the item parameters of a target test form. It adjusts for differences in test forms by aligning their item response 
             functions using a set of common items.",
           br(),
           br(),  
           em("All these techniques are appropriate for horizontal equating and linking. They can be used for vertical equating 
             if test forms are designed for different levels, but additional adjustments might be needed to account for 
             differences in item difficulty across levels."))
      } else if (input$theory_type == "Classical Test Theory (CTT)" && input$validity_type_2 == "Measurement invariance") {
         p("Measurement Invariance refers to the concept that a test measures the same construct equally well across 
             different groups or conditions. In CTT, this involves ensuring that the item parameters, such as item difficulty, and 
             the interpretation of scores are consistent across groups. This typically means that the test's reliability and 
             validity are comparable for different groups.",
           br(),
           br(), 
           br(),  
           strong("Multigroup CFA"), " is used to test whether the factor structure of a test is equivalent across different groups. 
             It involves specifying a factor model and then testing whether the model parameters (e.g., factor loadings, 
             item intercepts) are equivalent across groups.",
           br(),
           br(), 
           "The application of measurement invariance involves hierarchical steps:",
           br(),
           br(), 
           em("Configural Invariance:"), " Tests whether the same factor structure (e.g., number of factors and pattern of 
             loadings) holds across groups.",
           br(),
           br(), 
           em("Metric Invariance"), " (or Weak Invariance): Tests whether factor loadings are equivalent across groups, 
             ensuring that the relationship between items and factors is consistent.",
           br(),
           br(), 
           em("Scalar Invariance"), " (or Strong Invariance): Tests whether item intercepts are equivalent across groups, 
             ensuring that the items have the same meaning and level of difficulty.",
           br(),
           br(), 
           em("Strict Invariance:"), " Tests whether item residuals (errors) are equivalent across groups, ensuring that 
             measurement errors are consistent.",
           br(),
           br(), 
           br(), 
           strong("DIF Analysis"), " is another way to examine measurement invariance, especially at the item level. In CTT, 
             there are some DIF techniques that can be used:",
           br(), 
           HTML("- Angoff &Delta;<br>
                 - Dorans Standardization<br>
                 - Mantel-Haenszel <i>&chi;<sup>2</sup></i><br>
                 - Logistic Regression"),
           br(),
           br(),
           em("To see the detailed explanations about these techniques, you may consider to select the 'DIF' option located under 
             the 'construct validity studies' on the menu."))
      } else if (input$theory_type == "Item Response Theory (IRT)" && input$validity_type_2 == "Measurement invariance") {
         p(strong("Multi-Group IRT Modeling"), " involves estimating item parameters, such as difficulty or discrimination, and 
             ability estimates simultaneously across multiple groups. This technique tests whether item parameters are equivalent 
             across groups and whether the underlying ability estimates are comparable.",
           br(),
           br(),
           "Multigroup IRT models include some sub-studies or sub-models:",
           br(),
           br(),
           em(strong("Model canstraint:")), " This involves specifying that item parameters (such as difficulty and discrimination) are  
             the same across groups. By comparing models with and without these constraints, you can assess whether measurement 
             invariance holds.",
           br(),
           br(),
           em(strong("DIF Analysis:")), " This includes various methods to detect DIF, such as:",
           br(),
           br(),
           em("- Item Parameter Drift:"), " Examines if item parameters differ significantly between groups.",
           br(),
           br(),
           em("- IRT-Based DIF Methods:"), " Techniques like the Raju signed/unsigned area test and the SIBTEST, which assess 
             if items function differently across groups.",
           br(),
           br(),
           em("- IRT Calibration:"), " Involves simultaneous calibration of items across groups using common items or anchor items 
             to ensure comparability.")
      } else {
        p("Please complete the related inquiries to get a brief explanation.")
      }

    } else {
      p("Please select a module to see brief explanations.")
    }

  })

  # Update the button text based on the mode
  output$toggle_text <- renderText({
    if (mode() == "horizontal") {
      "Switch to MOBILE MODE                                             "
    } else {
      "Switch to COMPUTER MODE                                             "
    }
  })
}

shinyApp(ui = ui, server = server)
