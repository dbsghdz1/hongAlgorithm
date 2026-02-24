-- 코드를 입력하세요
SELECT board_id, writer_id, title, price,
    case 
        when `STATUS` = 'Done' then '거래완료'
        when `STATUS` = 'sale' then '판매중'
        when `STATUS` = 'RESERVED' then '예약중'
    end as status
from used_goods_board
where month(created_date) = '10' and day(created_date) = '5' and year(created_date) = '2022'
order by board_id desc