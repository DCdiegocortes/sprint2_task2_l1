# 📊 Sprint 2 MYSQL Queries Practice: Store & University Databases

 ## 📌 Description

The goal is to develop the ability to formulate precise and meaningful queries, understand relationships between tables, and extract relevant information efficiently.

Throughout the exercises, different levels of complexity are covered — from basic data retrieval to advanced queries involving multiple tables, filtering, ordering, and aggregations.

## 🛠 Technologies

- SQL (MySQL)
  
## 📂 Project Structure

- `StoreQueries.sql` → SQL queries related to the Store database  
- `UniversityQueries.sql` → SQL queries related to the University database  
- `README.md` → Project documentation and overview  

## 🧠 What was practiced

### 🔹 Basic Queries
- Selecting specific columns and full tables
- Filtering data with `WHERE`
- Sorting results with `ORDER BY`

### 🔹 Data Transformation
- Using functions like:
  - `UPPER()`, `LOWER()`
  - `ROUND()`, `TRUNCATE()`
- Calculated fields and aliases

### 🔹 Joins and Relationships
- `INNER JOIN`
- `LEFT JOIN`
- Understanding relationships between tables (1:N)

### 🔹 Advanced Queries
- Aggregation functions:
  - `COUNT()`
  - `SUM()`
- Grouping results with `GROUP BY`
- Filtering groups using `HAVING`

### 🔹 Query Optimization & Best Practices
- Writing clear and readable queries
- Using appropriate aliases
- Ensuring consistent result ordering
- Avoiding unnecessary data retrieval


## 🗄️ Databases Used

### 🛒 Store Database
- Tables:
  - `producto`
  - `fabricante`
- Focus:
  - Basic queries
  - Relationships between products and manufacturers

### 🎓 University Database
- Tables:
  - `persona`, `profesor`, `departamento`
  - `grado`, `asignatura`
  - `curso_escolar`, `alumno_se_matricula_asignatura`
- Focus:
  - Complex joins
  - Multi-table relationships
  - Aggregation and reporting queries

## 🚀 How to run

1. Create the database:
```sql
DROP DATABASE IF EXISTS universidad;
CREATE DATABASE universidad;
USE universidad;

