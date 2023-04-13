USE publications;

-- Challenge 1 - Who Have Published What At Where?
-- In this challenge you will write a MySQL SELECT query that joins various tables to figure out 
-- what titles each author has published at which publishers. Your output should have at least the following columns:

-- AUTHOR ID - the ID of the author
-- LAST NAME - author last name
-- FIRST NAME - author first name
-- TITLE - name of the published title
-- PUBLISHER - name of the publisher where the title was published

-- FROM authors, titles, titleauthor, publishers

SELECT authors.au_id, au_lname, au_fname, title, pub_name FROM authors
	LEFT JOIN titleauthor
		ON titleauthor.au_id = authors.au_id
	INNER JOIN titles
		ON titles.title_id = titleauthor.title_id
	LEFT JOIN publishers
		ON publishers.pub_id = titles.pub_id; -- 25 rows returned

SELECT COUNT(au_id) FROM titleauthor; -- 25 rows returned


-- Challenge 2 - Who Have Published How Many At Where?
-- Elevating from your solution in Challenge 1, query how many titles each author has published at each publisher. 

SELECT authors.au_id, au_lname, au_fname, pub_name, COUNT(titles.title) AS 'Title_count' 
	FROM authors
    LEFT JOIN titleauthor
		ON titleauthor.au_id = authors.au_id
	INNER JOIN titles
		ON titles.title_id = titleauthor.title_id
	LEFT JOIN publishers
		ON publishers.pub_id = titles.pub_id
	GROUP BY authors.au_id, pub_name
		ORDER BY COUNT(titles.title) DESC; -- sum of a count = 25, but how to get SUM(COUNT) ???
        

-- Challenge 3 - Best Selling Authors
-- Who are the top 3 authors who have sold the highest number of titles? Write a query to find out.

-- FROM sales.title_id, titleauthor.title_id, titleauthor.au_id, authors.au_id, authors.au_lname

SELECT authors.au_id, au_lname, au_fname, COUNT(sales.title_id) AS 'Total titles'
	FROM sales
    LEFT JOIN titleauthor
		ON sales.title_id = titleauthor.title_id
	LEFT JOIN authors
		ON titleauthor.au_id = authors.au_id
	GROUP BY authors.au_id
	ORDER BY COUNT(sales.title_id) DESC
    LIMIT 3;
    
    
-- Challenge 4 - Best Selling Authors Ranking
-- Now modify your solution in Challenge 3 so that the output will display all 23 authors instead of the top 3. 
-- Note that the authors who have sold 0 titles should also appear in your output (ideally display 0 instead of NULL as the TOTAL). 
-- Also order your results based on TOTAL from high to low.

SELECT authors.au_id, au_lname, au_fname, COUNT(sales.title_id) AS 'Total titles'
	FROM sales
    RIGHT JOIN titleauthor
		ON sales.title_id = titleauthor.title_id
	RIGHT JOIN authors
		ON titleauthor.au_id = authors.au_id
	GROUP BY authors.au_id
	ORDER BY COUNT(sales.title_id) DESC;
        



    
    

	
    

    
	
        
