-- 1. From the order_items table, find the price of the highest priced order and lowest price order.
select * from order_items limit 10;
select order_id, price from order_items order by price desc limit 10;
-- The highest priced order is '0812eb902a67711a1cb742b3cdaa65ae' (6735)
select order_id, price from order_items order by price asc limit 10;
-- answer: The lowest priced order is 'c5bdd8ef3c0ec420232e668302179113' (0.85)

--  2. From the order_items table, what is range of the shipping_limit_date of the orders?
select * from order_items limit 10;
select order_ID, shipping_limit_date from order_items order by shipping_limit_date asc limit 10;
select order_ID, shipping_limit_date from order_items order by shipping_limit_date desc limit 10;
-- answer: The range of the shipping_limit_date goes from '2016-09-19 02:15:34'to '2020-04-10 00:35:08'

-- 3. From the customers table, find the states with the greatest number of customers.
select * from customers limit 10;
select customer_state, count(customer_id) from customers
group by customer_state
order by count(customer_id) desc;
-- answer: SP is the state with the highest number of customers with 41746 customers

-- 4. From the customers table, within the state with the greatest number of customers, find the cities with the greatest number of customers.
select * from customers limit 10;
select customer_city, count(customer_id) from customers where customer_state = 'SP' 
group by customer_city 
order by count(customer_id) desc;
-- answer: Sao paulo is the city withon the state of SP with the highest number of customers with 15540 customers

-- 5. From the closed_deals table, how many distinct business segments are there (not including null)?
select * from closed_deals limit 10;
select count(distinct business_segment)
from closed_deals;
-- answer: There is 33 distinct business segments in closed_deals table


-- 6. From the closed_deals table, sum the declared_monthly_revenue for duplicate row values in business_segment and find the 3 business segments with the highest declared monthly revenue (of those that declared revenue).
select * from closed_deals limit 10;
select business_segment, sum(declared_monthly_revenue) from closed_deals
group by business_segment
order by sum(declared_monthly_revenue) desc;
-- answer: The business segments with the highest declared monthly revenue is 'construction_tools_house_garden' with a sum of 50695006

-- 7. From the order_reviews table, find the total number of distinct review score values.
select * from order_reviews limit 10;
select count(distinct review_score)
from order_reviews;
-- answer: There is 5 distinct review score values 

-- 8. In the order_reviews table, create a new column with a description that corresponds to each number category for each review score from 1 - 5, then find the review score and category occurring most frequently in the table.
select * from order_reviews limit 10;

ALTER TABLE order_reviews
 ADD category_description varchar(50)
    AFTER review_score;
    
UPDATE order_reviews
SET category_description = CASE  WHEN review_score = 5 THEN 'Excellent' 
								 WHEN review_score = 4 THEN 'Very Good'
                                 WHEN review_score = 3 THEN 'Good'
                                 WHEN review_score = 2 THEN 'Bad'
                                 WHEN review_score = 1 THEN 'Very Bad'
                                 ELSE 'Not Rated'
                                 END;

select review_score, count(order_id) from order_reviews
group by review_score
order by count(order_id) desc;
-- answer: The review score 5 occurs most frequently with 57420 counts

select review_score, count(order_id) from order_reviews
group by review_score
order by count(order_id) desc;
-- answer: The review score and category 5 occurs most frequently

-- 9. From the order_reviews table, find the review value occurring most frequently and how many times it occurs.
-- select review_id, count(order_id) from order_reviews
-- group by review_id
-- order by count(order_id) desc;
select review_score, count(order_id) from order_reviews
group by review_score
order by count(order_id) desc;
-- answer: The review score 5 occurs most frequently with 57420 counts