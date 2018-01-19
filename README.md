### R-Monthly-Expander
Expand Dates in data.table 

- Takes each employee's start date to end date and expands it by month.
- Then counts how many months from the start date and end date.
- Then divides each employee's fee by the number of months to evenly distribute to each month.

##### Cran Repository packages
```
library(readxl)
library(plyr)
library(dtplyr)
library(dplyr)
library(lubridate)
library(data.table)
library(timeDate)
library(readr)
library(zoo)
```
| Original Table | Expanded Table | Final Table |
| ------------- |:-------------:| -----|
| Original table that displays emplyee names, start and end dates, and fees| Expanded view that displays the expanded months for each employee, a count of how many months between each start and end dates and divided fees | Final table only displays each month, evenly distributed fees and employee name |
| <img src="https://github.com/JacqBlaq/R-Monthly-Expander/blob/master/detanglerPics/Original_table-1.jpg" border="1" width="250px"/> | <img src="https://github.com/JacqBlaq/R-Monthly-Expander/blob/master/detanglerPics/Expanded_table-1.jpg" border="1" width="400px"/> | <img src="https://github.com/JacqBlaq/R-Monthly-Expander/blob/master/detanglerPics/Final_table-1.jpg" border="1" width="275px"/> |
