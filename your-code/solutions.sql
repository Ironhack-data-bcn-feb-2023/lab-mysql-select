USE publications;
-- Challenge 1 - Who Have Published What At Where?
SELECT authors.au_id AS `AUTHOR ID`, authors.au_lname AS `LAST NAME`, authors.au_fname AS `FIRST NAME`, titles.title AS `TITLE`, publishers.pub_name AS `PUBLISHER` FROM authors, titles, titleauthor, publishers
WHERE authors.au_id = titleauthor.au_id
AND titleauthor.title_id = titles.title_id
AND titles.pub_id = publishers.pub_id;
-- Challenge 1 [ CHECK ]
SELECT SUM(authors.au_id) AS `Total Rows`, SUM(titleauthor.au_id) AS `Total in titleauthor` FROM authors, titles, titleauthor, publishers
WHERE authors.au_id = titleauthor.au_id
AND titleauthor.title_id = titles.title_id
AND titles.pub_id = publishers.pub_id;

-- Challenge 2 - Who Have Published How Many At Where?
SELECT authors.au_id AS `AUTHOR ID`, authors.au_lname AS `LAST NAME`, authors.au_fname AS `FIRST NAME`, publishers.pub_name AS `PUBLISHER`, COUNT(titles.title) AS `TITLE COUNT` FROM authors, titles, titleauthor, publishers
WHERE authors.au_id = titleauthor.au_id
AND titleauthor.title_id = titles.title_id
AND titles.pub_id = publishers.pub_id
GROUP BY `AUTHOR ID`, `PUBLISHER`
ORDER BY `TITLE COUNT` DESC;
-- Challenge 2 [ CHECK ]
SELECT SUM(`TITLE COUNT`) AS `Title Count Sum`, SUM(`titleauthor.title_id count`) AS `titleauthor Sum` FROM (
SELECT COUNT(titles.title) AS `TITLE COUNT`, COUNT(titleauthor.title_id) as `titleauthor.title_id count` FROM authors, titles, titleauthor, publishers
WHERE authors.au_id = titleauthor.au_id
AND titleauthor.title_id = titles.title_id
AND titles.pub_id = publishers.pub_id
) AS counts;

-- Challenge 3 - Best Selling Authors
SELECT authors.au_id AS `AUTHOR ID`, authors.au_lname AS `LAST NAME`, authors.au_fname AS `FIRST NAME`, COUNT(titles.title_id) AS `TOTAL` FROM authors, titleauthor, titles
WHERE authors.au_id = titleauthor.au_id
AND titleauthor.title_id = titles.title_id
GROUP BY authors.au_id
ORDER BY `TOTAL` DESC LIMIT 3;

-- Challenge 4 - Best Selling Authors Ranking
SELECT authors.au_id AS `AUTHOR ID`, authors.au_lname AS `LAST NAME`, authors.au_fname AS `FIRST NAME`, COUNT(titles.title_id) AS `TOTAL` FROM authors, titleauthor, titles
WHERE authors.au_id = titleauthor.au_id
AND titleauthor.title_id = titles.title_id
GROUP BY authors.au_id
ORDER BY `TOTAL` DESC LIMIT 23;