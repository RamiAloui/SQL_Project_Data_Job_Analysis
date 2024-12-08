CREATE TABLE data_analyst_jobs (
    job_id INT PRIMARY KEY,
    job_title_short VARCHAR(100),
    salary_year_avg DECIMAL(10, 2),
    job_location VARCHAR(100),
    company_name VARCHAR(100),
    skills_required VARCHAR(255),
    job_work_from_home BOOLEAN
);

INSERT INTO data_analyst_jobs (job_id, job_title_short, salary_year_avg, job_location, company_name, skills_required, job_work_from_home)
VALUES
    (1, 'Data Analyst', 55000.00, 'Lisbon, Portugal', 'TechCorp', 'SQL, Python, Excel', true),
    (2, 'Data Analyst', 60000.00, 'Porto, Portugal', 'DataSolutions', 'SQL, Tableau, Power BI', false),
    (3, 'Data Analyst', 70000.00, 'Lisbon, Portugal', 'DataAnalytics Inc.', 'Python, Excel, Power BI', true);

UPDATE data_analyst_jobs
SET salary_year_avg = 65000.00
WHERE job_id = 2;

DELETE FROM data_analyst_jobs
WHERE job_id = 3;

DROP TABLE data_analyst_jobs;
