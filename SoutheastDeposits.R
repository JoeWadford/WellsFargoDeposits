# WELLS FARGO DEPOSITS
## Imports and cleaning Data

### Importing datasets from datazar into R

setwd('C:/Users/joewa/OneDrive/Documents/Quant Boot Camp/Tableaus/Wells Fargo Deposits')
getwd()
NC <- read.csv("./North_Carolina_Wells_Fargo_Bank_Deposits.csv")
SC <- read.csv("./South_Carolina_Wells_Fargo_Bank_Deposits.csv")
GA <- read.csv("./Georgia_Wells_Fargo__Bank_Deposits.csv")
MS <- read.csv("./Mississippi_Wells_Fargo__Bank_Deposits.csv")
FL <- read.csv("./Florida_Wells_Fargo__Bank_Deposits.csv")
MD <- read.csv("./Maryland_Wells_Fargo__Bank_Deposits.csv")
TN <- read.csv("./Tennessee_Wells_Fargo_Bank_Deposits.csv")
VA <- read.csv("./Virginia_Wells_Fargo_Bank_Deposits.csv")
AL <- read.csv("./Alabama_Wells_Fargo_Bank_Deposits.csv")

### Adding state column for analysis in Tableau
NC$State <- 'North Carolina'
SC$State <- 'South Carolina'
GA$State <- 'Georgia'
MS$State <- 'Mississippi'
FL$State <- 'Florida'
MD$State <- 'Maryland'
TN$State <- 'Tennessee'
VA$State <- 'Virginia'
AL$State <- 'Alabama'

### Changing column names into more manageable names
#### Checking columnn names at first then renaming then checking work

colnames(NC)
colnames(NC)[2:3] <- c("Bank Deposits 2015","Bank Deposits 2014")
colnames(NC)

colnames(SC)
colnames(SC)[2:3] <- c("Bank Deposits 2015","Bank Deposits 2014")
colnames(SC)

colnames(GA)
colnames(GA)[2:3] <- c("Bank Deposits 2015", "Bank Deposits 2014")
colnames(GA)

colnames(MS)
colnames(MS)[2:3] <- c("Bank Deposits 2015", "Bank Deposits 2014")
colnames(MS)

colnames(FL)
colnames(FL)[2:3] <- c("Bank Deposits 2015", "Bank Deposits 2014")
colnames(FL)

colnames(MD)
colnames(MD)[2:3] <- c("Bank Deposits 2015", "Bank Deposits 2014")
colnames(MD)

colnames(TN)
colnames(TN)[2:3] <- c("Bank Deposits 2015", "Bank Deposits 2014")
colnames(TN)

colnames(VA)
colnames(VA)[2:3] <- c("Bank Deposits 2015", "Bank Deposits 2014")
colnames(VA)

colnames(AL)
colnames(AL)[2:3] <- c("Bank Deposits 2015", "Bank Deposits 2014")
colnames(AL)

### tidying data into a narrow dataset
#### NC, SC, GA, MS, FL, MD, TN, VA, AL
#### 7 Columns =  AL, FL, GA, MD, 

NC <- NC
SC <- SC
GA <- GA[,-c(4:6)]
MS <- MS
FL <- FL[,-c(4:6)]
MD <- MD[,-c(4:6)]
TN <- TN
VA <- VA
AL <- AL[,-c(4:6)]


#### adding year
#### NC, SC, GA, MS, FL, MD, TN, VA, AL
NC1 <- NC[,c(1,2,4)]
SC1 <- SC[,c(1,2,4)]
GA1 <- GA[,c(1,2,4)]
MS1 <- MS[,c(1,2,4)]
FL1 <- FL[,c(1,2,4)]
MD1 <- MD[,c(1,2,4)]
TN1 <- TN[,c(1,2,4)]
VA1 <- VA[,c(1,2,4)]
AL1 <- AL[,c(1,2,4)]

NC2 <- NC[,c(1,3,4)]
SC2 <- SC[,c(1,3,4)]
GA2 <- GA[,c(1,3,4)]
MS2 <- MS[,c(1,3,4)]
FL2 <- FL[,c(1,3,4)]
MD2 <- MD[,c(1,3,4)]
TN2 <- TN[,c(1,3,4)]
VA2 <- VA[,c(1,3,4)]
AL2 <- AL[,c(1,3,4)]

NC1$Year <- 2015
SC1$Year <- 2015
GA1$Year <- 2015
MS1$Year <- 2015
FL1$Year <- 2015
MD1$Year <- 2015
TN1$Year <- 2015
VA1$Year <- 2015
AL1$Year <- 2015

NC2$Year <- 2014
SC2$Year <- 2014
GA2$Year <- 2014
MS2$Year <- 2014
FL2$Year <- 2014
MD2$Year <- 2014
TN2$Year <- 2014
VA2$Year <- 2014
AL2$Year <- 2014

#### NC, SC, GA, MS, FL, MD, TN, VA, AL

colnames(NC1)[2] <- "Bank Deposits"
colnames(SC1)[2] <- "Bank Deposits"
colnames(GA1)[2] <- "Bank Deposits"
colnames(MS1)[2] <- "Bank Deposits"
colnames(FL1)[2] <- "Bank Deposits"
colnames(MD1)[2] <- "Bank Deposits"
colnames(TN1)[2] <- "Bank Deposits"
colnames(VA1)[2] <- "Bank Deposits"
colnames(AL1)[2] <- "Bank Deposits"

colnames(NC2)[2] <- "Bank Deposits"
colnames(SC2)[2] <- "Bank Deposits"
colnames(GA2)[2] <- "Bank Deposits"
colnames(MS2)[2] <- "Bank Deposits"
colnames(FL2)[2] <- "Bank Deposits"
colnames(MD2)[2] <- "Bank Deposits"
colnames(TN2)[2] <- "Bank Deposits"
colnames(VA2)[2] <- "Bank Deposits"
colnames(AL2)[2] <- "Bank Deposits"


SoutheastDeposits <- do.call("rbind", list(NC1,SC1,GA1,MS1,FL1,MD1,TN1,VA1,AL1,NC2,SC2,GA2,MS2,FL2,MD2,TN2,VA2,AL2))
SoutheastDeposits <- na.omit(SoutheastDeposits)
colnames(SoutheastDeposits)

CountyFreq <- data.frame(table(SoutheastDeposits$County))
DupCountys <- CountyFreq[CountyFreq$Freq>2,]

write.csv(SoutheastDeposits, file = "SoutheastDeposits.csv") 
write.csv(DupCountys, file='DupCountys.csv')
