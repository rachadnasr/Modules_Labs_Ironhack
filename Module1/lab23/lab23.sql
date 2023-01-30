-- SQL Murder Mystery 

-- Exploring the Database Structure

SELECT name 
  FROM sqlite_master
 where type = 'table';
 
SELECT sql 
FROM sqlite_master
where name = 'crime_scene_report';
 
 -- Start by finding the crime report 
select * from crime_scene_report 
where date = 20180115 and city = 'SQL City' and type = 'murder';
-- The report gives us hints about the witnesses
-- Security footage shows that there were 2 witnesses. 
-- The first witness lives at the last house on "Northwestern Dr". 
-- The second witness, named Annabel, lives somewhere on "Franklin Ave".

-- next we need to identify the ids of the witnesses in order to check the interview

-- first witness:
select * from person 
where address_street_name = "Northwestern Dr" 
order by address_number desc;
-- her name is : Morty Schapiro id = 14887 and license_id = 118009

-- second witness:
select * from person
where address_street_name ="Franklin Ave" ORDER BY name; -- find the name Annabel
-- her name is Annabel Miller and id = 16371 and license_id = 490173 

-- Check out the interviews

select * from interview where person_id = 14887;
-- Morty Schapiro: I heard a gunshot and then saw a man run out. He had a "Get Fit Now Gym" bag. 
-- The membership number on the bag started with "48Z". Only gold members have those bags. 
-- man got into a car with a plate that included "H42W".

select * from interview where person_id = 16371;
-- Annabel Miller : I saw the murder happen, and I recognized the killer from my gym 
-- when I was working out last week on January the 9th.

-- Try to identify the murderer based on information from get fit now gym
select * from get_fit_now_member
where membership_status = 'gold' and id = '48Z7A';

select * from get_fit_now_check_in
where check_in_date = 20180109;
-- 48Z7A and 48Z55

select * from get_fit_now_member
where membership_status = 'gold' and id = '48Z55';
-- suspect1: Jeremy Bowers (person id = 67318) 20160101
select * from get_fit_now_member
where membership_status = 'gold' and id = '48Z7A';
-- suspect2: Joe Germuska (person id = 28819) 20160305

-- check the license id of these 2 suspects in order to check the plate number
select * from person
where id = 67318;
-- license id of Jeremy is: 423327
select * from person
where id = 28819;
-- license id of Joe is: 173289

-- check out the car plate
select * from drivers_license
where id = 423327;
-- plate number of Jeremy is : 0H42W2
select * from drivers_license
where id = 173289;
-- plate number of Joe is : not mentionned seems like he does not have a car

-- --------------------- The murederer is Jeremy Bowers ------------------------------------------------------------

-- find the brains behind the murder

select * from interview where person_id = 67318;
-- 'I was hired by a woman with a lot of money. I don't know her name but I know she's around 5'5" (65") or 5'7" (67"). 
-- She has red hair and she drives a Tesla Model S. 
-- I know that she attended the SQL Symphony Concert 3 times in December 2017.'

SELECT *, COUNT(person_id) 
FROM facebook_event_checkin
where event_name = 'SQL Symphony Concert'
GROUP BY person_id
HAVING COUNT(person_id) = 3
order by date;

-- suspects person id: 19292, 58898, 24556 99716 

select * from person
where id = 19292 or id = 58898 or id = 24556 or id = 99716;
-- license id of suspects: 681197, 101191, 202759, 202298

select * from drivers_license
where id = 681197 or id = 101191 or id =202759 or id = 202298;
-- id 202298 age 68 is the one who hired the murderer

select * from person 
where license_id = 202298;
-- ------------------------------Brain behind the murder is: Miranda Priestly-----------------------------------------------------

