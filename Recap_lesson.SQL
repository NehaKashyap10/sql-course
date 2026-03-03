SELECT Distinct [type]  FROM airports


select * from airports where type= 'large_airport'



SELECT
    a.name
    ,a.latitude_deg
    ,a.longitude_deg
    ,a.iata_code
    ,a.elevation_ft
    ,ROUND (a.elevation_ft /3.28, 1) as elevation_M
    ,a.iso_country
FROM
    airports a
WHERE a.[type]= 'large_airport'
    AND a.continent ='EU'
    AND a.iso_country IN ('GB','FR')
 ---   AND a.latitude_deg between 51 and 54
ORDER BY a.name 


---- Which 5 regions have the most airports?
SELECT
    TOP 5
    a.iso_country
    ,count(*) AS total_airports
FROM
    airports a
GROUP BY a.iso_country
ORDER BY count(*) DESC