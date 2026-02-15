-- 코드를 입력하세요
SELECT MCDP_CD AS 진료과코드, count(*) AS 5월예약건수
from appointment
where apnt_ymd >= '2022-05-01' and apnt_ymd < '2022-06-01'
group by mcdp_cd
order by 5월예약건수 asc, 진료과코드