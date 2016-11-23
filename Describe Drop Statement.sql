DROP DATABASE IF EXISTS processor;
CREATE DATABASE processor;
USE processor;

CREATE TABLE chip (
  chip_series           VARCHAR(45) NOT NULL DEFAULT 0 AUTO_INCREMENT,
  chip_number           VARCHAR(45) NOT NULL DEFAULT 0,
  chip_manufacturer     VARCHAR(45) NOT NULL DEFAULT 0,
  chip_number_of_core   INT         DEFAULT  NULL,
  chip_number_of_thread INT         DEFAULT  NULL,
  chip_basefrq          DOUBLE      DEFAULT  NULL,
  chip_maxfrq           DOUBLE      DEFAULT  NULL,
  chip_cache            DOUBLE      DEFAULT  NULL,
  PRIMARY KEY (chip_manufacturer, chip_number, chip_series)
);

CREATE TEMPORARY TABLE temp_chip(
  chip_series           VARCHAR(45) NOT NULL DEFAULT 0 AUTO_INCREMENT,
  chip_number           VARCHAR(45) NOT NULL DEFAULT 0,
  chip_manufacturer     VARCHAR(45) NOT NULL DEFAULT 0,
  chip_number_of_core   INT         DEFAULT  NULL,
  chip_number_of_thread INT         DEFAULT  NULL,
  chip_basefrq          DOUBLE      DEFAULT  NULL,
  chip_maxfrq           DOUBLE      DEFAULT  NULL,
  chip_cache            DOUBLE      DEFAULT  NULL,
  PRIMARY KEY (chip_manufacturer, chip_number, chip_series)
);

INSERT INTO chip VALUES ("i7", "5550U", "Intel", 2, 4, 2.00, 3.00, 4);
INSERT INTO chip VALUES ("i5", "5200U", "Intel", 2, 4, 2.20, 2.70, 3);
INSERT INTO chip VALUES ("Pentium", "N3540", "Intel", 4, 4, 2.16, 2.66, 2);
INSERT INTO chip VALUES ("FX", "9590", "AMD", 8, 8, 4.70, 5.00, 8);

SELECT * FROM chip;
SELECT * FROM temp_chip;
DESCRIBE chip;
DROP TABLE chip;