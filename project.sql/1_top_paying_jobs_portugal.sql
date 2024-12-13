/* What are the top 10 highest-paying "Data Analyst" jobs in Portugal ? */
SELECT
        job_title_short,
        salary_year_avg,
        job_location,
        name AS company_name
FROM
        job_postings_fact
        LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
        job_location LIKE '%Portugal%'
        AND salary_year_avg is NOT NULL
        AND job_title_short = 'Data Analyst'
ORDER BY
        salary_year_avg DESC
LIMIT
        10