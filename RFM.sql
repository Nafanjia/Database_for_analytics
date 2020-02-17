SELECT
  b.user_id,
  b.money,
  b.orders,
  b.last_order,
  b.R,
  b.F,
  b.M,
  CONCAT(b.R,b.F,b.M) RFM,
  CASE 
    WHEN CONCAT(b.R,b.F,b.M) IN ('111','112','113') THEN 'Lost_New'
    WHEN CONCAT(b.R,b.F,b.M) IN ('121','122','123','131','132') THEN 'Lost_Regular'
    WHEN CONCAT(b.R,b.F,b.M) IN ('133') THEN 'Lost_Vip'
    WHEN CONCAT(b.R,b.F,b.M) IN ('311','312','313') THEN 'New'
    WHEN CONCAT(b.R,b.F,b.M) IN ('211','212','213','221','222','223','231','232','321','322','323','331','332') THEN 'Regular'
    WHEN CONCAT(b.R,b.F,b.M) IN ('233','333') THEN 'Vip'
  ELSE 'kek' END AS 'RFM_Group'
FROM(
SELECT
  a.user_id,
  CASE 
    WHEN TIMESTAMPDIFF(DAY,a.last_order,date('2018-01-01')) <= 30 THEN 3
    WHEN TIMESTAMPDIFF(DAY,a.last_order,date('2018-01-01')) >= 60 THEN 1
  ELSE 2 END AS R,
  CASE
    WHEN a.orders >= 48 THEN 3
    WHEN a.orders <= 3 THEN 1
  ELSE 2 END AS F,
  CASE
    WHEN a.money >= 96000 THEN 3
    WHEN a.money <= 6000 THEN 1
  ELSE 2 END AS M,
  a.orders,
  a.money,
  a.last_order
FROM(
SELECT
  user_id,
  COUNT(id_o) orders,
  SUM(price) money,
  MAX(o_date) last_order
FROM orders_20190822
GROUP BY user_id) a) b