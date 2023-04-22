USE publications;

-- Challenge 1 --
SELECT titleauthor.au_id AS "Author id", au_lname AS "Surname", au_fname AS "Name", title AS "TITLE", pub_name AS "PUBLISHER"
FROM authors
	JOIN titleauthor ON authors.au_id = titleauthor.au_id
    LEFT JOIN titles ON titleauthor.title_id = titles.title_id
    LEFT JOIN publishers ON titles.pub_id = publishers.pub_id;
    

-- Challenge 2 --
SELECT titleauthor.au_id AS "Author id", au_lname AS "Surname", au_fname AS "Name", pub_name AS "PUBLISHER", COUNT(title) AS "TITLE"
FROM authors
	JOIN titleauthor ON authors.au_id = titleauthor.au_id
    LEFT JOIN titles ON titleauthor.title_id = titles.title_id
    LEFT JOIN publishers ON titles.pub_id = publishers.pub_id
GROUP BY pub_name, titleauthor.au_id
ORDER BY "Author id" ASC;

SELECT SUM(TITLE) AS "Total Titles"
FROM (
    SELECT titleauthor.au_id AS "Author id", au_lname AS "Surname", au_fname AS "Name", pub_name AS "PUBLISHER", COUNT(title) AS "TITLE"
FROM authors
	JOIN titleauthor ON authors.au_id = titleauthor.au_id
    LEFT JOIN titles ON titleauthor.title_id = titles.title_id
    LEFT JOIN publishers ON titles.pub_id = publishers.pub_id
GROUP BY pub_name, titleauthor.au_id
ORDER BY "Author id" ASC
)subquery;


-- Challenge 3 --
SELECT titleauthor.au_id AS "Author id", au_lname AS "Surname", au_fname AS "Name", COUNT(sales.title_id) AS "Total"
FROM authors
	JOIN titleauthor ON authors.au_id = titleauthor.au_id
    LEFT JOIN titles ON titleauthor.title_id = titles.title_id
    LEFT JOIN sales ON titles.title_id = sales.title_id
GROUP BY titleauthor.au_id
ORDER BY COUNT(sales.title_id) DESC
LIMIT 3;


-- Challenge 4 --
SELECT titleauthor.au_id AS "Author id", 
       au_lname AS "Surname", 
       au_fname AS "Name", 
       COALESCE(COUNT(sales.title_id), 0) AS "Total"
FROM authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN titles ON titleauthor.title_id = titles.title_id
LEFT JOIN sales ON titleauthor.title_id = sales.title_id
GROUP BY titleauthor.au_id, au_lname, au_fname
ORDER BY COALESCE(COUNT(sales.title_id), 0) DESC;