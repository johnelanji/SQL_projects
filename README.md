# SQL_projects

# ⚽ FIFA SQL Project

This project explores player and club data from a FIFA dataset using SQL. The analysis is done using MySQL and covers a wide range of SQL concepts from beginner to advanced, including aggregation, conditional filtering, string manipulation, window functions, and date operations.

---

## 📊 Dataset Overview

The dataset (`fifa`) includes information on players such as:
- Player name
- Club
- Nationality
- Overall rating
- Preferred foot
- Joining date
- Jersey number

> 🔍 Note: The `joined` column is stored as a string and converted to `DATE` using `STR_TO_DATE()`.

---

## 🧠 Key SQL Concepts Covered

- `STR_TO_DATE()` for string to date conversion
- `GROUP BY`, `ORDER BY`, and `HAVING` clauses
---

## 📌 Sample Queries Included

### 1. Players Who Joined Between Two Dates
```sql
SELECT Club, COUNT(Name) AS Number_of_players
FROM fifa
WHERE STR_TO_DATE(joined, '%d %M %Y') BETWEEN '2018-05-20' AND '2019-04-10'
GROUP BY Club;
