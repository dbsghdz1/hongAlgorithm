-- 코드를 작성해주세요
select ID, email, first_name, last_name
from developer_infos
where skill_1 like 'Python' or skill_2 like 'Python' or skill_3 like 'Python'
order by ID