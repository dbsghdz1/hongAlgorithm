-- 코드를 입력하세요
SELECT a.animal_id, a.animal_type, a.name
from animal_ins a
join (
    select animal_id, sex_upon_intake
    from animal_ins
    where sex_upon_intake not like 'Spayed%' and sex_upon_intake not like 'Neutered%'
) b
on a.animal_id = b.animal_id
join (
    select animal_id, sex_upon_outcome
    from animal_outs
    where sex_upon_outcome like 'Spayed%' or sex_upon_outcome like 'Neutered%'
) c
on b.animal_id = c.animal_id
order by a.animal_id
