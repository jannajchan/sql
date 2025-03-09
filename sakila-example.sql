SELECT count(*) FROM sakila.film_text;
CALL sakila.film_in_stock(1, 1, @count);
CALL sakila.film_not_in_stock(2, 2, @count);

/* USAGE EXAMPLES */
-- 1. Rent a DVD --
SELECT sakila.inventory_in_stock(10);
INSERT INTO sakila.rental(rental_date, inventory_id, customer_id, staff_id) VALUES(NOW(), 10, 3, 1);
SET @rentID = LAST_INSERT_ID(), @balance = sakila.get_customer_balance(3, NOW());
SELECT @rentID, @balance;
INSERT INTO sakila.payment (customer_id, staff_id, rental_id, amount, payment_date) VALUES(3, 1, @rentID, @balance, NOW());

-- SELECT * FROM sakila.rental ORDER BY last_update DESC LIMIT 10;
-- DELETE FROM sakila.rental WHERE rental_id = 16050;
-- Test get_customer_balance() --
SELECT LAST_INSERT_ID();
-- Check if get_customer_balance() actually exists --
SELECT ROUTINE_NAME FROM information_schema.ROUTINES WHERE ROUTINE_SCHEMA = 'sakila' AND ROUTINE_NAME = 'get_customer_balance';


-- 2. Return a DVD --
SELECT rental_id FROM sakila.rental WHERE inventory_id = 10 AND customer_id = 3 AND return_date IS NULL INTO @rentID;
SELECT @rentID;
UPDATE sakila.rental SET return_date = NOW() WHERE rental_id = @rentID;
SELECT sakila.get_customer_balance(3, NOW());


-- 3. Find Overdue DVDs --
USE sakila;
SELECT CONCAT(customer.last_name, ', ', customer.first_name) AS customer, address.phone, film.title FROM rental 
INNER JOIN customer ON rental.customer_id = customer.customer_id 
INNER JOIN address ON customer.address_id = address.address_id 
INNER JOIN inventory ON rental.inventory_id = inventory.inventory_id 
INNER JOIN film ON inventory.film_id = film.film_id 
WHERE rental.return_date IS NULL AND rental_date + INTERVAL film.rental_duration DAY < CURRENT_DATE() ORDER BY title LIMIT 5;