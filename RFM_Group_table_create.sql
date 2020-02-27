--
-- Установка базы данных по умолчанию
--
USE database1;

--
-- Создать таблицу `orders_20190822`
--
CREATE TABLE rfm_orders_20190822 (
  user_id int DEFAULT NULL,
  money double DEFAULT NULL,
  orders int DEFAULT NULL,
  last_order date DEFAULT NULL,
  R int DEFAULT NULL,
  F int DEFAULT NULL,
  M int DEFAULT NULL,
  RFM varchar(3) DEFAULT NULL,
  RFM_Group varchar(64) DEFAULT NULL
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 45,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci;

--
-- Создать индекс `IDX_rfm_orders_20190822_RFM_Group` для объекта типа таблица `rfm_orders_20190822`
--
ALTER TABLE rfm_orders_20190822
ADD INDEX IDX_rfm_orders_20190822_RFM_Group (RFM_Group);