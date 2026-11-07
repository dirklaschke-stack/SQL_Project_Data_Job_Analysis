# SQL for Data Analytics

[![Course: Luke Barousse](https://img.shields.io/badge/Course-Luke_Barousse-blue.svg)](https://www.lukebarousse.com/)
[![Database: PostgreSQL](https://img.shields.io/badge/Database-PostgreSQL-336791.svg)](https://www.postgresql.org/)
[![Tool: VS Code](https://img.shields.io/badge/Tool-VS_Code-007ACC.svg)](https://code.visualstudio.com/)

This repository showcases my hands-on coursework, queries, and final capstone project from the **SQL for Data Analytics** course by **Luke Barousse**.

## Course Overview & Core Competencies

The course centers on practical, real-world data analysis using relational database systems:

* **Advanced SQL Querying:** Complex joins (`INNER`, `LEFT`, `RIGHT`, `FULL`), subqueries, and Common Table Expressions (`CTEs`).
* **Aggregations & Grouping:** Aggregate functions, `HAVING` filters, functional dependency evaluations, and performance considerations in `GROUP BY`.
* **Data Cleaning & Manipulation:** Handling `NULL` values, type conversions (`CAST`), and date/time operations (`EXTRACT`, `DATE_TRUNC`).
* **Analytical Problem Solving:** Translating business questions into efficient, clean, and maintainable SQL queries.


## Tech Stack & Tools

| Tool / Technology | Purpose |
| :--- | :--- |
| **PostgreSQL** | Relational database hosting real-world job posting datasets |
| **VS Code** | IDE with SQLTools integration for interactive query execution |
| **Git & GitHub** | Version control, documentation, and portfolio hosting |


## Capstone Project: Data Analyst Job Market Analysis

The capstone project analyzes a rich dataset of real-world job postings to identify key labor market trends for data professionals.

### Key Business Questions Addressed:
1. **Top Demanded Skills:** Which capabilities appear most frequently in job descriptions?
2. **Top Paying Skills:** Which technical competencies command the highest average salaries?
3. **Optimal Skills:** Where is the sweet spot between high market demand and premium compensation?

---

### 📈 Key Insights & Visualizations

#### 1. Most Demanded Skills
> SQL and Excel lead the market in overall demand, closely followed by Python and BI tools (Tableau, Power BI).

```sql
-- Query snippet: Top 5 in-demand skills for Data Analysts
SELECT
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_postings_fact.job_title_short = 'Data Analyst'
GROUP BY skills_dim.skill_id
ORDER BY demand_count DESC
LIMIT 5;

