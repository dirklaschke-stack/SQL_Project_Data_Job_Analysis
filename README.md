# SQL for Data Analytics

This repository showcases course content and final capstone project from the **SQL for Data Analytics** course by **Luke Barousse**. The course provides an end-to-end foundation in SQL and relational database analytics, using real-world tech job posting data to advance from core querying to production-grade PostgreSQL development

[![Course: Luke Barousse](https://img.shields.io/badge/Course-Luke_Barousse-blue.svg)](https://www.lukebarousse.com/)
[![Database: PostgreSQL](https://img.shields.io/badge/Database-PostgreSQL-336791.svg)](https://www.postgresql.org/)
[![Tool: VS Code](https://img.shields.io/badge/Tool-VS_Code-007ACC.svg)](https://code.visualstudio.com/)

## Course Content


* **Relational DB Basics:** RDBMS concepts, star schemas, fact vs. dimension tables
* **Core Querying:** Retrieval, aliases, deduplication, and sorting (`SELECT`, `AS`, `DISTINCT`, `ORDER BY`, `LIMIT`)
* **Filtering:** Conditions, ranges, wildcards, and null handling (`WHERE`, `IN`, `BETWEEN`, `LIKE`, `IS NULL`)
* **Aggregation:** Summary statistics with grouping and filter conditions (`COUNT`, `SUM`, `AVG`, `GROUP BY`, `HAVING`)
* **Table Joins:** Relational linking via `INNER`, `LEFT`, `RIGHT`, and `OUTER JOIN`
* **Query Execution:** Internal DB execution logic (`FROM` → `WHERE` → `GROUP BY` → `SELECT`)
* **DDL & DML:** Schema creation, alteration, data manipulation, and CSV loading (`CREATE`, `ALTER`, `INSERT`, `UPDATE`, `COPY`)
* **Subqueries & CTEs:** Complex query modularization via nested subqueries and `WITH` clauses
* **Logic & Set Operations:** Branching logic (`CASE WHEN`) and dataset merging (`UNION`, `UNION ALL`)
* **Dates & Tooling:** Temporal analysis (`EXTRACT`, time zones) in local PostgreSQL and VS Code environments


## Tools

| Tool  | Purpose |
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

