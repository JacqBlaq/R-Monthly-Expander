library(readxl)
library(plyr)
library(dtplyr)
library(dplyr)
library(lubridate)
library(data.table)
library(timeDate)
library(readr)
library(zoo)

ptm <- proc.time() #Begin timing

#Read CSV file
readTable <- read_csv("~/GitHub/Detangler/Mock_List.csv",
                      col_types = cols(StartDate = col_date(format = "%m/%d/%Y"),
                                       EndDate = col_date(format = "%m/%d/%Y")
                      )#cols
)#read_csv

#Expand Each Month from the start date to the end date
expandedMonths <- setDT(readTable)[,
                                   list(
                                         xMonths = seq.Date(
                                               as.Date(timeFirstDayInMonth(StartDate, format = "%Y-%m-%d")),
                                               as.Date(timeLastDayInMonth(EndDate, format = "%Y-%m-%d")),
                                               by = "month"
                                         )#seq.Date
                                   ),#list
                                   by = list(
                                         SalesforceName,
                                         StartDate,
                                         EndDate, 
                                         Fee
                                   )#list
                                   ]#setDT

#Do a count of how many months between the start date and end date of each name
expandedMonths = expandedMonths[,
                                countOfMonths := 12 * as.numeric(
                                      as.yearmon(
                                            EndDate, "%Y-%m-%d"
                                      ) - as.yearmon(
                                            StartDate, "%Y-%m-%d"
                                      )#as.yearmon
                                )#as.numeric
                                ]#expandedMonths

#Divide the fee for each salesforceName by how many months are inbetween the start and end date
#to splt the cost evenly between each month
expandedMonths = expandedMonths[,dividedFee := Fee/countOfMonths]

#Create the final table to display only the expanded months, divided fee, and salesforceName
finalTable <- select(expandedMonths, xMonths, dividedFee, SalesforceName)

proc.time() - ptm #print out runtime 