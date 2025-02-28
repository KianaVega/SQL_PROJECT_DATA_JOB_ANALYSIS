Collecting workspace informationFiltering to most relevant information# SQL Data Job Analysis Practice

## Introduction
This project aims to analyze job postings for Data Analyst roles to identify the most in-demand and high-paying skills. The focus is on remote positions with specified salaries, providing strategic insights for career development in data analysis.

## Background
The job market for Data Analysts is highly competitive, with various skills being sought after by employers. This project analyzes job postings to determine which skills are in high demand and associated with high average salaries. By concentrating on remote positions, the analysis targets skills that offer job security and financial benefits.

## Tools Used
- **PostgreSQL**: For database management and executing SQL queries.
- **SQLTools**: A Visual Studio Code extension for connecting to and managing SQL databases.
- **Visual Studio Code**: The integrated development environment (IDE) used for writing and running SQL queries.

## The Analysis
The analysis involves the following steps:
1. **Data Collection**: Job postings data is collected and stored in a PostgreSQL database.
2. **Data Preparation**: The data is cleaned and structured to facilitate analysis.
3. **SQL Queries**: SQL queries are written to analyze the data and extract insights. The main query identifies skills in high demand and associated with high average salaries for Data Analyst roles.
4. **Results**: The results are filtered to include only skills with a demand count greater than 10 and are ordered by average salary and demand count.

### Key SQL Query
```sql
WITH skills_demand AS (
    SELECT
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS demand_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst' AND
        salary_year_avg IS NOT NULL AND
        job_work_from_home = TRUE
    GROUP BY
        skills_dim.skill_id, skills_dim.skills
), average_salary AS (
    SELECT
        skills_job_dim.skill_id,
        ROUND(AVG(salary_year_avg), 0) AS avg_salary
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst' AND
        salary_year_avg IS NOT NULL AND
        job_work_from_home = TRUE
    GROUP BY
        skills_job_dim.skill_id
)

SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    skills_demand.demand_count,
    average_salary.avg_salary
FROM skills_demand
INNER JOIN average_salary ON skills_demand.skill_id = average_salary.skill_id
WHERE
    skills_demand.demand_count > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25;
```

## What I Learned
- **SQL Proficiency**: Improved skills in writing complex SQL queries, including the use of common table expressions (CTEs) and aggregate functions.
- **Data Analysis**: Gained insights into the job market for Data Analysts, particularly the skills that are in high demand and command high salaries.
- **Tool Integration**: Learned to effectively use PostgreSQL and SQLTools within Visual Studio Code for data analysis.

## Conclusions
The analysis provided valuable insights into the most in-demand and high-paying skills for Data Analyst roles. By focusing on remote positions, the project identified skills that offer both job security and financial benefits. This information can be used by aspiring Data Analysts to strategically develop their skill sets and enhance their career prospects.
