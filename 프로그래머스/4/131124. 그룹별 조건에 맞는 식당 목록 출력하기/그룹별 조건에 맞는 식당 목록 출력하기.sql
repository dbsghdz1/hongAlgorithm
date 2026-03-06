-- 코드를 입력하세요
SELECT m.member_name, rr.review_text, date_format(rr.review_date, '%Y-%m-%d') as review_date
from member_profile m
join (
    select member_id, review_text, review_date
    from rest_review
    group by member_id
    order by count(*) desc
    limit 1
) as r
on m.member_id = r.member_id
join rest_review rr
on r.member_id = rr.member_id
order by review_date, review_text




