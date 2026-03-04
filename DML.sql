-- Day - 3
-- DML COMMANDS

 -- (1- Manual entry(values))
INSERT INTO customers(id, first_name, country, score)
VALUES
	(6,'Anna','USA', NULL),
    (7,'Sam',NULL,100);
    
    SELECT * FROM customers;

-- (2- INSERTR using SELECT)

-- 2. Copy data from 'customers' table into 'perrsons'

INSERT INTO persons(id,person_name,birth_date,phone)
SELECT 
id,
first_name,
NULL,
'Unknown'
FROM customers;

-- UPDATE 

-- 3. Change the score of customer 6 to 0 

UPDATE customers
SET score = 0
WHERE  id = 6;

-- SELECT *
-- FROM customers
-- WHERE id = 6;

 /* 4. Change the score of customer 10 to 0
 and update the country to UK */
 
UPDATE customers
SET score  = 0,
 country = 'UK'
WHERE id = 7;

SELECT * FROM customers;

/* 5. Update all customers with a NULL score 
by setting their score to 0 */

UPDATE customers
SET score = 0
	WHERE score IS NULL;
    
    
    -- DELETE
-- Delete all customers with an ID greater than 5.

DELETE FROM customers
WHERE id > 5;
    
--    SELECT *
--    FROM customers
--    WHERE id > 5;

TRUNCATE TABLE persons;


    
    
