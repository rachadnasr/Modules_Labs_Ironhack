create schema if not exists ironhack_examples;
use ironhack_examples;
select * from ironhack_examples.applestore;

-- 1. What are the different genres? or */
SELECT distinct prime_genre FROM ironhack_examples.applestore;

-- 2. Which is the genre with the most apps rated?
select prime_genre, sum(rating_count_tot) from ironhack_examples.applestore
group by prime_genre
order by sum(rating_count_tot) desc
limit 1;
-- answer: Games is the genre with most rated apps with a total sum of rating: 8717381 

-- 3. Which is the genre with most apps?
select prime_genre, count(track_name) from ironhack_examples.applestore group by prime_genre order by count(track_name) desc limit 1;
-- answer: The genre with the most apps is Games (169 apps)

-- 4. Which is the one with least?
select prime_genre, count(track_name) from ironhack_examples.applestore group by prime_genre order by count(track_name) asc limit 1;
-- answer: The genre with the least apps is Medical (169 apps)

-- 5. Find the top 10 apps most rated.
select track_name, sum(rating_count_tot) from ironhack_examples.applestore
group by track_name
order by sum(rating_count_tot) desc limit 10;
-- answer: 'Facebook', 'Pandora - Music & Radio', 'Pinterest', 'Bible', 'Angry Birds', 'Fruit Ninja Classic', 'Solitaire', 'PAC-MAN', 'Calorie Counter & Diet Tracker by MyFitnessPal', 'The Weather Channel: Forecast, Radar & Alerts'

-- 6. Find the top 10 apps best rated by users.
select track_name, user_rating from ironhack_examples.applestore order by user_rating desc limit 10;

-- 7. Take a look at the data you retrieved in question 5. Give some insights.
-- answer: the apps the most rated are apps mostly related to entertainement (games, social network and music) and the bible. High level of rating refelct a high use of the application.  

-- 8. Take a look at the data you retrieved in question 6. Give some insights.
-- Among the best rated apps we can also find among tha top 10 calssified: games, bible.

-- 9. Now compare the data from questions 5 and 6. What do you see?
-- answer: Games seem to be in top of most rated and better rated apps among all the apps of the applestore. We can also see that the apps most rated can reflect a satisfaction of the user.

-- 10. How could you take the top 3 regarding both user ratings and number of votes?
select track_name, user_rating, rating_count_tot from ironhack_examples.applestore order by user_rating desc, rating_count_tot desc limit 3;
-- answer: We take the top 3 by ordering with two criterias: user ratings and tot_count_rate
-- top3 apps: 'Plants vs. Zombies', 'Domino''s Pizza USA', 'Plants vs. Zombies HD'

-- 11. Do people care about the price of an app?
SELECT price, COUNT(track_name) FROM ironhack_examples.applestore GROUP BY price  order by count(track_name) desc;
 -- insight1: Among all the apps we can see that 221 apps are free.
select * from ironhack_examples.applestore order by rating_count_tot desc, user_rating desc limit 100;
-- insight2: the rating_count_tot and user_rating can reflect the number of users per app and the satisfaction of these users. 
-- From the Top100 most and best rated apps we can notice that only 17 apps have a price different from 0. 
-- This refelcts that more than 80% of the most used apps are free. Users seem to be more satisfied when the app is free.
