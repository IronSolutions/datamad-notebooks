# Alias
SELECT q.title FROM publis.titles as  q;

# Mutliple JOINs
SELECT titleauthor.au_id, titles.title FROM titleauthor 
	LEFT JOIN titles ON titleauthor.title_id = titles.title_id
	RIGHT JOIN titles ON titleauthor.title_id = titles.title_id;
    
# Concatenate string columns
SELECT CONCAT(au_lname, " ", au_fname) AS FullName FROM authors;

# Multiple joins grouped by title with concatenated authors
SELECT title, GROUP_CONCAT(CONCAT(au_lname, " ", au_fname) SEPARATOR ", "), count(*)
FROM titles as t 
	INNER JOIN titleauthor as ta ON t.title_id = ta.title_id
    INNER JOIN authors as au ON ta.au_id = au.au_id
    GROUP BY t.title;
    
# Union
SELECT  au_id, city as m FROM authors WHERE state="IN"
UNION
SELECT au_id, royaltyper as m FROM  titleauthor;


# Subquery
SELECT stor_id, m.title, m.title_id, payterms  FROM sales 
INNER JOIN titles as m ON sales.title_id = m.title_id
WHERE payterms != "Net 30" 
	AND  m.title_id IN (
		SELECT titles.title_id FROM sales 
		INNER JOIN titles ON sales.title_id = titles.title_id
		WHERE payterms = "Net 30"
	);
    
# Subquery
SELECT Store, Items/Orders AS AvgItems, Qty/Items AS AvgQty
FROM (
	SELECT stores.stor_name AS Store, COUNT(DISTINCT(ord_num)) AS Orders, COUNT(title_id) AS Items, SUM(qty) AS Qty
	FROM sales sales
	INNER JOIN stores stores ON stores.stor_id = sales.stor_id
	GROUP BY Store
) summary
WHERE Items/Orders > 1.0;


# Instead of subquery, calculate previous data in a temp table
CREATE TEMPORARY TABLE store_sales_summary
SELECT stores.stor_name AS Store, COUNT(DISTINCT(ord_num)) AS Orders, COUNT(title_id) AS Items, SUM(qty) AS Qty
	FROM sales sales
	INNER JOIN stores stores ON stores.stor_id = sales.stor_id
	GROUP BY Store;
    
SELECT Store, Items/Orders AS AvgItems, Qty/Items AS AvgQty FROM store_sales_summary WHERE Items/Orders > 1.0;

