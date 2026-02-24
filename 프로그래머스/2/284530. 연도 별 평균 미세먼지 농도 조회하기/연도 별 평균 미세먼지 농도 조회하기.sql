-- 코드를 작성해주세요
select YEAR(ym) as year,
    Round(avg(pm_val1), 2) as pm10,
    Round(avg(pm_val2), 2) as `pm2.5`
from air_pollution
where location2 = '수원'
group by year
order by year