# How to create a data frame manually
noaa_survey <- data.frame(latitude = c(45, 45, 30, 30),
                          depth_m = c(5, 100, 5, 100),
                          temp_c = c(10.6, 7.1, 21.8, 18.3))
x <- c(1, 2, 3)
#print directly to column
noaa_survey
#or view() fun
View(noaa_survey)

# Alternatively, we can import using read.csv()

write.csv(noaa_survey, "noaa_survey.csv", row.names = FALSE)
#check contents of directory
dir()

#how to read data frame from CSV file
noaa_survey2 <- read.csv("noaa_survey.csv")
noaa_survey2

colnames(noaa_survey2)
colnames(noaa_survey2) <- c("Latitude", "DepthM", "TempC")
noaa_survey2
