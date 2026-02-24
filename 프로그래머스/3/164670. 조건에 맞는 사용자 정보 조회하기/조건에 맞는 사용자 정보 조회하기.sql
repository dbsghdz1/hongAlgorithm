-- 코드를 입력하세요
SELECT b.user_id,
    b.nickname,
    concat(b.city, ' ', b.street_address1, ' ', b.street_address2) as 전체주소,
    CONCAT(
        SUBSTRING(b.tlno,1,3),'-',
        SUBSTRING(b.tlno,4,4),'-',
        SUBSTRING(b.tlno,8,4)
    ) AS 전화번호
from used_goods_board a
    join used_goods_user b
    on a.writer_id = b.user_id
GROUP BY b.user_id, b.nickname, b.city, b.street_address1, b.street_address2, b.tlno
having count(*) >= 3
order by b.user_id desc