-- 코드를 입력하세요
SELECT HOUR(DATETIME) as HOUR, Count(*) as COUNT
from animal_outs
where HOUR(DATETIME) >= '9' and HOUR(DATETIME) <= '19'
group by HOUR
order by hour