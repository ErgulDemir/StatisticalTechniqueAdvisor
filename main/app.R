library(shiny)
library(shinyjs)  # Add shinyjs for JavaScript functionality

ui <- fluidPage(
  
  useShinyjs(),  # Initialize shinyjs
  
  # Title Section with
  fluidRow(
    column(
      width = 12,  # Full width, same as other content sections
      div(
        style = "background-color: #001f3d; color: white; text-align: center; padding: 20px; margin-bottom: 20px;",  # Added margin-bottom for spacing
        
        # Title section
        hr(),
        h1(
          span("Statistical Technique Advisor", style = "font-size: 30px;"),
          style = "margin-bottom: 0px;"
        ),
        h2(
          span(em("- İstatistiksel Teknik Tanımlayıcısı -"), style = "font-size: 24px;"),
          style = "margin-bottom: 0px;"
        ),
        br(),
        h4(
          span("Designed and coded by Ergül Demir, ORCID: ", style = "color: #ddd; font-size: 16px;"),
          tags$a(href = "https://orcid.org/0000-0002-3708-8013", "0000-0002-3708-8013", target = "_blank"),
          style = "margin-bottom: 0px; font-size: 16px;"
        ),
        h4(
          span("© November 2024, version: STA-3.3", style = "font-size: 16px;"),
          style = "margin-bottom: 0px;"
        ),
        hr()
      )
    )
  ),
  
  # First panel: About This App
  fluidRow(
    column(
      width = 12,  # Full width, same as the title section

      div(
        style = "text-align: center; margin-top: 0px; margin-bottom: 20px;",
        actionButton("eng_app", "Go to English version", class = "btn-primary btn-lg", style = "width: 200px;"),
        actionButton("tr_app", "Türkçe sürüme git", class = "btn-success btn-lg", style = "width: 200px; margin-left: 10px;"),
        tags$style(HTML("
          @media (max-width: 600px) {
            .btn-lg {
              margin-bottom: 10px;  /* Add margin between buttons on small screens */
            }
          }
        "))
      ),

      div(
        style = "background-color: #f8f9fa; border: 1px solid #ddd; padding: 20px; margin-bottom: 20px;",
        h2("About This App", style = "color: #2c3e50; text-align: center; font-size: 24px;"),
        p(
          "This application includes over 200 statistical techniques and is designed to empower academic researchers by providing tailored recommendations that align with their research goals and data structures. Whether users are seasoned analysts or novice researchers, the app offers a practical and systematic way to explore potential techniques. While some terminological context may be unfamiliar, the app serves as a valuable starting point for identifying methods worth considering.",
          style = "font-size: 16px; text-align: justify;"
        ),

        p(
          "The app is organized into four main sections:",
          style = "font-size: 16px; text-align: justify;"
        ),

        tags$ul(
          style = "font-size: 16px; text-align: justify; margin-left: 20px;",
          tags$li("Purpose-Based Modules: Start with 10 modules to define what you want to analyze."),
          tags$li("Follow-Up Inquiries: Answer additional questions about your study’s design or data to refine the suggestions."),
          tags$li("Recommendations: Get a list of techniques that fit your needs."),
          tags$li("Brief Explanations: Learn the basics of the recommended techniques.")
        ),

        p(
          "Some statistical knowledge is helpful for using the app, as users may encounter new                         terms. Nevertheless, it is designed to guide them toward possible techniques and help them get started. For more information on these statistical methods, you may check out the resources provided in the section below.",
          style = "font-size: 16px; text-align: justify;"
        ),

        h2(
          em("Click the button at the top of the page to access the app."),
          style = "font-size: 16px; text-align: justify;"
        ),

        h2("Bu Uygulama Hakkında", style = "color: #2c3e50; text-align: center; font-size: 24px;"),
        p(
          "Bu uygulama, akademik araştırmacılara, ihtiyaç duydukları istatistiksel tekniği belirlemede, veri analizi yürütme amaçları ve veri yapılarıyla uyumlu öneriler sunarak onlara rehberlik etmek için geliştirilmiştir ve 200'den fazla istatistiksel tekniği içermektedir.İster deneyimli bir analist ister yeni başlayan bir araştırmacı olun, bu uygulama potansiyel teknikleri keşfetmek için pratik ve sistematik bir yol sunar. Bazı terimlerin yabancı gelebileceği durumlar olsa da uygulama, kullanılabilecek olası yöntemleri belirlemek için bir başlangıç noktası sağlayabilir.",
  style = "font-size: 16px; text-align: justify;"
        ),

        p(
          "Bu uygulama dört ana bölüm ve aşama içermektedir:",
          style = "font-size: 16px; text-align: justify;"
        ),

        tags$ul(
          style = "font-size: 16px; text-align: justify; margin-left: 20px;",
          tags$li("Amaç Temelli Modüller: Veri analizi amacına göre düzenlenmiş 10 modül içermektedir."),
          tags$li("Devam Sorgulamaları: Analiz deseni veya veri yapısı hakkında ek soruları içeren bir devam bölümüdür."),
          tags$li("Öneriler: İlk iki bölümde sağlanan girdilere uygun olarak uygun istatistiksel teknik önerilerinin listelendiği bölümdür."),
          tags$li("Kısa Açıklamalar: Önerilen tekniklere yönelik kısa açıklamaların verildiği bölümdür.")
        ),

        p(
          "Bu uygulamayı kullanmak için biraz istatistiksel bilgi faydalı olabilir, çünkü bazı         terimlerle ilk kez karşılaşabilirsiniz. Yine de, bu uygulama sizi olası tekniklere yönlendirmek ve başlamanıza yardımcı olmak için tasarlanmıştır. Bu istatistiksel yöntemler hakkında daha fazla bilgi edinmek için aşağıdaki bölümde sunulan kaynaklara göz atabilirsiniz.",
          style = "font-size: 16px; text-align: justify;"
        ),

        h2(
          em("Uygulamayı başlatmak için sayfa başında verilen sekmeye tıklayınız."),
          style = "font-size: 16px; text-align: justify;"
        )

      )
    )
  ),
  
  # Second panel: Resources
  fluidRow(
    column(
      width = 12,  # Full width, same as the title section
      div(
        style = "background-color: #f8f9fa; border: 1px solid #ddd; padding: 20px; margin-bottom: 20px;",
        h2("Resources | Kaynaklar", style = "color: #2c3e50; text-align: center; font-size: 24px;"),
        
        # Resources for Module 1
        h3("Module 1 | Modül 1", style = "color: #34495e; font-size: 20px;"),
        p("1. Agresti, Alan (2002). ", em("Categorical Data Analysis"), " (2nd ed.). Hoboken, NJ: Wiley."),
        p("2. Benchimol, Jonathan; Kazinnik, Sophia; Saadon, Yossi (2022). ", em("Text mining methodologies with R: An application to central bank texts."), " Machine Learning with Applications, 8: 100286."),
        p("3. Braun, Virginia; Clarke, Victoria (2006). Using thematic analysis in psychology. ", em("Qualitative Research in Psychology"), ", 3 (2): 77–101."),
        p("4. Creswell, John (1994). ", em("Research Design: Qualitative & Quantitative Approaches."), " Thousand Oaks, CA: Sage Publications, Inc."),
        p("5. Guest, Greg; MacQueen, Kathleen; Namey, Emily (2012). ", em("Applied thematic analysis."), " Thousand Oaks, California: SAGE Publications."),
        p("6. Krippendorff, Klaus (2004). ", em("Content Analysis: An Introduction to Its Methodology"), " (2nd ed.). Thousand Oaks, CA: Sage."),
        p("7. Weber, Robert Philip (1990). ", em("Basic Content Analysis"), " (2nd ed.). Newbury Park, CA: Sage."),
        
        # Resources for Module 2
        h3("Module 2 | Modül 2", style = "color: #34495e; font-size: 20px;"),
        p("1. Field, A. (2019). ", em("Discovering statistics using IBM SPSS statistics"), " (5th ed.). SAGE Publications."),
        p("2. Fligner, M. A. and Killeen, T. J. (1976). Distribution-free two-sample tests for scale source. ", em("Journal of the American Statistical Association"), ", 71, 210-213."),
        p("3. Grubbs, F. E. (1949). Sample criteria for testing outlying observations. ProQuest Dissertations & Theses Global. (301807977). The University of Michigan."),
        p("4. Hair, J. F., Black, W. C., Babin, B. J., & Anderson, R. E. (2019). ", em("Multivariate data analysis"), " (8th ed.). Cengage Learning."),
        p("5. Newman, D. A. (2014). Missing data: Five practical guidelines. ", em("Organizational Research Methods"), ", 17(4), 372-411."),
        p("6. Tabachnick, B. G. & Fidell, L. S. (2019). ", em("Using multivariate statistics"), " (7th ed.). Pearson Education."),
        
        # Resources for Module 3
        h3("Module 3 | Modül 3", style = "color: #34495e; font-size: 20px;"),
        p("1. Anderson, M. J. (2001). A new method for non-parametric multivariate analysis of variance. ", em("Austral Ecology"), ", 26, 32-46."),
        p("2. Anderson, M. J. (2017). ", em("Permutational multivariate analysis of variance (PERMANOVA)."), " In Wiley StatsRef: Statistics Reference Online."),
        p("3. Conover, W. J. (1999). ", em("Practical Nonparametric Statistics"), " (3rd ed.). John Wiley & Sons."),
        p("4. Field, A. (2019). ", em("Discovering Statistics Using IBM SPSS Statistics"), " (5th ed.). SAGE Publications."),
        p("5. Jones, E., Harden, S., & Crawley, M. J. (2023). ", em("The R Book"), " (3rd ed.). John Wiley & Sons Ltd."),
        p("6. Manly, B. F. J. (2007). ", em("Randomization, Bootstrap and Monte Carlo Methods in Biology"), " (3rd ed.). Chapman & Hall/CRC."),
        p("7. Rutherford, A. (2001). ", em("Introducing ANOVA and ANCOVA: A GLM Approach."), " SAGE Publications."),
        
        # Resources for Module 4
        h3("Module 4 | Modül 4", style = "color: #34495e; font-size: 20px;"),
        p("1. Field, A. (2019). ", em("Discovering statistics using IBM SPSS statistics"), " (5th ed.). SAGE Publications."),
        p("2. Tabachnick, B. G. & Fidell, L. S. (2019). ", em("Using multivariate statistics"), " (7th ed.). Pearson Education."),
        
        # Resources for Module 5
        h3("Module 5 | Modül 5", style = "color: #34495e; font-size: 20px;"),
        p("1. Agresti, A. (2002). ", em("Categorical data analysis"), " (2nd ed.). Wiley."),
        p("2. Asparouhov, T., Hamaker, E. L., & Muthén, B. (2017). Dynamic structural equation models. ", em("Structural Equation Modeling: A Multidisciplinary Journal"), ", 25(3), 359–388."),
        p("3. Hoffman, L. (2017). ", em("Longitudinal analysis: Modeling within-person fluctuation and change."), " Routledge."),
        p("4. Kline, R. B. (2016). ", em("Principles and practice of structural equation modeling"), " (4th ed.). Guilford Press."),
        p("5. Preacher, K. J., Wichman, A. L., MacCallum, R. C., and Briggs, N. E.  (2008). ", em("Latent Growth Curve Modeling."), " SAGE Publications."),
        p("6. Maxwell, S. E., Delaney, H. D., and Kelley, K. (2017). ", em("Designing experiments and analyzing data: A model comparison perspective"), " (3rd ed.). Routledge."),
        p("7. McArdle, J. J. and Nesselroade, J. R. (2014). ", em("Longitudinal data analysis using structural equation models."), " APA."),
        p("8. Tabachnick, B. G. & Fidell, L. S. (2019). ", em("Using multivariate statistics"), " (7th ed.). Pearson Education."),
        p("9. Twisk, J. W. R. (2019). ", em("Applied mixed model analysis: A practical guide."), " Cambridge University Press"),

        # Resources for Module 6
        h3("Module 6 | Modül 6", style = "color: #34495e; font-size: 20px;"),
        p("1. Carroll, J. B. (1961). The nature of the data, or how to choose a correlation coefficient. ", em("Psychometrika"), ", 26, 347–372."),
        p("2. Clauser, J. C. and Hambleton, R. K. (2018). Item analysis for classroom assessments in higher education. In C. Secolsky and D. B. Denison (Eds.), ", em("Handbook on measurement, assessment, and evaluation in higher education"), " (2nd ed., pp. 484-503). Routledge."),
        p("3. Howell, D. C. (2013). ", em("Statistical methods for psychology"), " (8th ed.). Wadsworth, Cengage Learning."),
        p("4. Olsson, U., Drasgow, F. & Dorans, N. J. (1982). The polyserial correlation coefficient. ", em("Psychometrika"), ", 47, 337–347."),
        p("5. Rodgers J. L., and Nicewander W. A. (1988). Thirteen ways to look at the correlation coefficient. ", em("The American Statistician"), ", 42(1), 59-66."), 
        
        # Resources for Module 7
        h3("Module 7 | Modül 7", style = "color: #34495e; font-size: 20px;"),
        p("1. Agresti, A. (2019). ", em("An introduction to categorical data analysis"), " (3rd ed.). John Wiley & Sons, Inc."),
        p("2. Cohen, J., Cohen, P., West, S. G., and Aiken, L. (2003). ", em("Applied multiple regression/correlation analysis for the behavioral sciences"), " (3rd ed.). Lawrence Erlbaum Associates, Inc."),
        p("3. Garson, G. D. (2014). ", em("Logistic regression: Binary and multinomial."), " David Garson and Statistical Associates Publishing."),
        p("4. Gauvreau, K., and Pagano, M. (1997). The analysis of correlated binary outcomes using multivariate logistic regression. ", em("Biometrical Journal"), ", 39(3), 309-325."),
        p("5. Pedhazur, E. J. (1997). ", em("Multiple regression in behavioral research explanation and prediction"), " (3rd ed.). Thomson Learning."),
        p("6. Raudenbush, S. W., and Bryk, A. S. (2002). ", em("Hierarchical linear models: Applications and data analysis methods"), " (2nd ed.). Sage."),
        p("7. Steinwart, I., and Christmann, A. (2008). ", em("Support vector machines."), " Springer Science+Business Media, LLC."),
        p("8. Sullivan, S. (2017). ", em("Machine learning for beginners guide algorithms: Decision tree & random forest introduction."), " Healthy Pragmatic Solutions Inc."),
   
        # Resources for Module 8
        h3("Module 8 | Modül 8", style = "color: #34495e; font-size: 20px;"),
        p("1. Borg, I., Groenen, P. J. F. and Mair, P. (2013). ", em("Applied multidimensional scaling."), " Springer."),
        p("2. Conti, G.,  Frühwirth-Schnatter, S., Heckman, J. J., and Piatek, R. (2014). Bayesian exploratory factor analysis. ", em("Journal of Econometrics"), ", 183(1), 31-57."),
        p("3. Everitt, B. S., and Dunn, G. (2001). ", em("Applied multivariate data analysis (2nd ed.)."), " John Wiley & Sons, Ltd."),
        p("4. Hubert, M., Rousseeuw, P. J., and Vanden-Branden, K. (2005), ROBPCA: A new approach to robust principal components analysis, ", em("Technometrics"), ", 47, 64–79."),
        p("5. Linting, M., and van der Kooij, A. (2011). Nonlinear principal components analysis with CATPCA: A tutorial. ", em("Journal of Personality Assessment"), ", 94(1), 12–25."),
        p("6. Pison, G., Rousseeuw, P. J., Filzmoser, P. and Croux, C. (2003). Robust factor analysis. ", em("Journal of Multivariate Analysis"), ", 84(1), 145-172."),
        p("7. Savalei, V. (2021). Improving fit indices in structural equation modeling with categorical data. ", em("Multivariate Behavioral Research"), ", 56(3), 390-407."),
        p("8. Taylor, J. M. (2019). Overview and illustration of bayesian confirmatory factor analysis with ordinal indicators. ", em("Practical Assessment, Research & Evaluation"), ", 24(4), 1-27."),
        
        # Resources for Module 9
        h3("Module 9 | Modül 9", style = "color: #34495e; font-size: 20px;"),
        p("1. Edwards, A. L. (1957). ", em("Techniques of attitude scale construction."), " Appleton-Century-Crofts, Inc."),
        p("2. Dunn-Rankin, P., Knezek, G. A., Wallace, S. R., and Zhang, S. (2004). ", em("Scaling methods."), " Lawrence Erlbaum Associates."),
        p("3. Guilford, J. P. (1955). ", em("Psychometric methods"), " (2nd ed.). McGraw Hill Company."),

        # Resources for Module 10
        h3("Module 10 | Modül 10", style = "color: #34495e; font-size: 20px;"),
        p("1. Crocker, L., & Algina, J. (2008). ", em("Introduction to classical and modern test theory."), " Cengage Learning."),
        p("2. Polit, D. F., Beck, C. T., and Owen, S. V. (2007). The content validity index: Are you sure you know what's being reported? Critique and recommendations. ", em("Research in Nursing & Health"), ", 30, 459–467"),
        p("3. Gwet, K. L. (2014). ", em("Handbook of inter-rater reliability: The definitive guide to measuring the extent of agreement among raters"), " (4th ed.). Advanced Analytics, LLC."),
        p("4. Hambleton, R. K. and Swaminathan, H. (1985). ", em("Item response theory principles and applications."), " Springer Science+Business Media, LLC."),
        p("5. Holland, P. W. and Wainer, H. (1993). ", em("Differential item functioning."), " Lawrence Erlbaum Associates, Inc."),
        p("6. Meyer, P. (2010). ", em("Understanding measurement: Reliability."), " Oxford Academic."),
        p("7. Osterlind, S. J. (1983). ", em("Test item bias."), " Sage Publications, Inc."),
        p("8. Rosas, S. R. and Ridings, J. W. (2017). The use of concept mapping in measurement development and evaluation: Application and future directions. ", em("Evaluation and Program Planning"), ", 60, 265-276."),
        p("9. von Davier, A. A. (2011). ", em("Statistical models for test equating, scaling, and linking."), " Springer."),
        p("10. Valenta, A. L., Wigger, U. (1997) Q-methodology: Definition and application in health care informatics. ", em("Journal of the American Medical Informatics Association"), ", 4(6), 501-10.")

      )
    )
  ),
  
  # Logo Section
  fluidRow(
    column(
      width = 12,  # Full width for logo section
      div(
        style = "background-color: #f8f9fa; padding: 10px; margin-bottom: 0px; text-align:   center;",  # Added text-align: center to center the logo
        tags$img(src = "STA_Logo_new.jpg", height = "150px", style = "display: inline-block;")  #   Use display: inline-block to center the logo
      )
    )
  ),

  
  # Bottom Explanation
  div(
    style = "width: 100%; text-align: center; background-color: #f8f9fa; padding: 10px; font-size: 14px;",
    p("Part of this application was developed with the support of TÜBİTAK Project number 223K382"),
    p("Bu uygulamanın bir kısmı 223K382 numaralı TÜBİTAK Projesi desteğiyle geliştirilmiştir.")

  )

)

server <- function(input, output, session) {
  # Redirect to specific URLs when buttons are clicked
  observeEvent(input$eng_app, {
    runjs("window.open('https://erguldemir.shinyapps.io/StatisticalTechniqueAdvisor_v33_eng/', '_blank');")  # Replace with the English URL
  })
  
  observeEvent(input$tr_app, {
    runjs("window.open('https://erguldemir.shinyapps.io/StatisticalTechniqueAdvisor_v33_tr/', '_blank');")  # Replace with the Turkish URL
  })
}

shinyApp(ui, server)