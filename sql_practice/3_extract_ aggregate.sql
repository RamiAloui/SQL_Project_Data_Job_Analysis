SELECT 
        COUNT (job_id) AS Job_posted_count,
        EXTRACT (MONTH FROM job_posted_date) AS month

        FROM job_postings_fact
        WHERE job_title_short ='Data Analyst'  

        GROUP BY 
            month 
        ORDER BY 
        job_posted_count DESC ;