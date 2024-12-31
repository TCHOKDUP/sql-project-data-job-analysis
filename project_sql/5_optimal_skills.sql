/*
Qestion: what are the most optimal skills to learn(optimal:high demand and high paying)
- Identify the skill in high demand and associate it with high average salaries for data analyst role
- concentrate on remote positions with specified salaries
- why? Targets skills that offer job security(high demand) and financial benefits(high salaries),
    offering strategic insight for career development in data analysts
*/

WITH skill_demand as (
    SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
        count(skills_job_dim.job_id) as demand_count
    FROM
        job_postings_fact
        INNER JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
        INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst' and 
        job_work_from_home = TRUE AND
        salary_year_avg is not null
    GROUP BY
        skills_dim.skill_id

), average_salary as (
    SELECT 
        skills_job_dim.skill_id,
        round(avg(salary_year_avg)) as skill_avg_salary
    FROM
        job_postings_fact
        INNER JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
        INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst' and 
        salary_year_avg is not null and 
        job_work_from_home = TRUE
    GROUP BY
        skills_job_dim.skill_id 
)

select
    skill_demand.skill_id,
    skill_demand.skills,
    demand_count,
    skill_avg_salary
from
    skill_demand
    inner join average_salary on skill_demand.skill_id = average_salary.skill_id
WHERE
    demand_count>10
ORDER BY
    skill_avg_salary DESC,
    demand_count DESC 
LIMIT
    25


