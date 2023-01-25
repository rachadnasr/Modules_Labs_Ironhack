#Challenge 1

Select authors.au_id, authors.au_lname, authors.au_fname, titles.title, publishers.pub_name
From authors INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN titles
ON titles.title_id = titleauthor.title_id
INNER JOIN publishers
ON publishers.pub_id = titles.pub_id;
-- number of rows in the output = 25 same as the number of rows in titleauthor

# Challenge 2

Select authors.au_id, concat (authors.au_fname, " ", authors.au_lname) as full_name, publishers.pub_name,
COUNT(titles.title_id) as Number -- COUNT(titles.title_id)*8  as Number -- here indcate the table.nameofthecolumn specially when same column name in different tables. as Number will allow s to change the col name
From authors LEFT JOIN titleauthor
ON authors.au_id = titleauthor.au_id
LEFT JOIN titles
ON titles.title_id = titleauthor.title_id
LEFT JOIN publishers
ON publishers.pub_id = titles.pub_id
group by authors.au_id, full_name, publishers.pub_name;
-- sum title count (Number) = 25 same as the number of rows in titleauthor

# Challenge 3

Select authors.au_id, concat (authors.au_fname, " ", authors.au_lname) as full_name,
COUNT(titles.title_id) as Total -- COUNT(titles.title_id)*8  as Number -- here indcate the table.nameofthecolumn specially when same column name in different tables. as Number will allow s to change the col name
From authors LEFT JOIN titleauthor
ON authors.au_id = titleauthor.au_id
LEFT JOIN titles
ON titles.title_id = titleauthor.title_id
LEFT JOIN sales
ON sales.title_id = titleauthor.title_id
group by authors.au_id, full_name
order by Total desc limit 3;

# Challenge 4

Select authors.au_id, concat (authors.au_fname, " ", authors.au_lname) as full_name,
COUNT(titles.title_id) as Total -- COUNT(titles.title_id)*8  as Number -- here indcate the table.nameofthecolumn specially when same column name in different tables. as Number will allow s to change the col name
From authors LEFT JOIN titleauthor
ON authors.au_id = titleauthor.au_id
LEFT JOIN titles
ON titles.title_id = titleauthor.title_id
LEFT JOIN sales
ON sales.title_id = titleauthor.title_id
group by authors.au_id, full_name
order by Total desc;