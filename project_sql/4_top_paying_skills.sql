/*
Question: what are the top skills based on salaries?
- Look at the average salary associated with each skills for Data analyst positions
- focuses on the roles with specified salaries, regardless of the locations
- why? It reveals how different skills impact salary levels for data analysts and 
    help identify the most financially rewarding skills to aquire or improve
*/

SELECT 
    skills,
    round(avg(salary_year_avg)) as skill_avg_salary
FROM
    job_postings_fact
    INNER JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' and 
    salary_year_avg is not null
GROUP BY
    skills
ORDER BY
    skill_avg_salary DESC
LIMIT 5

/*
Here's the break down:
The data reveals three key insights about the job market for tech skills. 
First, specialized expertise in tools like svn commands exceptionally high salaries, 
with an average of 400,000, likely due to its niche application or critical 
importance in legacy systems. Second, emerging technologies such as Solidity, 
widely used for blockchain and smart contract development, show strong demand 
with an average salary of 179,000, reflecting the industry's growing focus on 
decentralized applications. Lastly, the list underscores the diversity of skills 
valued in tech today, ranging from databases like Couchbase and automation tools 
like DataRobot to efficient programming languages like Golang, with average 
salaries spanning 155,000–160,515. This highlights the industry's demand for 
professionals proficient in tools that drive innovation in data, AI/ML, and modern 
software development.

[
  {
    "skills": "svn",
    "skill_avg_salary": "400000"
  },
  {
    "skills": "solidity",
    "skill_avg_salary": "179000"
  },
  {
    "skills": "couchbase",
    "skill_avg_salary": "160515"
  },
  {
    "skills": "datarobot",
    "skill_avg_salary": "155486"
  },
  {
    "skills": "golang",
    "skill_avg_salary": "155000"
  }
]
*/