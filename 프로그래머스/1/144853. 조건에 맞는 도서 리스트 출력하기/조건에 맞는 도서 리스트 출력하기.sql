-- 코드를 입력하세요
SELECT BOOK_ID, date_format(PUBLISHED_DATE, '%Y-%m-%d') as PUBLISHED_DATE
from book
where CATEGORY like '인문' and YEAR(PUBLISHED_DATE) like 2021
order by PUBLISHED_DATE
