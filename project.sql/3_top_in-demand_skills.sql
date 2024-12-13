/*What are the top 5 demanded skills for "Data Analyst" ? */
SELECT
        skills,
        COUNT(skills_dim.skill_id) AS skill_counter
FROM
        job_postings_fact
        INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
        INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
        job_title_short = 'Data Analyst'
GROUP BY
        skills
ORDER BY
        skill_counter DESC
LIMIT
        5