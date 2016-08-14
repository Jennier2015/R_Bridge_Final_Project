
# Brief description of the assigned dataset: this data is from a case-control study of esophageal cancer

require(stats)
require(graphics)
install.packages("ggplot2")
require(ggplot2)

head(esoph)
is.vector(esoph)
# View(esoph)

# get to know the dataset about colums and rows
nrow(esoph)
ncol(esoph)

# Giving Descriptive Names to the Columns

colnames(esoph) <- c("AgeGroup", "AlcoholConsumption", "TobaccoConsumption", "Numberofcases", "Numberofcontrols")
head(esoph)

# Exploratory Data Analysis Questions 1: What age groupd have the highest risks for esophageal cancer? 
# Age Group and Number of Cases
X <- subset(esoph, select = c("AgeGroup", "Numberofcases"))
#View(X)
head(X)
plot(X, main = "Esophageal cancer risks by age group")

# Exploratory Data Analysis Questions 2: Which alcohol consumption range cause higher risks for esophageal cancer?
Y <- subset(esoph, select = c("AlcoholConsumption", "TobaccoConsumption", "Numberofcases"))
head(Y)
heights <- tapply(Y$`Number of cases`, Y$`Alcohol Consumption`, mean)
barplot(heights)
barplot(heights, main = "Mean number of cases by alcohol consumption", 
        names.arg = c("0-39 g/day", "40-79 g/day", "80-119 g/day", "120+ g/day"),
        ylab = "Number of cases")

# Exploratory Data Analysis Questions 3: Which Tobacco Consumption range cause higher risks for esophageal cancer?
heights2 <- tapply(Y$`Number of cases`, Y$`Tobacco Consumption`, mean)
barplot(heights2)
barplot(heights2, main = "Mean number of cases by tobacco consumption",
        names.arg = c("0-9 g/day", "10-19 g/day", "20-29 g/day", "30+ g/day"),
        ylab = "Number of cases")
# conclusion 1: Age groupd from 55-64 have the higher number of cases for esophageal cancer.
# Conclusion 2: Alcohol Consumption from 40-79 g/day has the highest average number of cases for esophageal cancer
# Conclusion 3: Tobacco Consumption from 0-9 g/day has the highest average number of cases for esophageal cancer.
