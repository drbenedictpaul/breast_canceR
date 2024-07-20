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
#github check2
#github check3
#github conda env breast_canceR