#IC50 vs AUC EDA

#Set Working Directory
getwd()

#Import Health Data
df <- read.csv('GDSC_DATASET.csv')

#get dimensions
dim(df)
colnames(df)

#Extract columns of IC50 and AUC values
IC50 <- df['LN_IC50']
AUC <- df['AUC']

#append into one dataframe
data_IC50_AUC = as.data.frame(append(IC50, AUC))
dim(data_IC50_AUC)
#omit NA values
data_IC50_AUC <- na.omit(data_IC50_AUC)

#plot a scatterplot to see if data expresses any general trends
library('ggplot2')

#load font packages
library(extrafont)
font_import()

#plot graph
ggplot(data_IC50_AUC) + 
  geom_point(aes(x = LN_IC50, y = AUC), size = 0.000001, col = '#0a2d93', alpha = 0.2) +
  labs(x="Natural Log of IC50 Values", y="Area Under Curve", title="Scatterplot of AUC vs IC50 Values") + 
  theme(text = element_text(family = "PT Sans"), plot.title = element_text(color = "blue"), axis.title.x=element_text(colour="blue"), axis.title.y = element_text(colour = "blue"))

#summary statistics: 
summary(data_IC50_AUC)
