getwd() #Making sure I am in the right directory
csv_files <- list.files("Data",pattern="*.csv", full.names=TRUE) #List all of the .csv files and its paths within the Data folder and place into an object
length(csv_files) #read number of files within the csv_files object
df <- read.csv("Data/wingspan_vs_mass.csv") #store the contents within "wingspan_vs_mass.csv" in "df"
head(df, 5)
"b_list" <- list.files("Data/", pattern="b", recursive =TRUE, full.names=TRUE) #place all files within "Data" with the letter "b" into "b_list"
for (file in b_list) {
  cat("File:", file, "\n")
  first_line <- readLines(file, n=1)
  cat("First line:", first_line, "\n\n")
} #a for-loop to print the first line of all items that contain "b"
for (file in csv_files) {
  cat("File:", file, "\n")
  first_line <- readLines(file, n=1)
  cat("First line:", first_line, "\n\n")
} #a for-loop to print the first line of all items that were .csv files