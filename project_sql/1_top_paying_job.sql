/* 
Question: what are the top paying Data Analyst job?
- Identify the top 10 highest paying Data Analyst role that are available remotely 
- Focuses on job posting with specified salaries (remove null)
- Why? Highlight the top paying job opportunities Data Analysts, offering insight into employment
*/

SELECT
    job_postings_fact.job_id,
    job_postings_fact.job_title,
    job_postings_fact.job_location,
    job_postings_fact.job_schedule_type,
    job_postings_fact.salary_year_avg,
    job_postings_fact.job_posted_date,
    company_dim.name as company_name
FROM
    job_postings_fact
    LEFT JOIN company_dim on job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg is not null
ORDER BY
    salary_year_avg DESC
LIMIT
    10