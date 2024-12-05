/* Find the count of the number of the remote job posting per skill
 -Displaay the top 5 skills by their demand in remote jobs 
 -Include skill id , name and count of posting requiring the skill */



WITH remote_jobs_counter AS (
   SELECT
      skill_id,
      COUNT (*) AS skill_count
   FROM 
   skills_job_dim

   INNER JOIN job_postings_fact ON job_postings_fact.job_id = skills_job_dim.job_id
   WHERE
   job_work_from_home = true
   GROUP By skill_id
)


SELECT 
      skills_dim.skill_id,
      skills AS skill_name,
      skill_count

FROM remote_jobs_counter

INNER JOIN skills_dim ON skills_dim.skill_id = remote_jobs_counter.skill_id
ORDER BY skill_count DESC
LIMIT 5