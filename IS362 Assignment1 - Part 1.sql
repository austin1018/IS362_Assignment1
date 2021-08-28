
# 1. How many airplanes have listed speeds? 
SELECT COUNT(*) NumberOfAirplanesListedSpeeds FROM planes WHERE speed is not null;

# What is the minimum listed speed and the maximum listed speed?
SELECT MIN(speed) MinimumListedSpeed,MAX(speed) MaxListedSpeed FROM planes;

# 2. What is the total distance flown by all of the planes in January 2013? 
SELECT SUM(distance) TotalDistance FROM flights where year=2013 and month=1;
# What is the total distance flown by all of the planes in January 2013 where the tailnum is missing?
SELECT SUM(distance) TotalDistance FROM flights where year=2013 and month=1 and tailnum='';

# 3. What is the total distance flown for all planes on July 5, 2013 grouped by aircraft manufacturer? 
# Write this statement first using an INNER JOIN, then using a LEFT OUTER JOIN. How do your results compare?
select manufacturer,SUM(distance) TotalDistance from flights a inner join planes b on a.tailnum=b.tailnum where a.year=2013 and a.month=7 and a.day=5 GROUP BY manufacturer order by 1;
select manufacturer,SUM(distance) TotalDistance from flights a LEFT join planes b on a.tailnum=b.tailnum where a.year=2013 and a.month=7 and a.day=5  GROUP BY manufacturer order by 1;
# The difference is there is one more "Null" row in left join result.

# 4. Write and answer at least one question of your own choosing that joins information from at least three of the tables in the flights database.
# Question: What is the total distance flown for all planes on July 5, 2013 grouped by airline and manufaturer?
select c.name airline,manufacturer,SUM(distance) TotalDistance from flights a 
inner join planes b on a.tailnum=b.tailnum 
inner join airlines c on c.carrier=a.carrier
where a.year=2013 and a.month=7 and a.day=5 GROUP BY manufacturer order by 1,2;
