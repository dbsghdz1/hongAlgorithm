-- 코드를 입력하세요
SELECT b.user_id, b.nickname, sum(a.price) as total_sales
from USED_GOODS_BOARD a
    join USED_GOODS_USER b
    on a.writer_id = b.user_id
WHERE a.STATUS = 'DONE'
group by b.user_id, b.nickname
HAVING SUM(a.PRICE) >= 700000
order by total_sales