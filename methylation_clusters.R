library(dplyr)
library(ggplot2)
# # Filter rows where all conditions are met and count them
# Triple_Positive <- breast_cancer_clinical_data %>%
#   filter(ER.Status == 'Positive' & PR.Status == 'Positive' & HER2.Final.Status == 'Positive') %>%
#   nrow()
# 
# Triple_Negative <- breast_cancer_clinical_data %>%
#   filter(ER.Status == 'Negative' & PR.Status == 'Negative' & HER2.Final.Status == 'Negative') %>%
#   nrow()
# 
# ER_Positive <- breast_cancer_clinical_data %>%
#   filter(ER.Status == 'Positive') %>%
#   nrow()
# 
# PR_Positive <- breast_cancer_clinical_data %>%
#   filter(PR.Status == 'Positive') %>%
#   nrow()
# 
# HER2_Positive <- breast_cancer_clinical_data %>%
#   filter(HER2.Final.Status == 'Positive') %>%
#   nrow()


# Extract relevant columns
methyl_cluster <- breast_cancer_clinical_data$methylation.Clusters
ER_Positive <- breast_cancer_clinical_data$ER.Status

# Create a data frame with counts of methylation clusters for each ER status
methyl_ER <- data.frame(table(methyl_cluster, ER_Positive))

# Rename columns for clarity
colnames(methyl_ER) <- c("Methyl_Cluster", "ER_Status", "Count")

# Create the bar plot
ggplot(data=methyl_ER, aes(x=ER_Status, y=Count, fill=Methyl_Cluster)) +
  geom_bar(stat="identity", position="stack") +
  labs(x="ER Status", y="Count", title="Bar Plot of Methylation Clusters by ER Status") +
  theme_minimal()



