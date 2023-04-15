USE publications;

-- CHALLENGE 1
SELECT aut.au_id
	,aut.au_lname
	,aut.au_fname
    ,tit.title
    ,pub.pub_name
FROM authors aut
	LEFT JOIN titleauthor ON aut.au_id = titleauthor.au_id
    LEFT JOIN titles tit ON tit.title_id = titleauthor.title_id
    LEFT JOIN publishers pub ON pub.pub_id = tit.pub_id
WHERE tit.title IS NOT NULL
ORDER BY 1, 5 DESC;

-- CHALLENGE 2
SELECT aut.au_id
	,aut.au_lname
	,aut.au_fname
    ,pub.pub_name
    ,COUNT(tit.title) AS title_count
FROM authors aut
	LEFT JOIN titleauthor ON aut.au_id = titleauthor.au_id
    LEFT JOIN titles tit ON tit.title_id = titleauthor.title_id
    LEFT JOIN publishers pub ON pub.pub_id = tit.pub_id
WHERE tit.title IS NOT NULL
GROUP BY 1, 2, 3, 4
ORDER BY 5 DESC, 1 DESC;

-- CHALLENGE 3
SELECT aut.au_id
	,aut.au_lname
	,aut.au_fname
    ,SUM(sales.qty) AS total_sales
FROM authors aut
	LEFT JOIN titleauthor ON titleauthor.au_id = aut.au_id
	LEFT JOIN sales ON sales.title_id = titleauthor.title_id
GROUP BY 1, 2, 3
ORDER BY 4 DESC
LIMIT 3;

-- CHALLENGE 4
SELECT aut.au_id
	,aut.au_lname
	,aut.au_fname
    ,CASE WHEN SUM(sales.qty) IS NULL THEN 0 ELSE SUM(sales.qty) END AS total_sales
FROM authors aut
	LEFT JOIN titleauthor ON titleauthor.au_id = aut.au_id
	LEFT JOIN sales ON sales.title_id = titleauthor.title_id
GROUP BY 1, 2, 3
ORDER BY 4 DESC;
