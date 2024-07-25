library(dplyr)
# Filter rows where all conditions are met and count them
Triple_Positive <- breast_cancer_clinical_data %>%
  filter(ER.Status == 'Positive' & PR.Status == 'Positive' & HER2.Final.Status == 'Positive') %>%
  nrow()

Triple_Negative <- breast_cancer_clinical_data %>%
  filter(ER.Status == 'Negative' & PR.Status == 'Negative' & HER2.Final.Status == 'Negative') %>%
  nrow()

ER_Positive <- breast_cancer_clinical_data %>%
  filter(ER.Status == 'Positive') %>%
  nrow()

PR_Positive <- breast_cancer_clinical_data %>%
  filter(PR.Status == 'Positive') %>%
  nrow()

HER2_Positive <- breast_cancer_clinical_data %>%
  filter(HER2.Final.Status == 'Positive') %>% 
  nrow()



# Print the total count
# print(total_TPBC)
# print(total_TNBC)

# bc <- data.frame(table(total_TPBC, total_TNBC))

bc <- data.frame(
  Type = c("TPBC", "TNBC", "ER_Positive", "PR_Positive", "HER2_Positive"),
  Count = c(total_TPBC, total_TNBC, ER_Positive, PR_Positive, HER2_Positive)
)

# Plot the data using ggplot2
ggplot(data = bc, aes(x = Type, y = Count, fill = Type)) +
  geom_bar(stat = "identity") +
  labs(title = "Hormone Sensitive Status",
       x = "Cancer Type",
       y = "Count") +
  theme_minimal()
