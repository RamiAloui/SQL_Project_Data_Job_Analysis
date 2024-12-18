/* What are the top 10 highest-paying "Data Analyst" jobs with remote work options, 
and what companies are offering those roles ?*/
WITH
        top_paying_jobs AS (
                SELECT
                        job_id,
                        job_title_short,
                        salary_year_avg,
                        job_location,
                        name AS company_name
                FROM
                        job_postings_fact
                        LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
                WHERE
                        job_work_from_home = true
                        AND salary_year_avg is NOT NULL
                        AND job_title_short = 'Data Analyst'
                ORDER BY
                        salary_year_avg DESC
                LIMIT
                        10
        )
SELECT
        top_paying_jobs.*,
        skills
FROM
        top_paying_jobs
        INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
        INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
        salary_year_avg DESC
LIMIT
        100