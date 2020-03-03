INSERT INTO two
SELECT pars.f_p,pars.s_p,COUNT(pars.ORDER_ID)
FROM(
SELECT distinct f.ORDER_ID,  f.PRODUCT_ID f_p,  s.PRODUCT_ID s_p
FROM basket_20190922 f
JOIN (SELECT  ORDER_ID,  PRODUCT_ID,  QUANTITY,  PRICE
FROM basket_20190922) s ON s.ORDER_ID = f.ORDER_ID
where f.PRODUCT_ID <> s.PRODUCT_ID) pars
GROUP BY pars.f_p,pars.s_p
HAVING COUNT(pars.ORDER_ID) > 10


