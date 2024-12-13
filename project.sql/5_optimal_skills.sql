/* WHat are the optimal skills to learn */
WIth
        skills_demand AS (
                SELECT
                        skills_dim.skill_id,
                        skills_dim.skills,
                        COUNT(skills_dim.skill_id) AS demand_count
                FROM
                        job_postings_fact
                        INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
                        INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
                WHERE
                        job_title_short = 'Data Analyst'
                        AND salary_year_avg IS NOT NULL
                GROUP BY
                        skills_dim.skill_id
        ),
        average_salary AS (
                SELECT
                        skills_dim.skill_id,
                        ROUND(AVG(salary_year_avg), 0) AS average_salary
                FROM
                        job_postings_fact
                        INNER JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
                        INNER JOIN skills_dim on skills_dim.skill_id = skills_job_dim.skill_id
                WHERE
                        job_title_short = 'Data Analyst'
                        AND salary_year_avg IS NOT NULL
                GROUP BY
                        skills_dim.skill_id
        )
SELECT
        skills_demand.skills,
        demand_count,
        average_salary
FROM
        skills_demand
        INNER JOIN average_salary ON average_salary.skill_id = skills_demand.skill_id
WHERE
        demand_count > 10
ORDER BY
        demand_count DESC,
        average_salary DESC
LIMIT
        25