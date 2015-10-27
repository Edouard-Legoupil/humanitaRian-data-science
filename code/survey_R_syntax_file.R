###Re-encode variable

data[, 1] <- as.numeric(data[, 1])
attributes(data)$variable.labels[1] <- "id"
names(data)[1] <- "id"

data[, 2] <- as.character(data[, 2])
attributes(data)$variable.labels[2] <- "id1"
names(data)[2] <- "submitdate"

#Field hidden

data[, 3] <- as.character(data[, 3])
attributes(data)$variable.labels[3] <- "submitdate"
names(data)[3] <- "startlanguage"

data[, 4] <- as.character(data[, 4])
attributes(data)$variable.labels[4] <- "startlanguage"
names(data)[4] <- "token"

data[, 5] <- as.character(data[, 5])
attributes(data)$variable.labels[5] <- "Please provide your full name"
names(data)[5] <- "name"

data[, 6] <- as.character(data[, 6])
attributes(data)$variable.labels[6] <- "Tittle:"
names(data)[6] <- "tittle"

data[, 7] <- as.character(data[, 7])
attributes(data)$variable.labels[7] <- "Which section are you reporting to in your office?"
data[, 7] <- factor(data[, 7], levels=c("exe","coord","prot","prog","rel","fiel","clust"),labels=c("Executive management","Coordination","Protection","Programme","External Relation","Field","Cluster"))
names(data)[7] <- "Section"

data[, 8] <- as.numeric(data[, 8])
attributes(data)$variable.labels[8] <- "[Other] Which section are you reporting to in your office?"
names(data)[8] <- "Section_other"

data[, 9] <- as.character(data[, 9])
attributes(data)$variable.labels[9] <- "Operation or Country where you work:"
data[, 9] <- factor(data[, 9], levels=c("ALG","ARE","IRQ","JOR","KUW","LBN","LYB","MAU","MOR","SAU","SYR","TUN","UAE","YEM"),labels=c("Algeria","Egypt","Iraq","Jordan","Kuwait","Lebanon","Libya","Mauritania","Morocco","Saudi Arabia","Syria","Tunisia","United Arab Emirates","Yemen"))
names(data)[9] <- "operation"

data[, 10] <- as.character(data[, 10])
attributes(data)$variable.labels[10] <- "Contract / Position type"
data[, 10] <- factor(data[, 10], levels=c("com","fast","ta","con","unv"),labels=c("Compendium","Fast Track","TA","Consultant","UNV"))
names(data)[10] <- "contract"

data[, 11] <- as.character(data[, 11])
attributes(data)$variable.labels[11] <- "[Other] Contract / Position type"
names(data)[11] <- "contract_other"

data[, 12] <- as.numeric(data[, 12])
attributes(data)$variable.labels[12] <- "[ODMLP - Operation Data Management Learning Programme] Did you already attended any of the following UNHCR training?"
data[, 12] <- factor(data[, 12], levels=c(1,0),labels=c("Yes","Not selected"))
names(data)[12] <- "prevtrain_odmlp"

data[, 13] <- as.numeric(data[, 13])
attributes(data)$variable.labels[13] <- "[TIME - Training on Information Management for Emergencies] Did you already attended any of the following UNHCR training?"
data[, 13] <- factor(data[, 13], levels=c(1,0),labels=c("Yes","Not selected"))
names(data)[13] <- "prevtrain_time"

data[, 14] <- as.numeric(data[, 14])
attributes(data)$variable.labels[14] <- "[DataVisualisation workshop] Did you already attended any of the following UNHCR training?"
data[, 14] <- factor(data[, 14], levels=c(1,0),labels=c("Yes","Not selected"))
names(data)[14] <- "prevtrain_dataviz"

data[, 15] <- as.character(data[, 15])
attributes(data)$variable.labels[15] <- "[Other] Did you already attended any of the following UNHCR training?"
names(data)[15] <- "prevtrain_other"


#### Encoding In your current, what kind of task are you responsible for?

data[, 16] <- as.character(data[, 16])
#attributes(data)$variable.labels[16] <- "[Support the design of surveys] In your current, what kind of task are you responsible for?"
attributes(data)$variable.labels[16] <- "Support the design of surveys"
data[, 16] <- factor(data[, 16], levels=c("nev","trim","month","weekl","daily"),labels=c("Rarely or Never","At least once every three month","At least once a month","At least once a week","At least once a day"))
names(data)[16] <- "function_surv"

data[, 17] <- as.character(data[, 17])
#attributes(data)$variable.labels[17] <- "[Support the analysis of data collected during surveys] In your current, what kind of task are you responsible for?"
attributes(data)$variable.labels[17] <- "Support the analysis of data collected during surveys"
data[, 17] <- factor(data[, 17], levels=c("nev","trim","month","weekl","daily"),labels=c("Rarely or Never","At least once every three month","At least once a month","At least once a week","At least once a day"))
names(data)[17] <- "function_ana"

data[, 18] <- as.character(data[, 18])
#attributes(data)$variable.labels[18] <- "[Clean & manage dataset (Excel or SQL)] In your current, what kind of task are you responsible for?"
attributes(data)$variable.labels[18] <- "Clean & manage dataset (Excel or SQL)"
data[, 18] <- factor(data[, 18], levels=c("nev","trim","month","weekl","daily"),labels=c("Rarely or Never","At least once every three month","At least once a month","At least once a week","At least once a day"))
names(data)[18] <- "function_data"

data[, 19] <- as.character(data[, 19])
#attributes(data)$variable.labels[19] <- "[Share dataset with external organisations ] In your current, what kind of task are you responsible for?"
attributes(data)$variable.labels[19] <- "Share dataset with external organisations"
data[, 19] <- factor(data[, 19], levels=c("nev","trim","month","weekl","daily"),labels=c("Rarely or Never","At least once every three month","At least once a month","At least once a week","At least once a day"))
names(data)[19] <- "function_share"

data[, 20] <- as.character(data[, 20])
#attributes(data)$variable.labels[20] <- "[Create Factsheet] In your current, what kind of task are you responsible for?"
attributes(data)$variable.labels[20] <- "Create Factsheet"
data[, 20] <- factor(data[, 20], levels=c("nev","trim","month","weekl","daily"),labels=c("Rarely or Never","At least once every three month","At least once a month","At least once a week","At least once a day"))
names(data)[20] <- "function_fact"

data[, 21] <- as.character(data[, 21])
#attributes(data)$variable.labels[21] <- "[Create Map] In your current, what kind of task are you responsible for?"
attributes(data)$variable.labels[21] <- "Create Map"
data[, 21] <- factor(data[, 21], levels=c("nev","trim","month","weekl","daily"),labels=c("Rarely or Never","At least once every three month","At least once a month","At least once a week","At least once a day"))
names(data)[21] <- "function_map"

data[, 22] <- as.character(data[, 22])
#attributes(data)$variable.labels[22] <- "[Create Static Dashboard/Infographics] In your current, what kind of task are you responsible for?"
attributes(data)$variable.labels[22] <- "Create Static Dashboard/Infographics"
data[, 22] <- factor(data[, 22], levels=c("nev","trim","month","weekl","daily"),labels=c("Rarely or Never","At least once every three month","At least once a month","At least once a week","At least once a day"))
names(data)[22] <- "function_dash"

data[, 23] <- as.character(data[, 23])
#attributes(data)$variable.labels[23] <- "[Create online Datavisualisation] In your current, what kind of task are you responsible for?"
attributes(data)$variable.labels[23] <- "Create online Datavisualisation"
data[, 23] <- factor(data[, 23], levels=c("nev","trim","month","weekl","daily"),labels=c("Rarely or Never","At least once every three month","At least once a month","At least once a week","At least once a day"))
names(data)[23] <- "function_viz"



### Skills


data[, 24] <- as.numeric(data[, 24])
attributes(data)$variable.labels[24] <- "[Select the right survey methodology: KI, HH, Focus...] How would you describe your current knowledge for the following technical skills? - Surveys"
#data[, 24] <- factor(data[, 24], levels=c(1,2,3,4,5),labels=c("First time I heard of this","Know the concept only","Tried a few times","Use it regularly","Can train others on it"))
names(data)[24] <- "skillsurv_surv"

data[, 25] <- as.numeric(data[, 25])
attributes(data)$variable.labels[25] <- "[Design questions for needs assessment/survey ] How would you describe your current knowledge for the following technical skills? - Surveys"
#data[, 25] <- factor(data[, 25], levels=c(1,2,3,4,5),labels=c("First time I heard of this","Know the concept only","Tried a few times","Use it regularly","Can train others on it"))
names(data)[25] <- "skillsurv_ques"

data[, 26] <- as.numeric(data[, 26])
attributes(data)$variable.labels[26] <- "[Create a form using XLSFORM for mobile data collection ODK] How would you describe your current knowledge for the following technical skills? - Surveys"
#data[, 26] <- factor(data[, 26], levels=c(1,2,3,4,5),labels=c("First time I heard of this","Know the concept only","Tried a few times","Use it regularly","Can train others on it"))
names(data)[26] <- "skillsurv_xlsfor"

data[, 27] <- as.numeric(data[, 27])
attributes(data)$variable.labels[27] <- "[Select a sampling metholodology & generate a sample] How would you describe your current knowledge for the following technical skills? - Surveys"
#data[, 27] <- factor(data[, 27], levels=c(1,2,3,4,5),labels=c("First time I heard of this","Know the concept only","Tried a few times","Use it regularly","Can train others on it"))
names(data)[27] <- "skillsurv_sampl"

data[, 28] <- as.numeric(data[, 28])
attributes(data)$variable.labels[28] <- "[Creating queries & extracting data with SQL from proGres] How would you describe your current knowledge for the following technical skills? - Surveys"
#data[, 28] <- factor(data[, 28], levels=c(1,2,3,4,5),labels=c("First time I heard of this","Know the concept only","Tried a few times","Use it regularly","Can train others on it"))
names(data)[28] <- "skillsurv_sql"

data[, 29] <- as.numeric(data[, 29])
attributes(data)$variable.labels[29] <- "[Use ArcGIS to produce static maps] How would you describe your current knowledge for the following technical skills? - Mapping"
#data[, 29] <- factor(data[, 29], levels=c(1,2,3,4,5),labels=c("First time I heard of this","Know the concept only","Tried a few times","Use it regularly","Can train others on it"))
names(data)[29] <- "skillmap_arcgis"

data[, 30] <- as.numeric(data[, 30])
attributes(data)$variable.labels[30] <- "[Use Qgis to produce static maps] How would you describe your current knowledge for the following technical skills? - Mapping"
#data[, 30] <- factor(data[, 30], levels=c(1,2,3,4,5),labels=c("First time I heard of this","Know the concept only","Tried a few times","Use it regularly","Can train others on it"))
names(data)[30] <- "skillmap_qgis"

data[, 31] <- as.numeric(data[, 31])
attributes(data)$variable.labels[31] <- "[create spatial queries in SQL with postgis] How would you describe your current knowledge for the following technical skills? - Mapping"
#data[, 31] <- factor(data[, 31], levels=c(1,2,3,4,5),labels=c("First time I heard of this","Know the concept only","Tried a few times","Use it regularly","Can train others on it"))
names(data)[31] <- "skillmap_postg"

data[, 32] <- as.numeric(data[, 32])
attributes(data)$variable.labels[32] <- "[Use ArcGISonline to produce dynamic webmaps] How would you describe your current knowledge for the following technical skills? - Mapping"
#data[, 32] <- factor(data[, 32], levels=c(1,2,3,4,5),labels=c("First time I heard of this","Know the concept only","Tried a few times","Use it regularly","Can train others on it"))
names(data)[32] <- "skillmap_arcon"

data[, 33] <- as.numeric(data[, 33])
attributes(data)$variable.labels[33] <- "[Use Mapbox to produce dynamic webmaps] How would you describe your current knowledge for the following technical skills? - Mapping"
#data[, 33] <- factor(data[, 33], levels=c(1,2,3,4,5),labels=c("First time I heard of this","Know the concept only","Tried a few times","Use it regularly","Can train others on it"))
names(data)[33] <- "skillmap_mapb"

data[, 34] <- as.numeric(data[, 34])
attributes(data)$variable.labels[34] <- "[Use OpenStreetMap for collaborative camp mapping] How would you describe your current knowledge for the following technical skills? - Mapping"
#data[, 34] <- factor(data[, 34], levels=c(1,2,3,4,5),labels=c("First time I heard of this","Know the concept only","Tried a few times","Use it regularly","Can train others on it"))
names(data)[34] <- "skillmap_osm"

data[, 35] <- as.numeric(data[, 35])
attributes(data)$variable.labels[35] <- "[Data Cleaning in Excel] How would you describe your current knowledge for the following technical skills? - Excel"
#data[, 35] <- factor(data[, 35], levels=c(1,2,3,4,5),labels=c("First time I heard of this","Know the concept only","Tried a few times","Use it regularly","Can train others on it"))
names(data)[35] <- "skillexcel_clean"

data[, 36] <- as.numeric(data[, 36])
attributes(data)$variable.labels[36] <- "[Data analysis in Excel - pivot table, powerpivot] How would you describe your current knowledge for the following technical skills? - Excel"
#data[, 36] <- factor(data[, 36], levels=c(1,2,3,4,5),labels=c("First time I heard of this","Know the concept only","Tried a few times","Use it regularly","Can train others on it"))
names(data)[36] <- "skillexcel_pivot"

data[, 37] <- as.numeric(data[, 37])
attributes(data)$variable.labels[37] <- "[Data processing analysis in Excel - macro in VB script] How would you describe your current knowledge for the following technical skills? - Excel"
#data[, 37] <- factor(data[, 37], levels=c(1,2,3,4,5),labels=c("First time I heard of this","Know the concept only","Tried a few times","Use it regularly","Can train others on it"))
names(data)[37] <- "skillexcel_macro"

data[, 38] <- as.numeric(data[, 38])
attributes(data)$variable.labels[38] <- "[Data Anonymisation Techniques] How would you describe your current knowledge for the following technical skills? - Data Sharing"
#data[, 38] <- factor(data[, 38], levels=c(1,2,3,4,5),labels=c("First time I heard of this","Know the concept only","Tried a few times","Use it regularly","Can train others on it"))
names(data)[38] <- "skillshare_anom"

data[, 39] <- as.numeric(data[, 39])
attributes(data)$variable.labels[39] <- "[Data Sensitivity Classification] How would you describe your current knowledge for the following technical skills? - Data Sharing"
#data[, 39] <- factor(data[, 39], levels=c(1,2,3,4,5),labels=c("First time I heard of this","Know the concept only","Tried a few times","Use it regularly","Can train others on it"))
names(data)[39] <- "skillshare_class"

data[, 40] <- as.numeric(data[, 40])
attributes(data)$variable.labels[40] <- "[Data Confidentiality Guidelines] How would you describe your current knowledge for the following technical skills? - Data Sharing"
#data[, 40] <- factor(data[, 40], levels=c(1,2,3,4,5),labels=c("First time I heard of this","Know the concept only","Tried a few times","Use it regularly","Can train others on it"))
names(data)[40] <- "skillshare_conf"

data[, 41] <- as.numeric(data[, 41])
attributes(data)$variable.labels[41] <- "[Using R for reproducible research] How would you describe your current knowledge for the following technical skills? - Statistics"
#data[, 41] <- factor(data[, 41], levels=c(1,2,3,4,5),labels=c("First time I heard of this","Know the concept only","Tried a few times","Use it regularly","Can train others on it"))
names(data)[41] <- "skillstat_reproR"

data[, 42] <- as.numeric(data[, 42])
attributes(data)$variable.labels[42] <- "[Using R to identify data outliers ] How would you describe your current knowledge for the following technical skills? - Statistics"
#data[, 42] <- factor(data[, 42], levels=c(1,2,3,4,5),labels=c("First time I heard of this","Know the concept only","Tried a few times","Use it regularly","Can train others on it"))
names(data)[42] <- "skillstat_outlier"

data[, 43] <- as.numeric(data[, 43])
attributes(data)$variable.labels[43] <- "[Using R for statistical model - regressions] How would you describe your current knowledge for the following technical skills? - Statistics"
#data[, 43] <- factor(data[, 43], levels=c(1,2,3,4,5),labels=c("First time I heard of this","Know the concept only","Tried a few times","Use it regularly","Can train others on it"))
names(data)[43] <- "skillstat_regress"

data[, 44] <- as.numeric(data[, 44])
attributes(data)$variable.labels[44] <- "[Using R for multivariate analysis] How would you describe your current knowledge for the following technical skills? - Statistics"
#data[, 44] <- factor(data[, 44], levels=c(1,2,3,4,5),labels=c("First time I heard of this","Know the concept only","Tried a few times","Use it regularly","Can train others on it"))
names(data)[44] <- "skillstat_multiva"

data[, 45] <- as.numeric(data[, 45])
attributes(data)$variable.labels[45] <- "[Using R for qualitative data analysis] How would you describe your current knowledge for the following technical skills? - Statistics"
#data[, 45] <- factor(data[, 45], levels=c(1,2,3,4,5),labels=c("First time I heard of this","Know the concept only","Tried a few times","Use it regularly","Can train others on it"))
names(data)[45] <- "skillstat_quali"

data[, 46] <- as.numeric(data[, 46])
attributes(data)$variable.labels[46] <- "[Basic principle of datavisualisation] How would you describe your current knowledge for the following technical skills? - Infographics"
#data[, 46] <- factor(data[, 46], levels=c(1,2,3,4,5),labels=c("First time I heard of this","Know the concept only","Tried a few times","Use it regularly","Can train others on it"))
names(data)[46] <- "skillinfographics_dataviz"

data[, 47] <- as.numeric(data[, 47])
attributes(data)$variable.labels[47] <- "[Use Illustrator to produce infographics] How would you describe your current knowledge for the following technical skills? - Infographics"
#data[, 47] <- factor(data[, 47], levels=c(1,2,3,4,5),labels=c("First time I heard of this","Know the concept only","Tried a few times","Use it regularly","Can train others on it"))
names(data)[47] <- "skillinfographics_illus"

data[, 48] <- as.numeric(data[, 48])
attributes(data)$variable.labels[48] <- "[Use Excel to produce infographics] How would you describe your current knowledge for the following technical skills? - Infographics"
#data[, 48] <- factor(data[, 48], levels=c(1,2,3,4,5),labels=c("First time I heard of this","Know the concept only","Tried a few times","Use it regularly","Can train others on it"))
names(data)[48] <- "skillinfographics_infoexc"

data[, 49] <- as.numeric(data[, 49])
attributes(data)$variable.labels[49] <- "[Using Github for collaboration on code development] How would you describe your current knowledge for the following technical skills? - Datavisualisation"
#data[, 49] <- factor(data[, 49], levels=c(1,2,3,4,5),labels=c("First time I heard of this","Know the concept only","Tried a few times","Use it regularly","Can train others on it"))
names(data)[49] <- "skillsdataviz_github"

data[, 50] <- as.numeric(data[, 50])
attributes(data)$variable.labels[50] <- "[Create online interactive datavisualisation with javascript] How would you describe your current knowledge for the following technical skills? - Datavisualisation"
#data[, 50] <- factor(data[, 50], levels=c(1,2,3,4,5),labels=c("First time I heard of this","Know the concept only","Tried a few times","Use it regularly","Can train others on it"))
names(data)[50] <- "skillsdataviz_d3"


### Needs


data[, 51] <- as.character(data[, 51])
attributes(data)$variable.labels[51] <- "[Select the right survey methodology (Focus group, key informant, Household, Community Mapping..) ] Tell us how interested you would be to get training for the following skills? - Surveys"
#data[, 51] <- factor(data[, 51], levels=c("no","doc","pres","trai","proj"),labels=c("Not interested by the subject or not relevant to me at the moment","Just need to check that I know what I need to know. Please send me some documentation","I would like to see it in practice. I would enjoy a live presentation","I would need a full day on it with hands-on training","I would need some mentoring as I am ready to work on a project with this"))
names(data)[51] <- "needsurv_surv"

data[, 52] <- as.character(data[, 52])
attributes(data)$variable.labels[52] <- "[Design questions for needs assessment/survey ] Tell us how interested you would be to get training for the following skills? - Surveys"
#data[, 52] <- factor(data[, 52], levels=c("no","doc","pres","trai","proj"),labels=c("Not interested by the subject or not relevant to me at the moment","Just need to check that I know what I need to know. Please send me some documentation","I would like to see it in practice. I would enjoy a live presentation","I would need a full day on it with hands-on training","I would need some mentoring as I am ready to work on a project with this"))
names(data)[52] <- "needsurv_ques"

data[, 53] <- as.character(data[, 53])
attributes(data)$variable.labels[53] <- "[Create a form using XLSFORM for mobile data collection ODK] Tell us how interested you would be to get training for the following skills? - Surveys"
#data[, 53] <- factor(data[, 53], levels=c("no","doc","pres","trai","proj"),labels=c("Not interested by the subject or not relevant to me at the moment","Just need to check that I know what I need to know. Please send me some documentation","I would like to see it in practice. I would enjoy a live presentation","I would need a full day on it with hands-on training","I would need some mentoring as I am ready to work on a project with this"))
names(data)[53] <- "needsurv_xlsfor"

data[, 54] <- as.character(data[, 54])
attributes(data)$variable.labels[54] <- "[Select a sampling metholodology and generate a sample out of a registration list] Tell us how interested you would be to get training for the following skills? - Surveys"
#data[, 54] <- factor(data[, 54], levels=c("no","doc","pres","trai","proj"),labels=c("Not interested by the subject or not relevant to me at the moment","Just need to check that I know what I need to know. Please send me some documentation","I would like to see it in practice. I would enjoy a live presentation","I would need a full day on it with hands-on training","I would need some mentoring as I am ready to work on a project with this"))
names(data)[54] <- "needsurv_sampl"

data[, 55] <- as.character(data[, 55])
attributes(data)$variable.labels[55] <- "[Creating queries / extracting data with SQL from proGres] Tell us how interested you would be to get training for the following skills? - Surveys"
#data[, 55] <- factor(data[, 55], levels=c("no","doc","pres","trai","proj"),labels=c("Not interested by the subject or not relevant to me at the moment","Just need to check that I know what I need to know. Please send me some documentation","I would like to see it in practice. I would enjoy a live presentation","I would need a full day on it with hands-on training","I would need some mentoring as I am ready to work on a project with this"))
names(data)[55] <- "needsurv_sql"

data[, 56] <- as.character(data[, 56])
attributes(data)$variable.labels[56] <- "[Use ArcGIS to produce static maps] Tell us how interested you would be to get training for the following skills? - Mapping"
#data[, 56] <- factor(data[, 56], levels=c("no","doc","pres","trai","proj"),labels=c("Not interested by the subject or not relevant to me at the moment","Just need to check that I know what I need to know. Please send me some documentation.","I would like to see it in practice. I would enjoy a live presentation","I would need a full day on it with hands-on training","I would need some mentoring as I am ready to work on a project with this"))
names(data)[56] <- "needmap_arcgis"

data[, 57] <- as.character(data[, 57])
attributes(data)$variable.labels[57] <- "[Use Qgis to produce static maps] Tell us how interested you would be to get training for the following skills? - Mapping"
#data[, 57] <- factor(data[, 57], levels=c("no","doc","pres","trai","proj"),labels=c("Not interested by the subject or not relevant to me at the moment","Just need to check that I know what I need to know. Please send me some documentation.","I would like to see it in practice. I would enjoy a live presentation","I would need a full day on it with hands-on training","I would need some mentoring as I am ready to work on a project with this"))
names(data)[57] <- "needmap_qgis"

data[, 58] <- as.character(data[, 58])
attributes(data)$variable.labels[58] <- "[create spatial queries in SQL with postgis] Tell us how interested you would be to get training for the following skills? - Mapping"
#data[, 58] <- factor(data[, 58], levels=c("no","doc","pres","trai","proj"),labels=c("Not interested by the subject or not relevant to me at the moment","Just need to check that I know what I need to know. Please send me some documentation.","I would like to see it in practice. I would enjoy a live presentation","I would need a full day on it with hands-on training","I would need some mentoring as I am ready to work on a project with this"))
names(data)[58] <- "needmap_postg"

data[, 59] <- as.character(data[, 59])
attributes(data)$variable.labels[59] <- "[Use ArcGISonline to produce dynamic webmaps] Tell us how interested you would be to get training for the following skills? - Mapping"
#data[, 59] <- factor(data[, 59], levels=c("no","doc","pres","trai","proj"),labels=c("Not interested by the subject or not relevant to me at the moment","Just need to check that I know what I need to know. Please send me some documentation.","I would like to see it in practice. I would enjoy a live presentation","I would need a full day on it with hands-on training","I would need some mentoring as I am ready to work on a project with this"))
names(data)[59] <- "needmap_arcon"

data[, 60] <- as.character(data[, 60])
attributes(data)$variable.labels[60] <- "[Use Mapbox to produce dynamic webmaps] Tell us how interested you would be to get training for the following skills? - Mapping"
#data[, 60] <- factor(data[, 60], levels=c("no","doc","pres","trai","proj"),labels=c("Not interested by the subject or not relevant to me at the moment","Just need to check that I know what I need to know. Please send me some documentation.","I would like to see it in practice. I would enjoy a live presentation","I would need a full day on it with hands-on training","I would need some mentoring as I am ready to work on a project with this"))
names(data)[60] <- "needmap_mapb"

data[, 61] <- as.character(data[, 61])
attributes(data)$variable.labels[61] <- "[Use OpenStreetMap for collaborative camp mapping] Tell us how interested you would be to get training for the following skills? - Mapping"
#data[, 61] <- factor(data[, 61], levels=c("no","doc","pres","trai","proj"),labels=c("Not interested by the subject or not relevant to me at the moment","Just need to check that I know what I need to know. Please send me some documentation.","I would like to see it in practice. I would enjoy a live presentation","I would need a full day on it with hands-on training","I would need some mentoring as I am ready to work on a project with this"))
names(data)[61] <- "needmap_osm"

data[, 62] <- as.character(data[, 62])
attributes(data)$variable.labels[62] <- "[Data Cleaning in Excel] Tell us how interested you would be to get training for the following skills? - Excel"
#data[, 62] <- factor(data[, 62], levels=c("no","doc","pres","trai","proj"),labels=c("Not interested by the subject or not relevant to me at the moment","Just need to check that I know what I need to know. Please send me some documentation","I would like to see it in practice. I would enjoy a live presentation","I would need a full day on it with hands-on training","I would need some mentoring as I am ready to work on a project with this"))
names(data)[62] <- "needexcel_clean"

data[, 63] <- as.character(data[, 63])
attributes(data)$variable.labels[63] <- "[Data analysis in Excel (pivot table, powerpivot)] Tell us how interested you would be to get training for the following skills? - Excel"
#data[, 63] <- factor(data[, 63], levels=c("no","doc","pres","trai","proj"),labels=c("Not interested by the subject or not relevant to me at the moment","Just need to check that I know what I need to know. Please send me some documentation","I would like to see it in practice. I would enjoy a live presentation","I would need a full day on it with hands-on training","I would need some mentoring as I am ready to work on a project with this"))
names(data)[63] <- "needexcel_pivot"

data[, 64] <- as.character(data[, 64])
attributes(data)$variable.labels[64] <- "[Data processing analysis in Excel (macro in VB script)] Tell us how interested you would be to get training for the following skills? - Excel"
#data[, 64] <- factor(data[, 64], levels=c("no","doc","pres","trai","proj"),labels=c("Not interested by the subject or not relevant to me at the moment","Just need to check that I know what I need to know. Please send me some documentation","I would like to see it in practice. I would enjoy a live presentation","I would need a full day on it with hands-on training","I would need some mentoring as I am ready to work on a project with this"))
names(data)[64] <- "needexcel_macro"

data[, 65] <- as.character(data[, 65])
attributes(data)$variable.labels[65] <- "[Data Anonymisation Techniques] Tell us how interested you would be to get training for the following skills? - Data Sharing"
#data[, 65] <- factor(data[, 65], levels=c("no","doc","pres","trai","proj"),labels=c("Not interested by the subject or not relevant to me at the moment","Just need to check that I know what I need to know. Please send me some documentation","I would like to see it in practice. I would enjoy a live presentation","I would need a full day on it with hands-on training","I would need some mentoring as I am ready to work on a project with this"))
names(data)[65] <- "needshare_anom"

data[, 66] <- as.character(data[, 66])
attributes(data)$variable.labels[66] <- "[Data Sensitivity Classification] Tell us how interested you would be to get training for the following skills? - Data Sharing"
#data[, 66] <- factor(data[, 66], levels=c("no","doc","pres","trai","proj"),labels=c("Not interested by the subject or not relevant to me at the moment","Just need to check that I know what I need to know. Please send me some documentation","I would like to see it in practice. I would enjoy a live presentation","I would need a full day on it with hands-on training","I would need some mentoring as I am ready to work on a project with this"))
names(data)[66] <- "needshare_class"

data[, 67] <- as.character(data[, 67])
attributes(data)$variable.labels[67] <- "[Data Confidentiality Guidelines] Tell us how interested you would be to get training for the following skills? - Data Sharing"
#data[, 67] <- factor(data[, 67], levels=c("no","doc","pres","trai","proj"),labels=c("Not interested by the subject or not relevant to me at the moment","Just need to check that I know what I need to know. Please send me some documentation","I would like to see it in practice. I would enjoy a live presentation","I would need a full day on it with hands-on training","I would need some mentoring as I am ready to work on a project with this"))
names(data)[67] <- "needshare_conf"

data[, 68] <- as.character(data[, 68])
attributes(data)$variable.labels[68] <- "[Using R for reproducible research] Tell us how interested you would be to get training for the following skills? - Statistics"
#data[, 68] <- factor(data[, 68], levels=c("no","doc","pres","trai","proj"),labels=c("Not interested by the subject or not relevant to me at the moment","Just need to check that I know what I need to know. Please send me some documentation","I would like to see it in practice. I would enjoy a live presentation","I would need a full day on it with hands-on training","I would need some mentoring as I am ready to work on a project with this"))
names(data)[68] <- "needstat_reproR"

data[, 69] <- as.character(data[, 69])
attributes(data)$variable.labels[69] <- "[Using R to identify data outliers ] Tell us how interested you would be to get training for the following skills? - Statistics"
#data[, 69] <- factor(data[, 69], levels=c("no","doc","pres","trai","proj"),labels=c("Not interested by the subject or not relevant to me at the moment","Just need to check that I know what I need to know. Please send me some documentation","I would like to see it in practice. I would enjoy a live presentation","I would need a full day on it with hands-on training","I would need some mentoring as I am ready to work on a project with this"))
names(data)[69] <- "needstat_outlier"

data[, 70] <- as.character(data[, 70])
attributes(data)$variable.labels[70] <- "[Using R for statistical model - regressions] Tell us how interested you would be to get training for the following skills? - Statistics"
#data[, 70] <- factor(data[, 70], levels=c("no","doc","pres","trai","proj"),labels=c("Not interested by the subject or not relevant to me at the moment","Just need to check that I know what I need to know. Please send me some documentation","I would like to see it in practice. I would enjoy a live presentation","I would need a full day on it with hands-on training","I would need some mentoring as I am ready to work on a project with this"))
names(data)[70] <- "needstat_regress"

data[, 71] <- as.character(data[, 71])
attributes(data)$variable.labels[71] <- "[Using R for multivariate analysis] Tell us how interested you would be to get training for the following skills? - Statistics"
#data[, 71] <- factor(data[, 71], levels=c("no","doc","pres","trai","proj"),labels=c("Not interested by the subject or not relevant to me at the moment","Just need to check that I know what I need to know. Please send me some documentation","I would like to see it in practice. I would enjoy a live presentation","I would need a full day on it with hands-on training","I would need some mentoring as I am ready to work on a project with this"))
names(data)[71] <- "needstat_multiva"

data[, 72] <- as.character(data[, 72])
attributes(data)$variable.labels[72] <- "[Using R for qualitative data analysis] Tell us how interested you would be to get training for the following skills? - Statistics"
#data[, 72] <- factor(data[, 72], levels=c("no","doc","pres","trai","proj"),labels=c("Not interested by the subject or not relevant to me at the moment","Just need to check that I know what I need to know. Please send me some documentation","I would like to see it in practice. I would enjoy a live presentation","I would need a full day on it with hands-on training","I would need some mentoring as I am ready to work on a project with this"))
names(data)[72] <- "needstat_quali"

data[, 73] <- as.character(data[, 73])
attributes(data)$variable.labels[73] <- "[Basic principle of datavisualisation] Tell us how interested you would be to get training for the following skills? - Infographics"
#data[, 73] <- factor(data[, 73], levels=c("no","doc","pres","trai","proj"),labels=c("Not interested by the subject or not relevant to me at the moment","Just need to check that I know what I need to know. Please send me some documentation","I would like to see it in practice. I would enjoy a live presentation","I would need a full day on it with hands-on training","I would need some mentoring as I am ready to work on a project with this"))
names(data)[73] <- "needinforaphic_dataviz"

data[, 74] <- as.character(data[, 74])
attributes(data)$variable.labels[74] <- "[Use Illustrator to produce infographics] Tell us how interested you would be to get training for the following skills? - Infographics"
#data[, 74] <- factor(data[, 74], levels=c("no","doc","pres","trai","proj"),labels=c("Not interested by the subject or not relevant to me at the moment","Just need to check that I know what I need to know. Please send me some documentation","I would like to see it in practice. I would enjoy a live presentation","I would need a full day on it with hands-on training","I would need some mentoring as I am ready to work on a project with this"))
names(data)[74] <- "needinforaphic_illus"

data[, 75] <- as.character(data[, 75])
attributes(data)$variable.labels[75] <- "[Use Excel to produce infographics] Tell us how interested you would be to get training for the following skills? - Infographics"
#data[, 75] <- factor(data[, 75], levels=c("no","doc","pres","trai","proj"),labels=c("Not interested by the subject or not relevant to me at the moment","Just need to check that I know what I need to know. Please send me some documentation","I would like to see it in practice. I would enjoy a live presentation","I would need a full day on it with hands-on training","I would need some mentoring as I am ready to work on a project with this"))
names(data)[75] <- "needinforaphic_infoexc"

data[, 76] <- as.character(data[, 76])
attributes(data)$variable.labels[76] <- "[Using Github for collaboration on code development ] Tell us how interested you would be to get training for the following skills? -  Datavisualisation"
#data[, 76] <- factor(data[, 76], levels=c("no","doc","pres","trai","proj"),labels=c("Not interested by the subject or not relevant to me at the moment","Just need to check that I know what I need to know. Please send me some documentation","I would like to see it in practice. I would enjoy a live presentation","I would need a full day on it with hands-on training","I would need some mentoring as I am ready to work on a project with this"))
names(data)[76] <- "needdataviz_github"

data[, 77] <- as.character(data[, 77])
attributes(data)$variable.labels[77] <- "[Create online interactive datavisualisation with javascript 	] Tell us how interested you would be to get training for the following skills? -  Datavisualisation"
#data[, 77] <- factor(data[, 77], levels=c("no","doc","pres","trai","proj"),labels=c("Not interested by the subject or not relevant to me at the moment","Just need to check that I know what I need to know. Please send me some documentation","I would like to see it in practice. I would enjoy a live presentation","I would need a full day on it with hands-on training","I would need some mentoring as I am ready to work on a project with this"))
names(data)[77] <- "needdataviz_d3"

