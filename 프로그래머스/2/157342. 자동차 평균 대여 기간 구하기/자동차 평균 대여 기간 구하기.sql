-- 코드를 입력하세요
SELECT car_id, round(avg(datediff(end_date, start_date) + 1), 1) as average_duration
from car_rental_company_rental_history
GROUP BY car_id
HAVING avg(datediff(end_date, start_date) + 1) >= 7
order by average_duration  desc, car_id desc
