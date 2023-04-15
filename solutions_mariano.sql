-- Challenge 1:
USE publications;
SELECT 
	a.au_id as author_id,
    a.au_lname as last_name,
    a.au_fname as first_name,
    t.title,
    p.pub_name as publisher
FROM titles t
	LEFT JOIN titleauthor ta
	ON t.title_id = ta.title_id
	LEFT JOIN authors a
	ON ta.au_id = a.au_id
    LEFT JOIN publishers p
	ON p.pub_id = t.pub_id
WHERE a.au_id IS NOT NULL
ORDER BY 1;

-- Challenge 2:
USE publications;
SELECT 
	a.au_id as author_id,
    a.au_lname as last_name,
    a.au_fname as first_name,
    p.pub_name as publisher,
    count(t.title)
FROM titles t
	LEFT JOIN titleauthor ta
	ON t.title_id = ta.title_id
	LEFT JOIN authors a
	ON ta.au_id = a.au_id
    LEFT JOIN publishers p
	ON p.pub_id = t.pub_id
WHERE a.au_id IS NOT NULL
GROUP BY 1,2,3,4
ORDER BY 5 DESC, 1 DESC;

-- Challenge 3:
USE publications;
SELECT 
	a.au_id as author_id,
    a.au_lname as last_name,
    a.au_fname as first_name,
    sum(s.qty) as total
FROM titles t
	LEFT JOIN titleauthor ta
	ON t.title_id = ta.title_id
	LEFT JOIN authors a
	ON ta.au_id = a.au_id
    LEFT JOIN sales s
	ON s.title_id = t.title_id
WHERE a.au_id IS NOT NULL
GROUP BY 1,2,3
ORDER BY 4 DESC
LIMIT 3;

-- Challenge 4: FOR SOME REASON, I ONLY GET 20 AND NOT 23 (TO BE ASKED)
USE publications;
SELECT 
	a.au_id as author_id,
    a.au_lname as last_name,
    a.au_fname as first_name,
    CASE WHEN s.qty is null THEN 0 
		WHEN s.qty = 0 THEN 0 
        ELSE SUM(s.qty) END AS total
FROM titles t
	LEFT JOIN titleauthor ta
	ON t.title_id = ta.title_id
	LEFT JOIN authors a
	ON ta.au_id = a.au_id
    LEFT JOIN sales s
	ON s.title_id = t.title_id
GROUP BY 1,2,3
ORDER BY 4 DESC;