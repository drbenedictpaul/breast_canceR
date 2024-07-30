library(ggplot2)
library(dplyr)

# Filter and count the positive statuses
ER_Positive <- breast_cancer_clinical_data %>% 
  filter(ER.Status == 'Positive') %>% 
  nrow()

PR_Positive <- breast_cancer_clinical_data %>% 
  filter(PR.Status == 'Positive') %>% 
  nrow()

HER2_Positive <- breast_cancer_clinical_data %>% 
  filter(HER2.Final.Status == 'Positive') %>% 
  nrow()

Triple_Positive <- breast_cancer_clinical_data %>% 
  filter(ER.Status == 'Positive' & PR.Status == 'Positive' & HER2.Final.Status == 'Positive') %>% 
  nrow()

Triple_Negative <- breast_cancer_clinical_data %>% 
  filter(ER.Status == 'Negative' & PR.Status == 'Negative' & HER2.Final.Status == 'Negative') %>% 
  nrow()

# Create the data frame with the counts
miRNA_cluster <- data.frame(
  Status = c("ER_Positive", "PR_Positive", "HER2_Positive", "Triple_Positive", "Triple_Negative"),
  Count = c(ER_Positive, PR_Positive, HER2_Positive, Triple_Positive, Triple_Negative)
)

# Plot the data
ggplot(data = miRNA_cluster, mapping = aes(x = Status, y = Count, fill = Status)) +
  geom_bar(stat = "identity", position = "stack") +
  labs(x = "miRNA Clusters", y = "Count", title = "miRNA Clusters Vs Hormone Status") +
  # theme_minimal()
  theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust=1))
