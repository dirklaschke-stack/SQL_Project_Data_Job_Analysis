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
* **DDL & DML:** Schema creation, alteration, data manipulation, CSV loading (`CREATE`, `ALTER`, `INSERT`, `UPDATE`)
* **Subqueries & CTEs:** Complex query modularization via nested subqueries and `WITH` clauses
* **Logic & Set Operations:** Branching logic (`CASE WHEN`) and dataset merging (`UNION`, `UNION ALL`)
* **Dates & Tooling:** Temporal analysis (`EXTRACT`, time zones) in local PostgreSQL and VS Code environments


## Tools

| Tool  | Purpose |
| :--- | :--- |
| **PostgreSQL** | Relational database hosting real-world job posting datasets |
| **VS Code** | IDE with SQLTools integration for interactive query execution |
| **Git & GitHub** | Version control, documentation, and portfolio hosting |


## Capstone Project:

The course culminates in a capstone project focused on real-world labor market analytics. Using a normalized dataset of 2023 tech job postings, you analyze compensation patterns, market demand, and skill values to identify high-leverage career opportunities.

### Key Questions Addressed:
1. **Top-Paying Roles:** What are the highest-paying jobs available for the targeted role?
2. **Skills for Top Earners:** What specific technical skills are required for these top-paying positions?
3. **In-Demand Skills:** Which tools and technologies appear most frequently across all postings?
4. **Top Skills by Salary:** Which skills correlate with the highest average compensation?
5. **Optimal Skills:** Which high-value skills offer the ideal combination of high demand and premium pay?

---

### Key Insights & Visualizations

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

