-- 코드를 입력하세요
SELECT round(sum(daily_fee) / count(daily_fee), 0) as AVERAGE_FEE
from CAR_RENTAL_COMPANY_CAR
where car_type like 'SUV'