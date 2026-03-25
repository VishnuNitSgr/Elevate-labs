🦠 COVID-19 Data Analysis Using SQL

📌 Project Overview

This project focuses on analyzing real-world COVID-19 data using SQL. It involves importing raw data, cleaning and transforming it, and generating meaningful insights through analytical queries.

The project demonstrates how SQL can be used for data analysis, reporting, and trend identification.

⸻

🎯 Objectives
	•	Analyze COVID-19 dataset using SQL
	•	Perform data cleaning and preprocessing
	•	Generate insights using aggregation and filtering
	•	Use window functions for trend analysis
	•	Create reusable SQL views for reporting

⸻

🛠 Tools & Technologies
	•	SQLite
	•	DB Browser for SQLite
	•	SQL (Structured Query Language)
	•	CSV Dataset (COVID-19 data)

📂 Project Structure

```
covid-sql-analysis/
│
├── dataset/
│   └── covid_data.csv
│
├── database/
│   └── covid.db
│
├── sql/
│   ├── 01_schema.sql
│   ├── 03_cleaning.sql
│   ├── 04_analysis.sql
│   └── 05_views.sql
│
├── outputs/
│   ├── screenshots/
│   └── results.txt
│
└── README.md 
```


📊 Dataset Description

The dataset contains COVID-19 statistics such as:
	•	Country
	•	Date
	•	Confirmed Cases
	•	Deaths
	•	Recovered Cases

This data is used to track the spread and impact of COVID-19 across different countries.

⸻

⚙️ Workflow

The project follows a real-world data pipeline:
```Raw Data → Data Cleaning → Data Analysis → Reporting```


🔹 Steps Performed
	1.	Imported CSV dataset into SQLite
	2.	Created raw and cleaned tables
	3.	Handled missing values using COALESCE
	4.	Removed inconsistencies
	5.	Performed SQL analysis using JOINs and window functions
	6.	Created views for simplified reporting

⸻

🔍 Key SQL Queries

📌 Total Cases by Country
	•	Aggregates total confirmed cases per country

📌 Death Rate Analysis
	•	Calculates percentage of deaths relative to confirmed cases

📌 Top 5 Affected Countries
	•	Identifies countries with highest cases

📌 Daily New Cases
	•	Uses LAG() window function to calculate daily differences

📌 Cumulative Cases
	•	Uses SUM() OVER() for running totals


📈 Key Insights
	•	Identified countries with highest COVID-19 cases
	•	Analyzed death and recovery rates
	•	Observed daily trends and spikes in cases
	•	Tracked cumulative growth patterns using window functions

⸻

📊 Screenshots

The project includes screenshots demonstrating:
	•	Dataset preview
	•	Query outputs
	•	Aggregated results
	•	Window function analysis
	•	View outputs

⸻

🧠 Learning Outcomes
	•	Practical SQL data analysis
	•	Data cleaning techniques
	•	Use of aggregate functions
	•	Window functions (LAG, SUM OVER)
	•	Real-world data workflow
	•	Report generation using SQL

⸻

🚀 Future Improvements
	•	Add visualizations using Power BI or Tableau
	•	Integrate Python (Pandas) for advanced analysis
	•	Build dashboards for real-time insights
	•	Use larger datasets for deeper analysis

⸻

👨‍💻 Author

Prashant Goyal
