SELECT 
    
        job_title_short AS job ,
        job_location AS location ,
        job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST'  AS date ,
        EXTRACT (MONTH FROM job_posted_date) AS month_column

        FROM job_postings_fact 
        LIMIT 5 ;