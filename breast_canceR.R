#dataset
breast_cancer_clinical_data <- read.csv("clinical_data_breast_cancer.csv")
View(breast_cancer_clinical_data)
install.packages("tidyverse")
library(tidyverse)
install.packages("ggplot2")
library(ggplot2)
head(breast_cancer_clinical_data)
colnames(breast_cancer_clinical_data)
ggplot(data=breast_cancer_clinical_data, mapping=aes(x=Age.at.Initial.Pathologic.Diagnosis, y=Complete.TCGA.ID)) +
         geom_point()

br <- ggplot(data=breast_cancer_clinical_data, mapping=aes(x=AJCC.Stage)) +
  geom_bar()
br + theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
                   
save.image()

ggplot(data=breast_cancer_clinical_data, mapping=aes(x=Age.at.Initial.Pathologic.Diagnosis)) + 
         geom_bar()

ggplot(data=breast_cancer_clinical_data, mapping=aes(fill="condition", x=ER.Status, y=Tumor)) + 
  geom_bar(position="dodge", stat="identity")

library(dplyr)


nrow(breast_cancer_clinical_data[breast_cancer_clinical_data$ER.Status=="Positive" & breast_cancer_clinical_data$PR.Status=="Positive" & breast_cancer_clinical_data$HER2.Final.Status=="Positive", ])


if (breast_cancer_clinical_data$ER.Status=="Positive" & breast_cancer_clinical_data$PR.Status=="Positive" & breast_cancer_clinical_data$HER2.Final.Status=="Positive") {
  
  print(breast_cancer_clinical_data$AJCC.Stage)
  
}


#behum
ER_Tumor <- data.frame(table(breast_cancer_clinical_data$Tumor, breast_cancer_clinical_data$ER.Status))

colnames(ER_Tumor) <- c("Tumor", "ER_Status", "Frequency")

ggplot(ER_Tumor,aes(x = ER_Status, y =Frequency, fill = Tumor)) + 
  geom_bar(stat = "identity", position = "dodge")

#Declaring variables for Triple Negative, Triple Positive, ER Positive, PR Positive, HER2 Positive

Triple_Positive_Sum <- sum(breast_cancer_clinical_data$ER.Status=="Positive") + sum(breast_cancer_clinical_data$PR.Status=="Positive") + sum(breast_cancer_clinical_data$HER2.Final.Status=="Positive")
print(Triple_Positive_Sum)

if (breast_cancer_clinical_data$Age.at.Initial.Pathologic.Diagnosis==66){
  #breast_cancer_clinical_data$PR.Status=="Positive" & breast_cancer_clinical_data$HER2.Final.Status=="Positive") {
  print(breast_cancer_clinical_data$Age.at.Initial.Pathologic.Diagnosis)
}


ggplot(data=breast_cancer_clinical_data, mapping=aes(x=Triple_Positive, y=Age.at.Initial.Pathologic.Diagnosis))

sum(breast_cancer_clinical_data$ER.Status=="Positive")

er <- breast_cancer_clinical_data$ER.Status[breast_cancer_clinical_data$ER.Status=="Positive"]
sum(er)
pr <- breast_cancer_clinical_data$PR.Status[breast_cancer_clinical_data$PR.Status=="Positive"]
pr
her2 <- breast_cancer_clinical_data$HER2.Final.Status[breast_cancer_clinical_data$HER2.Final.Status=="Positive"]
her2

Triple_Positive <- "er" + "pr" + "her2"

ggplot(Triple_Positive, mapping=aes(x=Triple_Positive))

library(dplyr)
TPBC <- breast_cancer_clinical_data %>%
  filter(ER.Status=="Positive" & PR.Status=="Positive" & HER2.Final.Status=="Positive") %>%
  select(ER.Status, PR.Status, HER2.Final.Status)

sum(TPBC)

total_TPBC <- TPBC %>%
  summarise(total_TPBC = sum(ER.Status + PR.Status + HER2.Final.Status))

print(total_TPBC$total_TPBC)