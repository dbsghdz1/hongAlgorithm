-- 코드를 입력하세요
SELECT member_id, member_name, gender, date_format(date_of_birth, '%Y-%m-%d')
from member_profile
where month(date_of_birth) like '3' and gender like 'W' and TLNO is not null
order by member_id