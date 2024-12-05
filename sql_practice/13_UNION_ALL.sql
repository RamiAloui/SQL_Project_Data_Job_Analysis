SELECT 
        job_title_short,
        company_id,
        job_location

FROM
       jan_2023_jobs 

UNION ALL


       SELECT 
        job_title_short,
        company_id,
        job_location

FROM 
       feb_2023_jobs 

       UNION ALL

       SELECT 
        job_title_short,
        company_id,
        job_location

FROM
       mar_2023_jobs 