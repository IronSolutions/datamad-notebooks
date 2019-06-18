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