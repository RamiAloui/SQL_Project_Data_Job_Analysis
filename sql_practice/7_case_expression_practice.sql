SELECT salary_year_avg ,
    CASE
    WHEN salary_year_avg  < 50000  THEN 'Beginner Role'
    WHEN salary_year_avg  BETWEEN 50000 AND 100000 THEN 'Advanced Role'
    WHEN salary_year_avg  > 100000 THEN 'Experienced Role'
    END AS salaries_categories
FROM job_postings_fact 
WHERE job_title_short = 'Data Analyst' AND salary_year_avg IS NOT NULL
ORDER BY  salary_year_avg DESC ;