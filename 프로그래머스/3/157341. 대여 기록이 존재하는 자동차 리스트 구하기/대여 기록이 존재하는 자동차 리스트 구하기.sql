-- 코드를 입력하세요
SELECT a.car_id as CAR_ID
from CAR_RENTAL_COMPANY_CAR a
    join CAR_RENTAL_COMPANY_RENTAL_HISTORY b
    on a.car_id = b.car_id
where a.CAR_TYPE like '세단' and month(b.START_DATE) like '10'
group by a.car_id
order by car_id desc