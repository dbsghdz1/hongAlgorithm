-- 코드를 입력하세요
SELECT animal_type, count(*)
from animal_ins
where animal_type like 'Dog' or animal_type like 'Cat'
group by animal_type
order by animal_type