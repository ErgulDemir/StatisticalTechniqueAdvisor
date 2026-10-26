# Statistical Technique Advisor (STA)

The Statistical Technique Advisor (STA) is an interactive R Shiny application that helps researchers and students find appropriate statistical techniques for their research. It covers more than 200 techniques in ten modules and is available in English and Turkish.

The user first chooses a module according to the purpose of the analysis. STA then asks short follow-up questions about the design and the data, shows only the questions that apply, and suggests suitable techniques with brief explanations. The whole decision path stays visible on one screen.

## Live application

- Main page, https://erguldemir.shinyapps.io/StatisticalTechniqueAdvisor/
- English version, https://erguldemir.shinyapps.io/StatisticalTechniqueAdvisor_v33_eng/
- Turkish version, https://erguldemir.shinyapps.io/StatisticalTechniqueAdvisor_v33_tr/

## Modules

1. Analyzing the text documents
2. Checking the basic assumptions
3. Comparison of independent groups
4. Testing the effects in an experimental design
5. Analyzing the longitudinal data or repeated measurements
6. Relationships between variables
7. Predicting outcomes or group membership
8. Data reduction
9. Scaling and rescaling
10. Item and test statistics

## Repository contents

| Folder | Content |
|---|---|
| `main/` | The main page that introduces STA and lists the reference sources for each module |
| `english/` | The English version of the application |
| `turkish/` | The Turkish version of the application |
| `flowcharts/` | The flowcharts behind the ten modules |

## Running STA on your own computer

Install R and the required packages, then run any of the three applications from the repository folder.

```r
install.packages(c("shiny", "shinyjs"))

shiny::runApp("english")   # English version
shiny::runApp("turkish")   # Turkish version
shiny::runApp("main")      # Main page
```

If an application uses further packages, they are listed at the top of its `app.R` file.

## Citation

If you use STA in your work, please cite it as

Demir, E. (2024). *Statistical Technique Advisor* (Version 3.3) [Computer software]. https://github.com/erguldemir/StatisticalTechniqueAdvisor

A journal article describing the design and evaluation of STA is in preparation.

## Funding

Part of this application was developed with the support of the Scientific and Technological Research Council of Türkiye (TÜBİTAK) under Project No. 223K382.

## License

This project is released under the MIT License. See the `LICENSE` file for details.
