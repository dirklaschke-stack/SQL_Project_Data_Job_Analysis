/*
What are the top skills based on salary?** 
- Look at the average salary associated with each skill for Data Analyst positions.
- Focuses on roles with specified salaries, regardless of location.
- Why? It reveals how different skills impact salary levels for Data Analysts and helps identify the most financially rewarding skills to acquire or improve. in the job market, providing insights into the most valuable skills for job seekers.
*/

SELECT
    skills_dim.skills,
    ROUND(AVG(job_postings_fact.salary_year_avg), 2) AS average_salary
FROM
    job_postings_fact
INNER JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    -- Filters job titles for 'Data Analyst' roles
    job_postings_fact.job_title_short = 'Data Analyst'
    AND job_postings_fact.salary_year_avg IS NOT NULL
GROUP BY
    skills_dim.skills
ORDER BY
    average_salary DESC
LIMIT 25;


--Key findings

/*
*Machine Learning & Deep Learning Dominate**: Skills in AI frameworks (DataRobot, MXNet, Keras, PyTorch, Hugging Face, TensorFlow) consistently command salaries well above $120k.
*DevOps & Infrastructure Skills Command a Premium**: Expertise in CI/CD, automation, and infrastructure-as-code (VMware, Terraform, GitLab, Puppet, Ansible) elevates data analyst roles into upper-echelon compensation.
*Big Data & Real-Time Streaming are Essential**: Distributed databases and pipeline orchestration tools (Couchbase, Kafka, Cassandra, Airflow, Scala) reflect high demand for managing complex, scalable data systems.
*Specialized Languages Outearn Generalists**: High salaries are tied to niche or high-performance languages such as Solidity ($179k), Golang ($155k), and deep R ecosystem knowledge (dplyr at $147k).
*High Outliers Reflect Small Sample Sizes**: SVN ($400k) is almost certainly a statistical artifact caused by very few postings (e.g., a single high-level executive position mentioning a legacy tool), highlighting the need for a minimum posting threshold (like `COUNT(*) > 10`).

*/

--results as json

/*
[
  {
    "skills": "svn",
    "average_salary": "400000.00"
  },
  {
    "skills": "solidity",
    "average_salary": "179000.00"
  },
  {
    "skills": "couchbase",
    "average_salary": "160515.00"
  },
  {
    "skills": "datarobot",
    "average_salary": "155485.50"
  },
  {
    "skills": "golang",
    "average_salary": "155000.00"
  },
  {
    "skills": "mxnet",
    "average_salary": "149000.00"
  },
  {
    "skills": "dplyr",
    "average_salary": "147633.33"
  },
  {
    "skills": "vmware",
    "average_salary": "147500.00"
  },
  {
    "skills": "terraform",
    "average_salary": "146733.83"
  },
  {
    "skills": "twilio",
    "average_salary": "138500.00"
  },
  {
    "skills": "gitlab",
    "average_salary": "134126.00"
  },
  {
    "skills": "kafka",
    "average_salary": "129999.16"
  },
  {
    "skills": "puppet",
    "average_salary": "129820.00"
  },
  {
    "skills": "keras",
    "average_salary": "127013.33"
  },
  {
    "skills": "pytorch",
    "average_salary": "125226.20"
  },
  {
    "skills": "perl",
    "average_salary": "124685.75"
  },
  {
    "skills": "ansible",
    "average_salary": "124370.00"
  },
  {
    "skills": "hugging face",
    "average_salary": "123950.00"
  },
  {
    "skills": "tensorflow",
    "average_salary": "120646.83"
  },
  {
    "skills": "cassandra",
    "average_salary": "118406.68"
  },
  {
    "skills": "notion",
    "average_salary": "118091.67"
  },
  {
    "skills": "atlassian",
    "average_salary": "117965.60"
  },
  {
    "skills": "bitbucket",
    "average_salary": "116711.75"
  },
  {
    "skills": "airflow",
    "average_salary": "116387.26"
  },
  {
    "skills": "scala",
    "average_salary": "115479.53"
  }
]

*/