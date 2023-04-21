USE publications;
-- Challenge 1
SELECT titleauthor.au_id, au_lname, au_fname, titles.title, pub_name
	FROM titles
    INNER JOIN titleauthor
		ON titles.title_id = titleauthor.title_id
	LEFT JOIN authors
		ON titleauthor.au_id = authors.au_id
	LEFT JOIN publishers
		on publishers.pub_id = titles.pub_id;
	-- Returns 25 
	-- Number of records returned by titleauthor table? 
    SELECT * FROM titleauthor; -- returns 25

-- Challenge 2: 
SELECT titleauthor.au_id, au_lname, au_fname, pub_name, COUNT(titles.title) AS title_count
	FROM titles
    INNER JOIN titleauthor
		ON titles.title_id = titleauthor.title_id
	LEFT JOIN authors
		ON titleauthor.au_id = authors.au_id
	LEFT JOIN publishers
		on publishers.pub_id = titles.pub_id
	GROUP BY publishers.pub_name,titleauthor.au_id;
SELECT SUM(title_count) FROM (SELECT titleauthor.au_id, au_lname, au_fname, pub_name, COUNT(titles.title) AS title_count
	FROM titles
    INNER JOIN titleauthor
		ON titles.title_id = titleauthor.title_id
	LEFT JOIN authors
		ON titleauthor.au_id = authors.au_id
	LEFT JOIN publishers
		on publishers.pub_id = titles.pub_id
	GROUP BY publishers.pub_name,titleauthor.au_id) AS counts; -- THE SUM is 25, the same as the sum of the number of records
    

-- Challenge 3: TOP 3 best selling authors
SELECT authors.au_id, au_lname, au_fname, COUNT(qty) AS total
FROM authors
	INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
	LEFT JOIN sales ON titleauthor.title_id = sales.title_id
    GROUP BY au_id
    ORDER BY total DESC
    LIMIT 3;
    
-- Challenge 4: 
SELECT DISTINCT(authors.au_id), au_lname, au_fname, COUNT(qty) AS total
FROM authors
	INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
	RIGHT JOIN sales ON titleauthor.title_id = sales.title_id
    GROUP BY au_id
    ORDER BY total DESC;
    
