SELECT 
    a.au_id AS 'AUTHOR ID', 
    a.au_lname AS 'LAST NAME', 
    a.au_fname AS 'FIRST NAME', 
    t.title AS 'TITLE', 
    p.pub_name AS 'PUBLISHER'
FROM 
    publications.authors a
JOIN 
    publications.titleauthor ta ON a.au_id = ta.au_id
JOIN 
    publications.titles t ON ta.title_id = t.title_id
JOIN 
    publications.publishers tp ON t.title_id = t.title_id
JOIN 
    publications.publishers p ON t.pub_id = p.pub_id;



SELECT 
    a.au_id AS 'AUTHOR ID', 
    a.au_lname AS 'LAST NAME', 
    a.au_fname AS 'FIRST NAME', 
    p.pub_name AS 'PUBLISHER', 
    COUNT(DISTINCT t.title_id) AS 'TITLE COUNT'
FROM 
    publications.authors a
JOIN 
    publications.titleauthor ta ON a.au_id = ta.au_id
JOIN 
    publications.titles t ON ta.title_id = t.title_id
JOIN 
    publications.publishers p ON t.pub_id = p.pub_id
GROUP BY 
    a.au_id, 
    a.au_lname, 
    a.au_fname, 
    p.pub_name;



SELECT 
    a.au_id AS 'AUTHOR ID', 
    a.au_lname AS 'LAST NAME', 
    a.au_fname AS 'FIRST NAME', 
    SUM(s.qty) AS 'TOTAL'
FROM 
    publications.authors a
JOIN 
    publications.titleauthor ta ON a.au_id = ta.au_id
JOIN 
    publications.sales s ON ta.title_id = s.title_id
GROUP BY 
    a.au_id, 
    a.au_lname, 
    a.au_fname
ORDER BY 
    TOTAL DESC
LIMIT 3;



SELECT 
    a.au_id AS 'AUTHOR ID', 
    a.au_lname AS 'LAST NAME', 
    a.au_fname AS 'FIRST NAME', 
    SUM(s.qty) AS 'TOTAL'
FROM 
    publications.authors a
JOIN 
    publications.titleauthor ta ON a.au_id = ta.au_id
JOIN 
    publications.sales s ON ta.title_id = s.title_id
GROUP BY 
    a.au_id, 
    a.au_lname, 
    a.au_fname
ORDER BY 
    TOTAL DESC
LIMIT 3;


SELECT 
    a.au_id AS 'AUTHOR ID', 
    a.au_lname AS 'LAST NAME', 
    a.au_fname AS 'FIRST NAME', 
    IFNULL(SUM(s.qty), 0) AS 'TOTAL'
FROM 
    publications.authors a
LEFT JOIN 
    publications.titleauthor ta ON a.au_id = ta.au_id
LEFT JOIN 
    publications.sales s ON ta.title_id = s.title_id
GROUP BY 
    a.au_id, 
    a.au_lname, 
    a.au_fname
ORDER BY 
    TOTAL DESC;
