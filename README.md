# SEC Financial Statements and Notes Data Sets
  
This repository contains data sets and test results for the SEC Financial Statements and Notes (SEC FS&N) project.

## Directory Structure  
Repository Download: [OneDrive](https://1drv.ms/f/s!Aqm-BwLD86xdgfWOZqv35hgO7gDdbT0?e=EMHeei)    
The repository has the following structure:  
sec-financial-statements-and-notes-data-sets  
│   bs-cf-is-tests.sql  
│   table-row-count.png  
│  
├───bs-cf-is-explain  
├──────bs.jpg  
├──────cf.jpg  
├──────is.jpg  
│  
├───bs-cf-is-stats  
├──────bs-stats.png  
├──────cf-stats.png  
├──────is-stats.png  
│  
├───bs-cf-is-tests  
├──────bs-cf-is-test1  
│   ├──────bsTest_1.png  
│   ├──────cfTest_1.png  
│   ├──────isTest_1.png  
│   │  
│   ├───bs-cf-is-test2  
│   ├──────bsTest_2.png  
│   ├──────cfTest_2.png  
│   ├──────isTest_2.png  
│   │  
│   ├───bs-cf-is-test3  
│   ├──────bsTest_3.png  
│   ├──────cfTest_3.png  
│   ├──────isTest_3.png  
│   │  
│   ├───bs-cf-is-test4  
│   ├──────bsTest_4.png  
│   ├──────cfTest_4.png  
│   └──────isTest_4.png  
│  
├───docker-sql-server-bak-zip  
├──────1-zip-split-size.png  
├──────2-bak-backup-size.png  
├──────3-mdf-ldf-import-size.png  
├──────secfsds.bak.z01  
├──────secfsds.bak.z02  
└──────secfsds.bak.zip 
## bs-cf-is-tests
  
This directory contains images comparing the test results with the actual values shown on the sec.gov website for 10-K filings for Apple and Microsoft (2 examples each).  
  
## bs-cf-is-stats
  
This directory contains images of the statistics of each of the statement queries (BS, IS, CF). 
Example of BS query stats:    
![balance-sheet-query-stats](https://github.com/TranDenyDFW/sec-financial-statements-and-notes-data-sets/blob/main/bs-cf-is-stats/bs-stats.png)
  
## bs-cf-is-explain
  
This directory contains images of the explain plan for each of the statement queries, similar to the explain plan in SSMS.   
    
## docker-sql-server-bak-zip
  
This directory contains the the zipped (download all three files and unzip ONLY the .zip file) MSFT SQL Server .bak file.  
The images show the file's size when zipped, when unzipped, and when imported as LDF and MDF files.  
ZIPPED (approx 50GB, split into 20GB+20GB+10GB)  
![zipsize](https://github.com/TranDenyDFW/sec-financial-statements-and-notes-data-sets/blob/main/docker-sql-server-bak-zip/1-zip-split-size.png)  
UNZIPPED BAK (approx 500GB)
![baksize](https://github.com/TranDenyDFW/sec-financial-statements-and-notes-data-sets/blob/main/docker-sql-server-bak-zip/2-bak-backup-size.png)  
IMPORTED MDF/LDF (approx 1TB)  
![importsize](https://github.com/TranDenyDFW/sec-financial-statements-and-notes-data-sets/blob/main/docker-sql-server-bak-zip/3-mdf-ldf-import-size.png)  
Download Zipped Files Here: [OneDrive](https://1drv.ms/f/s!Aqm-BwLD86xdgfWOZqv35hgO7gDdbT0?e=EMHeei)  
  
