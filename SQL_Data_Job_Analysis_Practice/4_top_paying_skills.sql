/* 
Answer: What are the top skills based on salary?
-Look at the average salary for each skill for Data Analyst positions.
-Focuses on roles with specified salaries, regardless of location.
- Why? It reveals how different skills impact slary levels for Data ANalysts and 
    helps identify the most  financially rewarding skills to acquire or improve.
*/

SELECT
    skills,
    ROUND(AVG(salary_year_avg),0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'  AND
    salary_year_avg IS NOT NULL
AND job_work_from_home = TRUE
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25;

/* Here are some key trends and insights from the top-paying skills for data analysts:

### **1. Big Data & Cloud Technologies Dominate the List**  
   - **PySpark** (#1, $208K), **Databricks** (#13, $142K), and **GCP** (#24, $123K) highlight the importance of big data processing and cloud-based analytics.
   - **Elasticsearch** (#10, $145K) and **Couchbase** (#3, $161K) show the demand for large-scale data storage and retrieval expertise.

### **2. AI/ML & Data Science Skills Are Highly Rewarded**  
   - **DataRobot** (#5, $155K) and **Scikit-learn** (#19, $126K) indicate that ML automation and traditional ML libraries are valuable.
   - **Jupyter** (#8, $153K), **Pandas** (#9, $152K), and **NumPy** (#12, $144K) reflect the strong earning potential of core Python data science tools.

### **3. DevOps & Engineering Tools Are Highly Valued**  
   - **Bitbucket** (#2, $189K), **GitLab** (#6, $154K), **Jenkins** (#20, $125K), and **Kubernetes** (#15, $133K) suggest that data analysts who integrate DevOps into their workflows earn more.
   - **Linux** (#14, $137K) is another strong indicator that infrastructure and system-level knowledge pay off.

### **4. Programming & Scripting Languages Matter**  
   - **Swift** (#7, $154K) and **Golang** (#11, $145K) suggest that analysts with programming expertise beyond Python are paid well.
   - **Scala** (#22, $125K) also aligns with big data engineering trends.

### **5. BI & Workflow Automation Skills Provide an Edge**  
   - **MicroStrategy** (#25, $122K) and **PostgreSQL** (#23, $124K) highlight the importance of database querying and business intelligence.
   - **Airflow** (#18, $126K) and **Twilio** (#17, $127K) show that workflow automation and communication APIs are lucrative.

### **6. Collaboration & Documentation Tools Appear**  
   - **Atlassian** (#16, $131K) and **Notion** (#21, $125K) suggest that knowledge of collaboration and project management tools is valuable.

### **Final Takeaway:**  
Data analysts with **big data, machine learning, cloud computing, and DevOps** skills earn significantly more. Traditional data analytics skills like SQL and Excel are not among the highest-paying, signaling a shift toward **automation, AI, and scalable data solutions**.

[
  {
    "skills": "pyspark",
    "avg_salary": "208172"
  },
  {
    "skills": "bitbucket",
    "avg_salary": "189155"
  },
  {
    "skills": "couchbase",
    "avg_salary": "160515"
  },
  {
    "skills": "watson",
    "avg_salary": "160515"
  },
  {
    "skills": "datarobot",
    "avg_salary": "155486"
  },
  {
    "skills": "gitlab",
    "avg_salary": "154500"
  },
  {
    "skills": "swift",
    "avg_salary": "153750"
  },
  {
    "skills": "jupyter",
    "avg_salary": "152777"
  },
  {
    "skills": "pandas",
    "avg_salary": "151821"
  },
  {
    "skills": "elasticsearch",
    "avg_salary": "145000"
  },
  {
    "skills": "golang",
    "avg_salary": "145000"
  },
  {
    "skills": "numpy",
    "avg_salary": "143513"
  },
  {
    "skills": "databricks",
    "avg_salary": "141907"
  },
  {
    "skills": "linux",
    "avg_salary": "136508"
  },
  {
    "skills": "kubernetes",
    "avg_salary": "132500"
  },
  {
    "skills": "atlassian",
    "avg_salary": "131162"
  },
  {
    "skills": "twilio",
    "avg_salary": "127000"
  },
  {
    "skills": "airflow",
    "avg_salary": "126103"
  },
  {
    "skills": "scikit-learn",
    "avg_salary": "125781"
  },
  {
    "skills": "jenkins",
    "avg_salary": "125436"
  },
  {
    "skills": "notion",
    "avg_salary": "125000"
  },
  {
    "skills": "scala",
    "avg_salary": "124903"
  },
  {
    "skills": "postgresql",
    "avg_salary": "123879"
  },
  {
    "skills": "gcp",
    "avg_salary": "122500"
  },
  {
    "skills": "microstrategy",
    "avg_salary": "121619"
  }
]
*/