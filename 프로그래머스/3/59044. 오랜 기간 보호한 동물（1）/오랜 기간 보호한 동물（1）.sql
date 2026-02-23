-- 코드를 입력하세요
SELECT a.name, a.datetime as DATE_TIME
from animal_ins a
left join animal_outs b
    on a.animal_id = b.animal_id
where b.animal_id is null
order by DATE_TIME
limit 3