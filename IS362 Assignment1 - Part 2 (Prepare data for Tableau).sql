

select b.name Airport,avg(dep_delay) AverageDepartureDelay 
from flights a
join airports b on a.origin=b.faa
where origin in ('JFK','LGA','EWR') and year=2013
group by b.name
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/PreparedData.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';

