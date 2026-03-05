-- 코드를 입력하세요
SELECT b.apnt_no, a.pt_name, a.pt_no, b.mcdp_cd, c.dr_name, b.apnt_ymd
from patient a
join (
    select mcdp_cd, apnt_no, apnt_ymd, mddr_id, pt_no, APNT_CNCL_YN
    from appointment
    where mcdp_cd = 'CS' and month(apnt_ymd) = 4 and day(apnt_ymd) = 13 and APNT_CNCL_YN = 'N'
) b
on a.pt_no = b.pt_no
join doctor c
on b.mddr_id = c.dr_id
order by b.apnt_ymd