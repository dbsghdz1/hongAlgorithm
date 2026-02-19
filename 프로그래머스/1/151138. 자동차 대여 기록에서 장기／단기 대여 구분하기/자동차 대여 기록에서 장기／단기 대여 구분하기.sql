-- 코드를 입력하세요
SELECT history_id, car_id, date_format(start_date, '%Y-%m-%d'), date_format(end_date, '%Y-%m-%d'), IF(DATEDIFF(end_date, start_date) + 1 >= 30,
       '장기 대여',
       '단기 대여') AS rent_type
from car_rental_company_rental_history
WHERE start_date >= '2022-09-01'
  AND start_date < '2022-10-01'
order by history_id desc