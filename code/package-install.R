##This should detect and install missing packages before loading them – 
packages <- c(
  "dplyr",  "data.table", "doBy", ## Data manipulation
  "reshape2", # package to easily melt data to long form
  "Hmisc", # generate a detailled describtion of a given dataset 
  "formatR", #,  used to format the code
  "ggplot2", ## advanced graphics
  "ggthemes", ## load different cusotmised themes for ggplot2: excel, stata, economist, tufte, wall street journal...
  "grid", "gridExtra","scales", # package for elegant data visualization using the Grammar of Graphics
  "vcd", # Visualisation of categorical data
  "RColorBrewer", # a package offering color palette from 
  "extrafont", ##" load additional font
  "sp","maptools","rgdal","rgeos","ggmap","hexbin","raster","cartography", ## packages used for the maps --
  "classInt",  ## used for univariate classification
  "lubridate","date","gdata", ## playing with date
  "lme4", "lmtest", "car", "caret",  ## used for regressions
   "AER",  # interesting datasets
  "lattice", # Visualisation
  "FactoMineR", "ade4",  ## multivariate analysis
  "survival", # survival analysis 
   "sqldf", "RODBC",  ## Direct connection with databases
  "stringr", # manipulation of string data
  "XML",  ## Manipulation of xml
  "tm", ## text mining
  "rJava", "XLConnect", ## Read and write excel files
  "cluster", ## Cluster analysis
  "foreign", ## read data from SPSS, SAS or Stata  
  "parallel", "httr", "rjson", 
  "MASS", "gvlma", "VGAM", "aod", "fields", 
  "scatterplot3d",  "psych",  "ellipse",   "pastecs",
  "devtools", # package used to load packages hosted in github -- install CURL before and separately
  "xkcd" ## Style from the xkcd comics 
)

## identify packages not installed yet
if (length(setdiff(packages, rownames(installed.packages()))) > 0) {
  install.packages(setdiff(packages, rownames(installed.packages())))  
}

rm(packages)