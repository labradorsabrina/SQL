SELECT
  *
FROM
  cars.car_info;

SELECT
  COUNT (*)
FROM
  cars.car_info;

SELECT
  DISTINCT(fuel_type)
FROM
  cars.car_info;

SELECT
  length
FROM
  cars.car_info
ORDER BY
  length;

SELECT
  MIN(length) AS min_length,
  MAX(length) AS max_length
FROM
  cars.car_info;

--Missing values
SELECT
  *
FROM
  cars.car_info 
WHERE num_of_doors IS NULL;

--Fix dodge sedan
SELECT
  make,
  fuel_type,
  num_of_doors,
  body_style
FROM
  cars.car_info
WHERE
  make = "dodge"
  AND fuel_type = "gas"
  AND body_style = "sedan";

--Update the real num_of_doors for dodge sedan
UPDATE
  cars.car_info
SET
  num_of_doors = "four"
WHERE
  make = "dodge"
  AND fuel_type = "gas"
  AND body_style = "sedan";

--Fix mazda sedan missing values
SELECT
  make,
  fuel_type,
  num_of_doors,
  body_style
FROM
  cars.car_info
WHERE
  make = "mazda"
  AND fuel_type = "diesel"
  AND body_style = "sedan";

--Update the real num_of_doors for mazda sedan diesel
UPDATE
  cars.car_info
SET
  num_of_doors = "four"
WHERE
  make = "mazda"
  AND fuel_type = "diesel"
  AND body_style = "sedan";

--Check erroneous data
SELECT
  DISTINCT(num_of_cylinders)
FROM
  cars.car_info;

--Fix: Replace tow for two
UPDATE
  cars.car_info
SET
  num_of_cylinders = "two"
WHERE
  num_of_cylinders = "tow";

--Inspect the compression_ratio column
SELECT
  MIN(compression_ratio) AS min_compression_ratio,
  MAX(compression_ratio) AS max_compression_ratio
FROM
  cars.car_info;

--According to the data description, the compression_ratio column values should range from 7 to 23.
SELECT
  compression_ratio
FROM
  cars.car_info
ORDER BY
  compression_ratio DESC;

SELECT
  *
FROM
  cars.car_info
WHERE
  compression_ratio = 70;

--Note:  If you are deleting no more than 20% of the data rows, then your results should be fine.
DELETE
FROM
  cars.car_info
WHERE
  compression_ratio = 70;

--Inspect the price column
SELECT
  MIN(price) AS min_price,
  MAX(price) AS max_price
FROM
  cars.car_info;

--According to the data description, prices should not go below 5,118
SELECT
  price
FROM
  cars.car_info
ORDER BY
  price ASC;

SELECT
  *
FROM
  cars.car_info
WHERE
  price = 0;

SELECT
  AVG(price) AS average_price
FROM
  cars.car_info;

--Mean imputation is a method in which erroneous values in a column 
--are replaced by the mean (or average) of the other values in that column. 
--This method maintains the dataset size, but some important statistics like 
--variance and standard deviation tend to be minimized.
UPDATE
  cars.car_info
SET
  price = 12978
WHERE
  price = 0;

--Check for data inconsistencies in the drive_wheels column
SELECT
  DISTINCT drive_wheels
FROM
  cars.car_info;

--4wd appears twice
SELECT
  drive_wheels,
  LENGTH(drive_wheels) AS length_drive_wheels
FROM
  cars.car_info
GROUP BY
  drive_wheels;

--Fix inconsistency
UPDATE 
  cars.car_info
SET
  drive_wheels = TRIM(drive_wheels)
WHERE
  LENGTH(drive_wheels) > 3;