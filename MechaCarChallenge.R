library(tidyverse)

# Linear Regression to Predict MPG

MechaCar_mpg <- read_csv("MechaCar_mpg.csv")
MechaCar_mpg

lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=MechaCar_mpg)

summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=MechaCar_mpg))

# Visualizations for the Trip Analysis

Suspension_Coil <- read_csv("Suspension_Coil.csv")

total_summary <- Suspension_Coil %>% summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI))
total_summary

summary_per_lot <- Suspension_Coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean = mean(PSI), Median = median(PSI),Variance = var(PSI), SD = sd(PSI), .groups = 'keep')
summary_per_lot

boxplot(PSI ~ Manufacturing_Lot, data = Suspension_Coil)

# T-Tests on Suspension Coils

t.test(Suspension_Coil$PSI, mu=1500)

t.test(Suspension_Coil[which(Suspension_Coil$Manufacturing_Lot =='Lot1'),]$PSI, mu=1500)

t.test(Suspension_Coil[which(Suspension_Coil$Manufacturing_Lot =='Lot2'),]$PSI, mu=1500)

t.test(Suspension_Coil[which(Suspension_Coil$Manufacturing_Lot =='Lot3'),]$PSI, mu=1500)
