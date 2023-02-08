-- Dev 1
SELECT
	emp.emp_no,
	emp.first_name,
	emp.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO num_ret
FROM employees as emp
INNER JOIN titles as ti
ON (emp.emp_no = ti.emp_no)
WHERE (emp.birth_date BETWEEN '1952-01-01' AND '1955-12-31' )
order by emp_no

-- Distinc on Practice
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM num_ret
WHERE (to_date = '9999-01-01')
ORDER BY emp_no, to_date DESC

-- Num emp by most recent job title
SELECT COUNT(unique_titles.title),
	unique_titles.title
INTO retiring_titels
FROM unique_titles
GROUP BY title
ORDER BY COUNT(unique_titles.title) DESC

-- Dev 2
SELECT DISTINCT ON (emp_no) 
	emp.emp_no,
	emp.first_name,
	emp.last_name,
	emp.birth_date,
	de.from_date,
	de.to_date,
	ti.title
INTO mentorship_eligibility
FROM employees as emp
LEFT JOIN dept_emp as de
ON (emp.emp_no = de.emp_no)
LEFT JOIN titles as ti
ON (emp.emp_no = ti.emp_no)
WHERE (de.to_date = '9999-01-01') AND (emp.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp.emp_no