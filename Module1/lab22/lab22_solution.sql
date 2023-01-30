
-- Challenge 1 - Most Profiting Authors

USE ppub;

-- Step 1: Calculate the royalty of each sale for each author and the advance for each author and publication

SELECT titleauthor.title_id as TitleID, 
titleauthor.au_id as AuthorID, 
titles.advance * titleauthor.royaltyper / 100 as advance, 
titles.price * sales.qty * (titles.royalty / 100) * (titleauthor.royaltyper / 100) as sales_royalty
FROM titleauthor LEFT JOIN titles
ON titleauthor.title_id = titles.title_id
LEFT JOIN sales
ON sales.title_id = titleauthor.title_id;

-- Step 2: Aggregate the total royalties for each title and author

SELECT TitleID, AuthorID, sum(sales_royalty) as AggregatedRoyalties FROM
(SELECT titleauthor.title_id as TitleID, 
titleauthor.au_id as AuthorID, 
titles.advance * titleauthor.royaltyper / 100 as advance, 
titles.price * sales.qty * (titles.royalty / 100) * (titleauthor.royaltyper / 100) as sales_royalty
FROM titleauthor LEFT JOIN titles
ON titleauthor.title_id = titles.title_id
LEFT JOIN sales
ON sales.title_id = titleauthor.title_id) AS summary
group by AuthorID, TitleID order by AggregatedRoyalties desc limit 3;

-- Step 3: Calculate the total profits of each author

SELECT AuthorID, sum(advance) + sum(sales_royalty) as TotalProfits
FROM
(SELECT titleauthor.title_id as TitleID, 
titleauthor.au_id as AuthorID, 
titles.advance * titleauthor.royaltyper / 100 as advance, 
titles.price * sales.qty * (titles.royalty / 100) * (titleauthor.royaltyper / 100) as sales_royalty
FROM titleauthor LEFT JOIN titles
ON titleauthor.title_id = titles.title_id
LEFT JOIN sales
ON sales.title_id = titleauthor.title_id
LEFT JOIN authors
ON authors.au_id = titleauthor.au_id) AS summary
group by AuthorID order by TotalProfits desc;

-- Top 3 that I obtained : 722-51-5454:22521.528/ 213-46-8915:14162.110/ 899-46-2035:12128.132

-- Challenge 2 - Alternative Solution

CREATE TEMPORARY TABLE IF NOT EXISTS ppub.sales_Summary
SELECT titleauthor.title_id as TitleID, 
titleauthor.au_id as AuthorID,
titles.advance * titleauthor.royaltyper / 100 as advance, 
titles.price * sales.qty * (titles.royalty / 100) * (titleauthor.royaltyper / 100) as sales_royalty
FROM titleauthor LEFT JOIN titles
ON titleauthor.title_id = titles.title_id
LEFT JOIN sales
ON sales.title_id = titleauthor.title_id
LEFT JOIN authors
on authors.au_id = titleauthor.au_id;

SELECT AuthorID, sum(sales_royalty) + sum(advance) as TotalProfits
FROM ppub.sales_Summary
WHERE AuthorID = AuthorID
group by AuthorID
order by TotalProfits desc;

-- Challenge 3 - Most Profiting Authors

CREATE DATABASE lab22;
use lab22;
CREATE TABLE most_profiting_authors
SELECT AuthorID, sum(sales_royalty) + sum(advance) as TotalProfits
FROM ppub.sales_Summary
WHERE AuthorID = AuthorID
group by AuthorID
order by TotalProfits desc;

-- PS: suggested result by Andy : 12162.100