# Introduction
Welcome to my project, where I dive into data 📊 to uncover trends in the job market for data analysts! This project leverages real-world datasets 🗄️ to analyze salaries 💰, skills 🛠️, and industry demands across sectors like tech 🌐, finance 💹, and more.
Core tools like SQL 🗄️, Python 🐍, and visualization platforms such as Tableau 📈 or Power BI 📊 are in focus, along with emerging technologies driving the next wave of opportunities 🌟. Let’s uncover insights that illuminate the career path of a data analyst!

SQL queries? Check them out here: [project_sql folder](/project_sql/)

# Background
The demand for data analysts has skyrocketed as companies across industries rely on data to make smarter decisions and stay ahead. Data analysts are the ones who take messy data, clean it up, and turn it into insights that businesses can actually use. It’s a role that’s become a huge deal in today’s world, and I’ve always been fascinated by the impact it has.
I started this project because I wanted to dig deeper into what it takes to be a data analyst—what skills are in demand, how salaries vary, and which industries are hiring. By analyzing real-world data, I hope to uncover trends and patterns that not only help me understand the job market better but also offer some guidance to others interested in this field.
### The questions I wanted to answer through my project were:

1. What are the top paying Data Analyst job?
2. What skills are required for top paying Data Analyst jobs?
3. What are the most in demand skills for data analysts?
4. What are the top skills based on salaries?
5. What are the most optimal skills to learn(optimal:high demand and high paying)?

The data for this project is taken from [SQL Course](https://lukebarousse.com/sql). It's filled with insights on job market regarding the positions, salaries and many more

# Tools I Used
To analyze the data and build insights about the job market for data analysts, I utilized the following tools:

- **SQL:** SQL was used to query, filter, and manipulate the data. Its ability to efficiently handle structured datasets made it an essential tool for this project, helping to extract meaningful insights from the raw data.

- **PostgreSQL:** PostgreSQL, a powerful open-source relational database system, served as the backbone for storing and managing the dataset. It provided advanced querying capabilities and excellent support for handling large datasets.

- **VS Code:** Visual Studio Code was my primary code editor for writing SQL queries and managing the project. Its extensions and integrated tools made development smoother and more efficient.

- **Git:** Git was used for version control, enabling me to track changes, experiment with different approaches, and maintain a clear history of my work.

- **GitHub:** GitHub served as the platform to host and share my project. It allowed me to collaborate (if needed), showcase my work, and make it easily accessible to others interested in the findings.

# The Analysis
Each query is structured to answer specific aspect of the job market. Here's how I aproached the questions:

### What are the top-paying Data Analyst jobs?
This query explores which specific roles or specializations within the field of data analysis command the highest salaries. By analyzing salary data, the project highlights the most lucrative opportunities for data analysts.
``` sql
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
```
The project analyzed job postings for data analyst positions across various companies. Key findings include:

- Salary Range: Salaries for full-time data analyst roles range from $184,000 to $650,000 annually.
- Job Levels: Positions vary from entry-level analysts to director-level roles.
- Work Flexibility: Most jobs offer "Anywhere" location with some hybrid or remote options.
- Recent Postings: Listings were posted throughout 2023, with the latest in December.
These trends highlight a broad range of opportunities within the data analysis field, catering to different experience levels and offering flexible work arrangements.

![top paying jobs](assets/1.png)
*Bar graph to visualize the top paying jobs for data analysts; Chatgpt generated this graph from my SQL query result*


# What I Learned
# Conclusions
