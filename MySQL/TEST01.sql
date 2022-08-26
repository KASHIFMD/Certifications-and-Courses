SELECT * FROM sql_store.orders;
use sql_store;
SELECT customer_id, customer_id*10-9 ,first_name from customers;
SELECT customer_id, customer_id*10-9 as modified ,first_name from customers;
SELECT customer_id, customer_id*10-9 as 'modi fied' ,first_name from customers;
SELECT * from customers;
SELECT distinct state from customers;
select name, unit_price, unit_price*1.1 AS 'new price' from products;
select * from orders;
select * from orders where order_date LIKE  '2018%';
SELECT * FROM customers;
SELECT * FROM customers where points>2000  union select * from customers where points<1000;
-- SELECT * FROM customers where NOT (points>2000) intersection select * from customers where NOT (points<1000);
SELECT * FROM customers where points>2000 UNION select * from customers where NOT (points<3000); -- meaning less
select * from order_items where order_id=6 and (quantity*unit_price)>30;
-- SELECT * FROM customers WHERE state = 'VA' OR state ='GA' OR state = 'FL' 
-- Short form of above method used here.

SELECT * FROM Customers WHERE state IN ('VA' ,'GA','FL' );
SELECT * FROM Customers WHERE state NOT IN ('VA' ,'GA','FL'); 
SELECT  * FROM products WHERE quantity_in_stock IN (49,72,38);
SELECT * FROM customers WHERE points BETWEEN 1000 AND 2000;
SELECT * FROM customers WHERE (address LIKE '%AVENUE%' OR address LIKE '%TRAIL%');
SELECT * FROM customers WHERE phone LIKE '%9' ;
-- SELECT COUNT(*) from product group by customer_id;  


SELECT * FROM customers WHERE last_name REGEXP 'field';
SELECT * FROM customers WHERE last_name REGEXP '^field';  -- string start with field 
SELECT * FROM customers WHERE last_name REGEXP 'field$';  --  string end with field
SELECT * FROM customers WHERE last_name REGEXP 'field|mac|rose'; -- String must have either of names.
SELECT * FROM customers WHERE last_name REGEXP 'field$|mac$|^rose'; -- String must have either of names.
SELECT * FROM customers WHERE last_name REGEXP '[gim]e'; -- 
SELECT * FROM customers WHERE last_name REGEXP 'e[y]'; -- 
SELECT * FROM customers WHERE last_name REGEXP '[a-p]e'; -- 
-- ------------------
SELECT *
FROM customers
WHERE first_name IN ('ALKA','AMBUR');
SELECT *
FROM customers
WHERE last_name REGEXP 'EY$|ON$';
SELECT *
FROM customers
WHERE last_name REGEXP '^MY|SE';
SELECT *
FROM customers
WHERE last_name REGEXP 'B[RU]';
-- ------------------
USE sql_store;
SELECT * 
FROM customers
WHERE phone IS NULL;
SELECT * 
FROM customers
WHERE phone IS NOT NULL ORDER BY customer_id;
SELECT *
FROM orders
WHERE shipper_id IS NULL;
-- ------------------

SELECT * 
FROM customers
ORDER BY state , first_name ;
SELECT * 
FROM customers
ORDER BY state , first_name DESC;
SELECT * 
FROM customers
ORDER BY state DESC, first_name DESC;
SELECT  * FROM order_items;

-- -----------------------
SELECT * , quantity*unit_price AS price
FROM order_items
WHERE order_id=2
ORDER BY quantity*unit_price DESc;
-- -------------------
SELECT *
FROM customers
LIMIT 2,3; -- skip first 2 records then select next 3 records
-- ------------
-- get top three loyal customer's name
SELECT *
FROM CUSTOMERS
ORDER BY points DESC 
LIMIT 3;
-- ------------------------- Inner Join ----------------------- here 'INNER JOIN' INNER is optional
SELECT *
FROM orders 
JOIN customers 
	ON orders.customer_id = customers.customer_id;
-- -------------------------
SELECT *
FROM order_items;
-- -------------------------
SELECT order_id,  orders.customer_id AS Customer_ID,first_name, last_name
FROM orders 
JOIN customers ON orders.customer_id = customers.customer_id;
-- -------------------------
SELECT order_id,  o.customer_id,first_name, last_name
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id;
-- -----------------------
SELECT 
    *
FROM
    products p
        JOIN
    order_items o ON p.product_id = o.product_id
        AND p.unit_price = o.unit_price;
-- -------------------------
SELECT 
    order_id, p.product_id, o.quantity, o.unit_price
FROM
    products p
        JOIN
    order_items o ON p.product_id = o.product_id;
-- -------------------------
SELECT * from products;
-- ----------------------- Joining across multiple databases ---------
SELECT *
FROM order_items X
JOIN sql_inventory.products Y
ON Y.product_id = X.product_id AND Y.unit_price = X.unit_price;

SELECT *
FROM sql_store.order_items X
JOIN products Y
ON Y.product_id = X.product_id ;

-- ------------------------- Hierarchy of emplyee manager's chart ------------
USE sql_hr;
DESCRIBE employees;
SELECT 
m.employee_id,
m.first_name AS Managers_name,
e.first_name,
e.employee_id
FROM
employees e
JOIN 
employees m
ON m.employee_id = e.reports_to;
-- ------------------------- Joining Multiple Tables ----------
SELECT 
order_id,
order_date,
first_name,
last_name,
os.name AS ORDER_CONDITION 
FROM
customers c
JOIN
orders o
ON o.customer_id= c.customer_id
JOIN order_statuses os
ON os.order_status_id = o.status;
-- --------------------------- Joining Multiple Tables --------------
SELECT 
order_id,
order_date,
first_name,
last_name,
os.name AS ORDER_CONDITION
FROM
customers c
JOIN
orders o
ON o.customer_id= c.customer_id
JOIN order_statuses os
ON o.status=os.order_status_id;
-- -------------------------
USE sql_invoicing;
SELECT *
FROM payments  p 
JOIN
clients c
ON  c.client_id = p.client_id
JOIN payment_methods pm
ON pm.payment_method_id = p.payment_id;
-- -------------------------
SELECT 
p.date,
p.invoice_id,
p.amount,
c.name,
pm.name AS Paymeny_Method
FROM payments  p 
JOIN
clients c
ON  c.client_id = p.client_id
JOIN payment_methods pm
ON pm.payment_method_id = p.payment_method LIMIT 6,10;
-- -------------------------Compound Join Condition ------------
SELECT *
FROM order_items oi
JOIN order_item_notes oin
	ON oi.order_id = oin.order_id
    AND oi.product_id = oin.product_id;  

-- ------------------------- Implicit Join syntax -------
USE sql_store;
SELECT *
FROM customers c, orders o
WHERE c.customer_id= o.customer_id;
-- -------------------------

SELECT *
FROM customers c, orders o;
-- It is cross join between two tables {When we forget to use 'WHERE' clause}
-- --------------------------- Outer Join -------------
SELECT 
c.customer_id,
c.first_name,
o.order_id
FROM customers c
JOIN  orders o
ON c.customer_id = o.customer_id
ORDER BY c.customer_id;
-- -------------------------
SELECT 
c.customer_id,
c.first_name,
o.order_id
FROM customers c
LEFT JOIN  orders o
ON c.customer_id = o.customer_id
ORDER BY c.customer_id;

SELECT 
c.customer_id,
c.first_name,
o.order_id
FROM customers c
RIGHT JOIN  orders o
ON c.customer_id = o.customer_id
ORDER BY c.customer_id;

SELECT 
c.customer_id,
c.first_name,
o.order_id
FROM orders o
RIGHT JOIN  customers c
ON c.customer_id = o.customer_id
ORDER BY c.customer_id;
-- -------------------------
SELECT *
FROM products p
LEFT OUTER JOIN order_items oin --  Here OUTER clause is optional
	ON oin.product_id = p.product_id
   ; 
   
SELECT 
p.product_id,
p.name,
oin.quantity,
oin.unit_price
FROM products p
LEFT OUTER JOIN order_items oin --  Here OUTER clause is optional
	ON oin.product_id = p.product_id; 

-- ------------------------- OUTER JOin between multiple tables ----------
SELECT 
c.customer_id,
c.first_name,
o.order_id,
s.name AS Shippers
FROM orders o
RIGHT JOIN  customers c --  Avoid using 'RIGHT' clause.
ON c.customer_id = o.customer_id
LEFT JOIN shippers s
ON s.shipper_id = o.shipper_id
ORDER BY c.customer_id;

SELECT 
c.customer_id,
c.first_name,
o.order_id,
s.name AS Shippers
FROM customers c 
LEFT JOIN  orders o
ON c.customer_id = o.customer_id
LEFT JOIN shippers s
ON s.shipper_id = o.shipper_id
ORDER BY c.customer_id;
    
-- -------------------------
SELECT 
o.order_id,
o.order_date,
c.first_name AS Customer

FROM customers c
JOIN orders o
ON o.customer_id = c.customer_id
LEFT JOIN order_statuses os
ON os.order_status_id = o.order_id

ORDER BY o.order_id;

-- -------------------------
SELECT 
o.order_id,
o.order_date,
c.first_name AS Customer,
sh.name AS shippers,
ost.name AS STATUS
FROM customers c
JOIN orders o
ON o.customer_id = c.customer_id
LEFT JOIN shippers sh
ON sh.shipper_id = o.shipper_id
JOIN order_statuses ost
ON ost.order_status_id = o.status
-- ORDER BY o.order_id
;



-- ------------------------- Self outer JOINS ---------------
SELECT 
e.employee_id,
e.first_name,
m.first_name AS Manager,
m.employee_id
FROM employees e
LEFT JOIN employees m
ON e.reports_to = m.employee_id;




-- -------------------------
SELECT 
c.customer_id,
c.first_name,
o.order_id,
s.name AS Shippers
FROM customers c 
LEFT JOIN  orders o
ON c.customer_id = o.customer_id   --  It is not in simple way.
LEFT JOIN shippers s
ON s.shipper_id = o.shipper_id
ORDER BY c.customer_id;

SELECT 
c.customer_id,
c.first_name,
o.order_id, 
s.name AS Shippers 
FROM customers c  
LEFT JOIN  orders o 
-- ON c.customer_id = o.customer_id
	USING (customer_id)  -- columns name must be same, then only we can use 'USING' clause
LEFT JOIN shippers s
-- ON s.shipper_id = o.shipper_id
	USING (shipper_id) 
ORDER BY c.customer_id;


-- ------------------------- Joining of tables having multiple common attributes --- 
SELECT *
FROM order_item_notes oin
JOIN order_items oi
USING (product_id, order_id) ; 

SELECT 
p.date,
c.name AS client,
p.amount,
pm.name AS Payment_GATEWAY
FROM payments p
JOIN clients c
USING (client_id)
JOIN payment_methods pm
ON pm.payment_method_id = p.payment_method;
-- --------------------------------Natural JOIN _________****************************
SELECT *
FROM customers c
NATURAL JOIN orders o; -- Discourage to use it

-- ------------------------- CROSS JOIN -------------
SELECT 
c.first_name c,
p.name AS PRODUCTS
FROM customers c
CROSS JOIN products  p -- Explicit SYNTAX of cross join.
ORDER BY c.first_name;

SELECT 
c.first_name c,
p.name AS PRODUCTS
FROM customers c, products p -- Implicit SYNTAX of cross join.
ORDER BY c.first_name;
-- OR 
SELECT 
*
FROM customers c, products p -- Implicit SYNTAX of cross join.
ORDER BY c.first_name;
-- -------------------------
SELECT *
FROM products
CROSS JOIN shippers      -- Explicit
ORDER BY product_id;

SELECT *
FROM products , shippers -- Implicit
ORDER BY product_id;
-- ------------------------- UNIONS $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
SELECT
order_id,
order_date,
'ACTIVE' AS status
FROM orders
WHERE order_date>= '2019-01-01'
UNION
SELECT
order_id,
order_date,
'Archived' AS status
FROM orders
WHERE order_date< '2019-01-01';
-- -------------------------
SELECT first_name,
FROM customers
UNION
SELECT name,
FROM shippers;


SELECT first_name,
'FROM Customers----' AS tables
FROM customers
UNION
SELECT name,
'FROM Shippers' AS tables
FROM shippers;

SELECT 
c.customer_id,
c.first_name,
c.points,
'BRONZE' AS type
FROM customers c
where points<2000
UNION
SELECT 
c.customer_id,
c.first_name,
c.points,
'SILVER' AS type
FROM customers c
where points>=2000 AND points<3000
UNION
SELECT 
c.customer_id,
c.first_name,
c.points,
'GOLD' AS type
FROM customers c
where points>=3000;

-- ------------------------- Column Attributes ------------------
-- PK primary key
-- AI Auto Incrrement
-- Datatype 	1.CHAR() 
-- 			2.VARCHAR()
--             3.INT()
--             4. DATE
-- NN- Not NULL
-- Default/Expression
             



-- ------------------------- Inserting a single ROW ---------------
INSERT INTO customers 
VALUES (
Default,
'John',
'Smith',
'2022-04-19',
NULL,
'address',
'pbn',
'MH',
Default);

INSERT INTO customers (

first_name,
last_name,
birth_date,
address,
city,
state
)
VALUES (
'John',
'Smith',
'2022-04-19',
'address',
'pbn',
'MH'
);

INSERT INTO customers (
phone,
first_name,
last_name,
birth_date,
address,
city,
state
)
VALUES (
'9156026054',
'KASHIF',
'Shaikh',
'2022-03-19',
'addr2',
'nanded',
'UK'
);
-- ------------------------- Inserting Multiple Rows -----------
INSERT INTO shippers (name)
VALUES ('KASHIF'),
('Huzaif'),
('MALIK');
-- ------------------------ Inserting hierarchical Rows-------------
INSERT INTO orders (customer_id, order_date, status)
VALUES (1,'2019-01-02',1);

INSERT INTO order_items
VALUES
(LAST_INSERT_ID(),1,1,2.95),
(LAST_INSERT_ID(),2,1,5.33);


-- ----------------------------- Creating a Copy of Table ------------------------------------
CREATE TABLE orders_archived AS
SELECT * FROM orders;

-- CREATE TABLE orders_archived AS
INSERT INTO orders_archived
SELECT * FROM orders WHERE order_date < '2019-01-01';
-- -----------------------------  ------------------------------------
 -- CREATE TABLE invoices_archived AS
 INSERT INTO invoices_archived
 SELECT 
 i.invoice_id,
 i.number,
 c.name AS clients_name,
 i.invoice_total,
 i.payment_total,
 i.invoice_date,
 i.payment_date,
 i.due_date
  FROM invoices i
 RIGHT JOIN clients c ON i.client_id = c.client_id
 -- WHERE i.payment_date!=NULL;
 WHERE i.payment_date IS NOT NULL;
-- -----------------------------  ------------------------------------
DROP TABLE sql_invoicing.invoices_archived;
-- ----------------------------- Updating a single ROW ------------------------------------
UPDATE invoices
SET payment_total =10, payment_date = '2019-03-01'
WHERE invoice_id = 1;

UPDATE invoices
SET payment_total =DEFAULT, payment_date = NULL
WHERE invoice_id = 1;

UPDATE invoices
SET payment_total =invoice_total*0.5, payment_date = due_date
WHERE invoice_id = 3;
-- ----------------------------- Updating Multiple ROWs ------------------------------------
UPDATE invoices
SET 
payment_total =invoice_total*0.5, 
payment_date = due_date
WHERE client_id = 3; 


-- -----------------------------  ------------------------------------
-- Following is UNSAFE operation.
-- -----------------------------  ------------------------------------
UPDATE invoices
SET 
payment_total =invoice_total*0.5, 
payment_date = due_date;

UPDATE invoices
SET 
payment_total =invoice_total*0.5, 
payment_date = due_date
WHERE client_id = 3; 

UPDATE invoices
SET 
payment_total =invoice_total*0.5, 
payment_date = due_date
WHERE client_id IN (3,4); 
-- -----------------------------  ------------------------------------
UPDATE customers
SET points =points + 50
WHERE birth_date< '1990-01-01'; 
-- -----------------------------  Using Subqueries in Updates ------------------------------------
UPDATE invoices
SET
	payment_total = invoice_total*0.5,
    payment_date = due_date
    WHERE client_id = 
					(SELECT client_id
                    FROM clients
                    WHERE name = 'Myworks');
                    
SELECT client_id 
FROM clients
WHERE name = 'Myworks';                    

UPDATE invoices
SET
	payment_total = invoice_total * 0.5,
    payment_date = due_date
    WHERE client_id IN -- we can not use '=' sign anymore here.
					(SELECT client_id 
                    FROM clients
                    WHERE state IN ('CA','NY'));

SELECT client_id
FROM clients
WHERE state IN ('CA','NY');
-- -----------------------------  ------------------------------------
UPDATE orders
SET comments = 'GOLD'
WHERE customers.customer_id = orders.customer_id 
AND customers.points>3000;

UPDATE orders
SET comments = 'GOLD customers'
WHERE customer_id IN 
(
SELECT customer_id
FROM customers
WHERE points>3000
);
-- ----------------------------- DELETING ROWS ------------------------------------
DELETE FROM invoices
WHERE client_id =( 
SELECT * 
FROM clients
WHERE name = 'Myworks'
);

-- ----------------------------- Restoring the databases ------------------------------------

-- -----------------------------  ------------------------------------




