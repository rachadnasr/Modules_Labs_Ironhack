
-- 1. find the running total of rental payments for each customer in the payment table, 
-- ordered by payment date. By selecting the customer_id, payment_date, and amount columns from the payment table, 
-- and then applying the SUM function to the amount column within each customer_id partition, ordering by payment_date.

use sakila; 

select customer_id, payment_date, amount,
SUM(amount) OVER (PARTITION BY customer_id ORDER BY payment_date) AS running_total
from payment;

-- 2.  find the rank and dense rank of each payment amount within each payment date by selecting the payment_date 
-- and amount columns from the payment table, and then applying the RANK and DENSE_RANK functions to the amount column 
-- within each payment_date partition, ordering by amount in descending order.

SELECT date_format(payment.payment_date, '%Y-%m-%d') as Date, amount, 
RANK() OVER (PARTITION BY "Date" ORDER BY amount DESC) AS amount_rank,
dense_rank() OVER (PARTITION BY "Date" ORDER BY amount DESC) AS amount_DENSErank
FROM payment;

-- or also we can do it this way:

SELECT DATE(payment_date), amount,
				RANK() OVER(PARTITION BY DATE(payment_date) ORDER BY amount DESC) AS rank_amount,
                DENSE_RANK() OVER(PARTITION BY DATE(payment_date) ORDER BY amount DESC) AS dense_rank_amount
FROM payment;

-- 3. find the ranking of each film based on its rental rate, within its respective category

-- Hint: you need to extract the information from the film,film_category and category tables after applying join on them.
CREATE OR REPLACE VIEW ranking_rental_views AS
SELECT title, rental_rate, name
from film_category fc
INNER JOIN film f ON  fc. film_id = f.film_id 
LEFT JOIN category c ON fc.category_id = c.category_id;
select * from ranking_rental_views;

SELECT name as category, title as film_title, rental_rate,
RANK() OVER (PARTITION BY name ORDER BY rental_rate DESC) AS rnk,
DENSE_RANK() OVER (PARTITION BY name ORDER BY rental_rate DESC) AS dense_rnk
FROM  ranking_rental_views;

-- 4.(OPTIONAL) update the previous query from above to retrieve only the top 5 films within each category

select * from
(SELECT name as category, title as film_title, rental_rate,
RANK() OVER (PARTITION BY name ORDER BY rental_rate DESC) AS rnk,
DENSE_RANK() OVER (PARTITION BY name ORDER BY rental_rate DESC) AS dense_rnk,
ROW_NUMBER() OVER (PARTITION BY name ORDER BY rental_rate DESC) AS ROW_rank
FROM  ranking_rental_views) sub_q
where dense_rnk <=5 ;

-- 5. find the difference between the current and previous payment amount and the difference between the current and next payment amount, 
-- for each customer in the payment table

SELECT customer_id, payment_date, amount,
(amount - LAG(amount) OVER (PARTITION BY customer_id ORDER BY payment_date)) AS diff_from_prev,
(LEAD(amount)  OVER (PARTITION BY  customer_id ORDER BY payment_date) - amount) AS  diff_from_next
FROM payment
ORDER BY customer_id, payment_date;