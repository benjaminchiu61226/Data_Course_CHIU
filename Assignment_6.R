library(tidyverse)
dat <- read_csv("../../../Data_Course/Data/BioLog_Plate_Data.csv") # you may need to modify this path to fit where this file is stored relative to your assignment 6 script
dat_long <- dat %>%
  pivot_longer(cols= Hr_24:Hr_144,
               names_to = "Hours", values_to = "Absorbance_Value")
dat_type <- dat_long %>%
  mutate(Sample_type = case_when(
    grepl("Clear_Creek|Waste_Water", `Sample ID`)~ "Water",
    grepl("Soil_1|Soil_2", `Sample ID`) ~ "Soil"
  ))

ggplot(data=dat_type, mapping = aes(Hours,Absorbance_Value), color= "Sample_type") +
  geom_line() +
  facet_wrap("Substrate")


dat_type <- dat_type %>%
  mutate(hour = readr::parse_number(hour)) %>%
  arrange(Sample_type, Environment, hour)

ggplot(dat_type, aes(hour, value, color = Environment, group = Environment)) +
  geom_line(linewidth = 1) +
  facet_wrap(~ Sample_type, scales = "free_y") +
  theme_bw() +
  theme(
    strip.text = element_text(size = 10, face = "bold"),
    legend.position = "bottom"
  )
