### Analysis of technical skills survey

##########################################################
#######    PART 2: Manage data                 ###########
##########################################################


#### We have 2 datasets because the initial survey that includes token failed

## load the CSV extract from Limesurvey
data1 <- read.table("data/survey_72117_R_data_file.csv", sep=",", quote = "'", na.strings=c("","\"\""), stringsAsFactors=FALSE)
data2 <- read.table("data/survey_44458_R_data_file.csv", sep=",", quote = "'", na.strings=c("","\"\""), stringsAsFactors=FALSE)

## The initial survey sent with Token Invitation has more fields 
# so we need to take only the one in common
data1 <- data1[,c(9:85)]

## And before binding rows we must rename

str(data1)
str(data2)
names(data1) <- names(data2)
rm(data)
data <- rbind(data1, data2)


## Removing unused objects
rm(data1)
rm(data2)
View(data)

## let's remove the name field
#drops <- c("V13")
#data <- data[,!(names(data) %in% drops)]
## or just replace the content with somethingelse
data[,5] <- "anonymous"
write.csv(data, "data/data.csv", row.names=FALSE)



#########################################################################################
### Reloading from the saved csv file
data <- read.csv("data/data.csv")
## Now re-encode variable
source("code/survey_R_syntax_file.R")
names(data)
## Delete empty records -- using rows with empty title
data <- data[!is.na(data$tittle), ]
str(data)
#summary(data)

## Alternative
#install.packages("prettyR")
#library(prettyR)
#describe(data)
 
## Checking that factors levels are correctly set...
levels(data$function_surv)
data$function_surv <- factor(data$function_surv, levels = c("Rarely or Never", "At least once every three month", "At least once a month",  "At least once a week", "At least once a day"))
plot(data$function_surv)
# Fitting Labels
par(las=2) # make label text perpendicular to axis
par(mar=c(5,8,4,2)) # increase y-axis margin.
plot(data$function_surv,  horiz=TRUE )




### Now we recode all variables through a loop
for (i in 24:50 ) {
  data[, i] <- factor(data[, i], levels=c(1,2,3,4,5),
                      labels=c("Unknown","Concept","Tried","Used","Exp"))
}
for (i in 51:77 ) {
  data[, i] <- factor(data[, i], levels=c("no","doc","pres","trai","proj"),labels=c("No","Docu","Pres","Train","Proj"))
}


### More intersting might be to see what people do once a day, a week, etc..
## let's reshape the data accordingly
#  http://marcoghislanzoni.com/blog/2013/10/11/pivot-tables-in-r-with-melt-and-cast/
library("reshape2")
# names(data)
data.usualtask <- melt(data, id=c(9), measure=c(16:23)) 
## Recode variable 
str(data.usualtask)
levels(data.usualtask$variable)
## Set up the order within levels
data.usualtask$variable <- factor(data.usualtask$variable, levels = c("function_surv",  "function_ana",   "function_data",  "function_share", "function_fact",  "function_map",  
                                                                "function_dash",  "function_viz"))
## Recode the name
library("car")
data.usualtask$variable <- recode(data.usualtask$variable,'"function_surv" = "Support the design of surveys";
                               "function_ana"=  "Support the analysis of data collected during surveys";
                               "function_data" =  "Clean & manage dataset (Excel or SQL)";
                               "function_share"= "Share dataset with external organisations";
                               "function_fact" = "Create Factsheet";
                               "function_map"= "Create Map";
                               "function_dash"= "Create Static Dashboard/Infographics";
                               "function_viz"= "Create online Datavisualisation"')

data.usualtask$variable <- factor(data.usualtask$variable, levels = c("Create online Datavisualisation",                        
                                                                "Create Static Dashboard/Infographics",                                     
                                                                "Create Map", 
                                                                "Create Factsheet",
                                                                "Share dataset with external organisations",
                                                                "Clean & manage dataset (Excel or SQL)",
                                                                "Support the analysis of data collected during surveys",
                                                                "Support the design of surveys" ))
## Reorder frequency 
data.usualtask$value <- as.factor(data.usualtask$value)
#levels(data.usualtask$value)
data.usualtask$value <- factor(data.usualtask$value, levels = c("At least once a day",  "At least once a week" ,   "At least once a month" ,             
                                                          "At least once every three month", "Rarely or Never"))
data.usualtask$variable <- recode(data.usualtask$variable,'"At least once a day"="Once a day";  "At least once a week"="Once a week";
                                                          "At least once a month"="Once a month";             
                                                          "At least once every three month"="Once a trimestre"; "Rarely or Never"')

## we can also build the tables to be mapped per usage type
data.usualtask.summary <- dcast(data.usualtask, variable ~ value )

## testing on training
data.training <- melt(data, id=c(9), measure=c(12:14))
data.training.summary <- dcast(data.training, variable ~ value )


##########################################################
#######    PART 3: Produce graphics            ###########
##########################################################

library(dplyr)
library(ggplot2)
library(ggthemes)
#library(extrafont)
#font_import() # Import all fonts - do it once
#fonts() # Print list of all fonts


unhcr_theme <- function() {
  theme(
    plot.background = element_rect(fill = "#E2E2E3", colour = "#E2E2E3"),
    panel.background = element_rect(fill = "#E2E2E3"),
    panel.background = element_rect(fill = "white"),
    axis.text = element_text(colour = "#E7A922", family = "Impact"),
    plot.title = element_text(colour = "#552683", face = "bold", size = 15, vjust = 1, hjust = -0.4, family = "Impact"),
    axis.title = element_text(colour = "#552683", face = "bold", size = 13, family = "Impact"),
    panel.grid.major.x = element_line(colour = "#E7A922"),
    panel.grid.minor.x = element_blank(),
    panel.grid.major.y = element_blank(),
    panel.grid.minor.y = element_blank(),
    strip.text = element_text(family = "Impact", colour = "white"),
    strip.background = element_rect(fill = "#E7A922"),
    axis.ticks = element_line(colour = "#E7A922")
  )
}

## Now generate Graphs
#### Bar graph to show repartition for categories
bar.function_surv <- ggplot(data=data, aes(x=function_surv)) + 
  geom_bar( stat="bin",fill="#552683",colour="#552683") +
  guides(fill=FALSE) + 
  xlab("") + 
  ylab("") +
  unhcr_theme() +
  coord_flip() + 
  ggtitle(attributes(data)$variable.labels[16])
ggsave("out/function_surv.png", bar.function_surv, width=8, height=6,units="in", dpi=300)

## Now can map time spent by function  through facet
bar.function <- ggplot(data=data.usualtask, aes(x=variable)) + 
  geom_bar( stat="bin",fill="#552683",colour="#552683") +
  guides(fill=FALSE) + 
  facet_wrap(~ value, ncol = 5)+
  xlab("") + 
  ylab("") +
  coord_flip()  + 
  ggtitle("How often skills are used")+ 
  unhcr_theme()
ggsave("out/function.png", bar.function, width=14, height=5,units="in", dpi=300)


### Plotting Correlation graphics between need & skills
### Mosaic / marimekko plot with ggplot2 
## We need first a revised theme
unhcr2_theme <- function() {
  theme(
    plot.background = element_rect(fill = "#E2E2E3", colour = "#E2E2E3"),
    panel.background = element_rect(fill = "#E2E2E3"),
    axis.text = element_text(colour = "#E7A922", family = "Impact"),
    plot.title = element_text(colour = "#552683", face = "bold", size = 15, vjust = 1, hjust = 0, family = "Impact"),
    axis.title = element_text(colour = "#552683", face = "bold", size = 11, family = "Impact"),
    panel.grid.major.x = element_blank(),
    panel.grid.minor.x = element_blank(),
    panel.grid.major.y = element_blank(),
    panel.grid.minor.y = element_blank(),
    strip.text = element_text(family = "Impact", colour = "white"),
    strip.background = element_rect(fill = "#E7A922"),
    axis.ticks = element_line(colour = "#E7A922"),
    legend.background = element_blank(),
    legend.title = element_blank()
  )
}

## get the function to do mosaic plot with Ggplot2
rm(ggMMplot)
ggMMplot <- function(var1, var2, var3){
  require(ggplot2)
  levVar1 <- length(levels(var1))
  levVar2 <- length(levels(var2))
  
  jointTable <- prop.table(table(var1, var2))
  plotData <- as.data.frame(jointTable)
  plotData$marginVar1 <- prop.table(table(var1))
  plotData$var2Height <- plotData$Freq / plotData$marginVar1
  plotData$var1Center <- c(0, cumsum(plotData$marginVar1)[1:levVar1 -1]) + plotData$marginVar1 / 2
  ggplot(plotData, aes(var1Center, var2Height)) +
    geom_bar(stat = "identity", aes(width = marginVar1, fill = var2), col = "Grey") +
    geom_text(aes(label = as.character(var1), x = var1Center, y = 1.05), size=3,
              color=rgb(100,100,100, maxColorValue=255)) +
    xlab("Knows") +  ylab("Needs") + ggtitle(var3) +
    unhcr2_theme()
}

## Now we loop the 26 graphs generation
for (i in 24:51 ) {
  ii <- i+26
  rm(var3)
  var3 <- substr(attributes(data)$variable.labels[i], 1, gregexpr(pattern =']', attributes(data)$variable.labels[i]))
  rm(plot)
  plot <- ggMMplot(data[,i], data[,ii], var3) 
  assign(paste("plot",i,sep=""), plot)
  ggsave(filename=paste("out/plot",i,".png",sep=""), plot=plot, width=8, height=6,units="in", dpi=300)
  }

##########################################################
#######    PART 4: Produce maps                ###########
##########################################################

## we need to add some lattitude & longitude 
centroids <- read.delim("data/country_centroids_all.csv")
names(centroids)
data.map <- merge (x=data, y=centroids, by.x="operation", by.y="SHORT_NAME", all.x=TRUE)

### Eliminate record without coordinates
data.map <-data.map[!rowSums(is.na(data.map["LAT"])), ]

## Now agregate records per country with a count of numbers
data.map.agg <- aggregate(data.map$operation,by=list(x=data.map$LONG,y=data.map$LAT),length)
names(data.map.agg)[1] <- "LONG"
names(data.map.agg)[2] <- "LAT"
names(data.map.agg)[3] <- "count"

## now creating a simple map with 
library(ggmap)
## let's get the background for middeleast
googleterrain.mena <- get_map(location = c(lon =40, lat = 30),
                              color = "color", source = "google",maptype = "terrain", zoom = 3)
googleterrain.mena.view <- ggmap(googleterrain.mena)
googleterrain.mena.view
map.respondent <- ggmap(googleterrain.mena)+
  geom_point(aes(x = LONG, y = LAT, size=count),data=data.map.agg, alpha = 0.9, color="#E7A922",fill="#E7A922") +
  ggtitle("Map of respondent")+
  theme(plot.title=element_text(face="bold", size=14),
        axis.title.x=element_blank(),
        axis.title.y=element_blank(),
        axis.text.x = element_blank(),axis.ticks = element_blank(),
        axis.text.y = element_blank(),
        plot.background = element_rect(fill = "transparent",colour = NA))
map.respondent

toner.mena <- get_stamenmap(bbox = c(left = -19.07, bottom = 10.31, right = 62.49, top = 42.23),
                            zoom = 4, source = "stamen", maptype = "toner",
                            crop = TRUE, messaging = FALSE, urlonly = FALSE)

map.respondent2 <- ggmap(toner.mena)+
  geom_point(aes(x = LONG, y = LAT, size=count),data=data.map.agg,
             alpha = 0.8, color="#E7A922",fill="#E7A922") +
  ggtitle("Map of respondent")+
  theme(plot.title=element_text(face="bold", size=14),
        axis.title.x=element_blank(),
        axis.title.y=element_blank(),
        axis.text.x = element_blank(),axis.ticks = element_blank(),
        axis.text.y = element_blank(),
        plot.background = element_rect(fill = "transparent",colour = NA))
map.respondent2
##########################################################
#######    PART 5: Advanced statistics         ###########
##########################################################

### We can check the correlation between Title & expertise
data$tittle1 <- factor(data$tittle)
levels(data$tittle1)

data$special <- as.factor(recode(data$tittle,'"Asso. IM Officer" = "IM";
"Assoc. IM Officer" = "IM";
"Associate Data Management Officer" = "ODM";
"Associate Database Administrator"= "ODM";
 "Associate Field Officer" = "Other";
 "Associate ICT Officer" = "Other";
"Associate IM Officer" = "IM";
 "Associate Operational Data Management Officer"= "ODM";
"IMO" = "IM";
 "Information Management Associate" = "IM";
"Information Management officer" = "IM";
  "IT Associate"   = "Other";
 "Operations Data Management Officer"= "ODM";
 "PROTECTION OFFICER-IM"= "IM";
 "Registration Associate" = "Other";
  "Senior Data Management Associate"  = "ODM";
 "Senior Information Management Associate" = "IM";
 "Snr Reg IMO"   = "IM";
 "Snr. Data Management Assistant" = "ODM";
   "Snr. Information Management Assistant"= "IM"'))


## looking at correlation between categorical variables

table(data$function_surv, data$skillsurv_surv)
chisq.test(data$function_surv, data$skillsurv_surv, correct=FALSE)
fisher.test(data$function_surv, data$skillsurv_surv)

## testing correlation between attendance to training & skills
table(data$function_surv, data$special)
fisher.test(data$function_surv, data$special)

table(data$function_ana, data$special)
fisher.test(data$function_ana, data$special)

## testing correlation between attendance to training & skills
table(data$prevtrain_time, data$skillsurv_surv)
fisher.test(data$prevtrain_time, data$skillsurv_surv)


## Multiple Correspondence Analysis & Creation of cluster based on main observation
## We select speciality, functions & skills
names(data)
d <- data[, c("special",   "function_surv" ,   "function_ana" ,   "function_data"  ,   "function_share" ,  
              "function_fact"   , "function_map"   ,           "function_dash"  ,           "function_viz"    ,          "skillsurv_surv"  ,         
              "skillsurv_ques"  ,          "skillsurv_xlsfor" ,         "skillsurv_sampl" ,          "skillsurv_sql"  ,          
              "skillmap_arcgis",           "skillmap_qgis" ,            "skillmap_postg"  ,          "skillmap_arcon" ,          
              "skillmap_mapb" ,            "skillmap_osm"  ,            "skillexcel_clean" ,         "skillexcel_pivot" ,        
              "skillexcel_macro" ,         "skillshare_anom" ,          "skillshare_class"   ,       "skillshare_conf"  ,        
              "skillstat_reproR",          "skillstat_outlier" ,        "skillstat_regress"   ,      "skillstat_multiva" ,       
              "skillstat_quali" ,          "skillinfographics_dataviz", "skillinfographics_illus",   "skillinfographics_infoexc",
              "skillsdataviz_github",      "skillsdataviz_d3"   
)]


library(FactoMineR)

datamca.mca<-MCA(d)
summary(datamca.mca)
dev.off()
plot(datamca.mca,invisible=c("var","quali.sup","quanti.sup"),cex=0.7)
plot(datamca.mca,invisible=c("var"),cex=0.7)
plot(datamca.mca,invisible=c("ind","quali.sup","quanti.sup"),cex=0.8)
plot(datamca.mca,invisible=c("quali.sup","quanti.sup"),cex=0.8)

dimdesc(datamca.mca,axes=1:2)
dimdesc(datamca.mca,axes=1:2,proba=0.30)
dimdesc(datamca.mca,axes=1:2,proba=0.50)

### Hierarchical Clustering on Principal Components
datamca.hcpc <-HCPC(datamca.mca ,nb.clust=-1,consol=TRUE,min=3,max=4,graph=TRUE, order=FALSE)
datamca.hcpc$desc.var
datamca.hcpc$desc.axes
datamca.hcpc$desc.ind

print (datamca.hcpc, "out/descriptioncluster.txt")
dataclust <- datamca.hcpc$data.clust

plot(datamca.hcpc)
plot(datamca.hcpc, choice="map")

library(cluster)
classif = agnes(datamca.mca$ind$coord,method="ward")
plot(classif,main="Dendrogram",ask=F,which.plots=2,labels=FALSE)


##########################################################
#######    PART 5: Reports                     ###########
##########################################################
### Starting building an inforgraphic style summary of data
## http://alstatr.blogspot.ch/2015/02/r-how-to-layout-and-design-infographic.html

### Creating the grid to put eveyrthing together:
# Generate Infographic in PDF format
library("grid")
library("useful")
#pdf("out/Infographics1.pdf", width = 10, height = 20)
png("out/Infographics1.png", width = 12, height = 45, units = "in", res = 500)
grid.newpage()
## 5 rows & 4 columns
pushViewport(viewport(layout = grid.layout(16, 4)))
## Background color
grid.rect(gp = gpar(fill = "#E2E2E3", col = "#E2E2E3"))
## Insert some text
grid.text("Survey", y = unit(1, "npc"), 
          x = unit(0.5, "npc"), 
          vjust = 1, 
          hjust = .5, 
          gp = gpar( col = "#A9A8A7", cex = 12, alpha = 0.3), 
          vp = vplayout(1, 1:4)
)
grid.text("Technical Skills", y = unit(0.94, "npc"), 
          vjust = 1, 
          hjust = .5, 
          gp = gpar( col = "#E7A922", cex = 6.4), 
          vp = vplayout(1, 1:4))
grid.text("21 UNHCR Staff working in MENA replied to the form", 
          vjust = 0, y = unit(0.92, "npc"),
          gp = gpar( col = "#552683", cex = 0.8), 
          vp = vplayout(1, 1:4))

## Now we insert each chart in the grid -- 
print(bar.function, vp = vplayout(2, 1:4))

print(map.respondent2, vp = vplayout(3, 1:4))

print(plot24, vp = vplayout(4,1:2))
print(plot25, vp = vplayout(4,3:4))

print(plot26, vp = vplayout(5,1:2))
print(plot27, vp = vplayout(5,3:4))

print(plot28, vp = vplayout(6,1:2))
print(plot29, vp = vplayout(6,3:4))

print(plot30, vp = vplayout(7,1:2))
print(plot31, vp = vplayout(7,3:4))

print(plot32, vp = vplayout(8,1:2))
print(plot33, vp = vplayout(8,3:4))

print(plot34, vp = vplayout(9,1:2))
print(plot35, vp = vplayout(9,3:4))

print(plot36, vp = vplayout(10,1:2))
print(plot37, vp = vplayout(10,3:4))

print(plot38, vp = vplayout(11,1:2))
print(plot39, vp = vplayout(11,3:4))

print(plot40, vp = vplayout(12,1:2))
print(plot41, vp = vplayout(12,3:4))

print(plot42, vp = vplayout(13,1:2))
print(plot43, vp = vplayout(13,3:4))

print(plot44, vp = vplayout(14,1:2))
print(plot45, vp = vplayout(14,3:4))

print(plot46, vp = vplayout(15,1:2))
print(plot47, vp = vplayout(15,3:4))

print(plot48, vp = vplayout(16,1:2))
print(plot49, vp = vplayout(16,3:4))

print(plot50, vp = vplayout(17,1:2))


dev.off()