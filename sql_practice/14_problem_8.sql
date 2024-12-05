

With first_quarter_jobs AS (

SELECT * 
FROM jan_2023_jobs
UNION ALL
SELECT *
 FROM feb_2023_jobs 
UNION ALL
SELECT *
 FROM mar_2023_jobs


)

SELECT * FROM first_quarter_jobs

WHERE salary_year_avg > 70000 AND job_title_short = 'Data Analyst'

ORDER BY salary_year_avg DESC 


