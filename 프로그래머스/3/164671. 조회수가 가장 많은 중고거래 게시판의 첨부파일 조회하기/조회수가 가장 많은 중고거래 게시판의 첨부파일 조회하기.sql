-- 코드를 입력하세요
SELECT CONCAT('/home/grep/src/', b.board_id, '/', b.file_id, b.file_name, b.file_ext) AS file_path
FROM used_goods_board a
JOIN used_goods_file b
  ON a.board_id = b.board_id
WHERE a.views = (SELECT MAX(views) FROM used_goods_board)
ORDER BY b.file_id DESC;
