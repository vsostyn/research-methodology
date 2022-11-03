#dataframe
df <- waarden.frame

# PSI to pascal
druk_pascal <- as.numeric(waarden$PSI)*6894


#packages installeren
install.packages("ggplot2")
install.packages("dplyr")
install.packages(c("ggpubr", "tidyverse", "broom", "AICcmodavg"))

#bibliotheek openen
library(ggplot2)
library(dplyr)

library(ggpubr)
library(tidyverse)
library(broom)
library(AICcmodavg)

#groeperen
driehoek <- waarden[1:3,1:2]
cirkel <- waarden[4:6,1:2]
rechthoek <- waarden[7:8,1:2]

#gemiddelde en standaard deviatie
gemiddelde_c <- mean(as.numeric(cirkel$PSI)*6894)
gemiddelde_d <- mean(as.numeric(driehoek$PSI)*6894)
gemiddelde_r <- mean(as.numeric(rechthoek$PSI)*6894)

#one way ANOVA test
one.way <- aov(waarden$...3 ~ waarden$PSI, data = df)

#graph
boxplot(as.numeric(druk_pascal) ~ waarden$...3,data=waarden,
        col=(c("red","blue")),
        main="druk in Pa", xlab="Categorie")
