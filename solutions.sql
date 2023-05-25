use publications;
-- CHALLANGE 1 --
select 
a.au_id AS "AUTHOR ID", au_lname AS "LAST NAME", au_fname "FIRST NAME", c.title "TITLE", d.pub_name "PUBLISHER"
from authors as a 
join titleauthor as b on a.au_id=b.au_id
join titles as c on b.title_id=c.title_id
join publishers as d on c.pub_id=d.pub_id
ORDER BY 1, 5 DESC;

SELECT COUNT(*) AS row_count
FROM titleauthor;

-- CHALLANGE 2 --
SELECT 
	a.au_id AS "AUTHOR ID", 
	au_lname AS "LAST NAME", 
	au_fname AS "FIRST NAME", 
	d.pub_name AS "PUBLISHER",
    COUNT(c.title) AS "TITLE COUNT"
FROM 
	authors as a 
    join titleauthor as b on a.au_id=b.au_id
	join titles as c on b.title_id=c.title_id
	join publishers as d on c.pub_id=d.pub_id
    GROUP BY
    a.au_id,
    au_lname,
    au_fname,
    d.pub_name
ORDER BY COUNT(c.title) DESC;

SELECT COUNT(*) AS "TITLE COUNT"
FROM titleauthor;

-- CHALLANGE 3 --
SELECT 
	a.au_id AS "AUTHOR ID", 
	au_lname AS "LAST NAME", 
	au_fname AS "FIRST NAME",
    COUNT(d.title_id) AS "TOTAL"
FROM 
	authors as a 
    join titleauthor as b on a.au_id=b.au_id
	join titles as c on b.title_id=c.title_id
	join sales as d on c.title_id=d.title_id
    GROUP BY
    b.au_id
ORDER BY COUNT(d.title_id) DESC
limit 3;


-- CHALLANGE 4 --
SELECT 
	a.au_id AS "AUTHOR ID", 
	au_lname AS "LAST NAME", 
	au_fname AS "FIRST NAME",
    COUNT(d.title_id) AS "TOTAL"
FROM 
	authors as a 
    join titleauthor as b on a.au_id=b.au_id
	join titles as c on b.title_id=c.title_id
	join sales as d on c.title_id=d.title_id
    GROUP BY
    b.au_id
ORDER BY COUNT(d.title_id) DESC;
-- no me salen los de 0 -- 