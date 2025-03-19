library(ggplot2)
library(marinecs100b)


# Questionable organization choices ---------------------------------------

# P1 Call the function dir() at the console. This lists the files in your
# project's directory. Do you see woa.csv in the list? (If you don't, move it to
# the right place before proceeding.)

dir()


# P2 Critique the organization of woa.csv according to the characteristics of
# tidy data.

# There's no consistent names, there is missing data, multiple headers

# Importing data ----------------------------------------------------------

# P3 P3 Call read.csv() on woa.csv. What error message do you get? What do you
# think that means?

read.csv("woa (1).csv")
?read.csv()
#there's more empty columns than necessary :(

#HEADER will help us!

# P4 Re-write the call to read.csv() to avoid the error in P3.

csv <- read.csv("woa (1).csv", skip = 1)
csv
?read.csv()
View(csv)
?View

# Fix the column names ----------------------------------------------------

# P5 Fill in the blanks below to create a vector of the depth values.

depths <- c(
  seq(5, 100, by = 5),
  seq(125, 500, by = 25),
  seq(550, 2000, by = 50),
  seq(2100, 5500, by = 100)
)
depths
?seq()


# P6 Create a vector called woa_colnames with clean names for all 104 columns.
# Make them the column names of your WOA data frame.

woa_colnames <- c(
  paste0(depths)
)
woa_colnames
# Analyzing wide-format data ----------------------------------------------

# P7 What is the mean water temperature globally in the twilight zone (200-1000m
# depth)?


find_depth <- function(depths, meters) {
  for (j in 1:length(depths)) {
    if (depths[j] == meters) {
      return(j+2)
    }
  }
  return(NA)
}



#NOT FUNCTIONAL
#**
find_amount <- function(low_depth, high_depth) {

  low <- find_depth(depths, low_depth)
  high <- find_depth(depths, high_depth)
  sum = 0
  amount = 0
  for (n in 1:length(csv[ , low])) {

    for (n in 1:length(csv[ , low])) {
      sum <- sum + sum(csv[n, low], na.rm = TRUE)
      amount = amount + sum(is.na(csv[n, low]))
    }

  }
  return(sum/amount)
}
#**
find_depth(depths, 200):find_depth(depths, 1000)-1

sumMeanWater <- sum(csv[1:40564, 23:49], na.rm = TRUE)


amount = sum(!is.na(csv[, 23:49]))


sumMeanWater/amount
# 7.201573, my answer may not be correct but I think my code is following the
# principles of sum of all water temps/values.


# Analyzing long-format data ----------------------------------------------

# P8 Using woa_long, find the mean water temperature globally in the twilight zone.


View(woa_long)

# find_meanLONG <- function(low_depth, high_depth) {
#   count = 0
#   amount = 0
#   for (n in 1:length(woa_long[, 3])) {
#     if(woa_long[n, 3] > low_depth-1 & woa_long[n, 3] < high_depth+1 ) {
#       count = count + 1
#       amount = amount + woa_long[n, 4]
#     }
#   }
#   return(amount/count)
# }
# MEAN <- find_meanLONG(200, 1000)
# MEAN

sum(woa_long$temp_c[woa_long$depth_m >= 200 & woa_long$depth_m <= 1000])/sum(woa_long$depth_m >= 200 & woa_long$depth_m <= 1000)
# HOLY SHIT I DIDN"T THINK DIS WOULD WORK

# P9 Compare and contrast your solutions to P8 and P9.

# My solution to P9 is much more efficient and elegant than P8 due to its formatting.

# P10 Create a variable called mariana_temps. Filter woa_long to the rows in the
# location nearest to the coordinates listed in the in-class instructions.

# find_closest <- function(lat, long) {
#   closest = 100
#   for (n in 1:length(woa_long[, 3])) {
#      templat <- (woa_long[n, 1] / lat)
#      templong <- (woa_long[n, 2] / long)
#      temp = 0
#      if (templat < 0) {
#        temp = temp + 1
#      }
#      if (templong < 0) {
#        temp = temp +1
#      }
#      if (templat + templong < closest & temp == 0) {
#        closest = n
#        temp = 0
#      }
#     }
#
#   return(closest)
# }
# # if there is equally close then the function would still work, but reject the late long/lat set
#
# mariana_temps <- find_closest(11.21, 142.12)
# print(mariana_temps)
# length(woa_long[, 3])
# mariana_temps = woa_long[mariana_temps, ]



mariana_temps <- data.frame(
  temp_c = woa_long$temp_c[woa_long$latitude == 11.5 & woa_long$longitude == 142.5],
  depth_m = woa_long$depth_m[woa_long$latitude == 11.5 & woa_long$longitude == 142.5]
)

# print(woa_long[2810255, 1])

# P11 Interpret your temperature-depth profile. What's the temperature at the surface? How about in the deepest parts? Over what depth range does temperature change the most?

# ggplot is a tool for making figures, you'll learn its details in COMM101
ggplot(mariana_temps, aes(temp_c, depth_m)) +
  geom_path() +
  scale_y_reverse()


# At the surface, the temp is 27, in the deepest part, the temp is at 2, over the 0-1000 the temp changes dramatically
