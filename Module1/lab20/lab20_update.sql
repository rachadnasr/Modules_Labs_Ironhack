-- Updating and Deleting Database Records

-- Fix the error in the Salespersons table, write Miami instead of Mimia for Paige Turner. 

set SQL_SAFE_UPDATES = 0;
UPDATE Sales_person
SET Store = 'Miami' 
WHERE Name = 'Paige Turner';

-- Enter the email addresses received of the three customers:

UPDATE Customers
SET Email = CASE WHEN Name = 'Pablo Picasso' THEN 'ppicasso@gmail.com' 
								 WHEN Name = 'Abraham Lincoln' THEN 'lincoln@us.gov'
                                 WHEN Name= 'Napoléon Bonaparte' THEN 'hello@napoleon.me'
                                 END;