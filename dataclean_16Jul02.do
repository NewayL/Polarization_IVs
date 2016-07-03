* This do file is written to clean the HH and tariff data that can be used in regressions
* Written by: Yawen Liang
* Last updated: Jul 2nd, 2016
*******************************************************************************************************************

clear
set more off
cd "C:\PhD Study\Year 3\Projects\Job Porlarization\Arranged Files"

*** prepare the tariff data
use "data\input\WITS\Indn_tariff9006.dta",clear
keep if year==1990|year==1997|year==1996|year==2002|year==2006
joinby isic3_2d using "C:\PhD Study\Year 3\Projects\Job Porlarization\Arranged Files\unicode\industry\LFSind_ISIC3_2d_refine.dta"

replace LFSind = 27 if LFSind>=24 & LFSind<=26
collapse (mean) avgtariff (first) LFS_descrip, by(LFSind year)
save "data\output\exptariff_LFSind.dta",replace


*****************************************************************************
* 1. use HH data to compute initial labor shares in each industry-region cell
*****************************************************************************
use "data\output\HH9006_15Aug30.dta",clear /* generated by "LFS94006_15Aug30.do" */

*********************************************** clean the data *******************************************************
* wage reported
gen dwage = 0
replace dwage=1 if wage>10000 & wage!=.
replace dwage=0 if wage>=9999990
* primary age workers
gen dage = 0
replace dage = 1 if age>15 & age<=60
* full time worker
replace workhour_week=. if workhour_week==998|workhour_week==999
gen dfull = 0
replace dfull = 1 if workhour_week>35& workhour_week!=.

* focus on full-time workers
*drop if workhour_week<35& workhour_week!=.

* active workers
gen dwork = 0
replace dwork = 1 if workhour_week!=. & workhour_week!=0
replace dwork = 0 if workhour_week==998|workhour_week==999

* working industry defined 	
gen dind = 0
replace dind=1 if LFSind!=99 & LFSind!=. & LFSind!=98

* working occupation defined
gen docc = 0
replace docc = 1 if isco68_2d!=99 & isco68_2d!=.
replace docc = 1 if isco68_3d!=999 & isco68_3d!=.

* exclude self employed 
gen demp = 0
replace demp = 1 if emp>=3 & year<=2000
replace demp = 1 if emp>=2 & emp<7 & year>2000

* focus on primary age active workers with defined working industry and occupation
gen dall = dage*dwork*dind*docc*demp

drop if dall!=1

*** drop agriculture workers
* drop farmers
*drop if isco68_2d==61
* drop other agriculture workers
*drop if isco68_2d>=62 & isco68_2d<=64

*** or define agriculture workers as manual workers
*replace manual = 1 if isco68_2d>=61 & isco68_2d<=64
*replace routine = 0 if isco68_2d>=61 & isco68_2d<=64
*replace abstract = 0 if isco68_2d>=61 & isco68_2d<=64

* drop street venders
drop if isco68_2d==45

save "data\temp\HH9006_15Aug30_cln.dta",replace
