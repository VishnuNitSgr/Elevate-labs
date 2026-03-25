/* COVID-19 DATA ANALYSIS QUERIES*/


/* Total Cases by Country */

SELECT 
    country,
    SUM(confirmed) AS total_cases
FROM covid_data
GROUP BY country
ORDER BY total_cases DESC;



/* Total Deaths by Country */

SELECT 
    country,
    SUM(deaths) AS total_deaths
FROM covid_data
GROUP BY country
ORDER BY total_deaths DESC;



/*Total Recovered by Country*/

SELECT 
    country,
    SUM(recovered) AS total_recovered
FROM covid_data
GROUP BY country
ORDER BY total_recovered DESC;



/* Top 5 Most Affected Countries */

SELECT 
    country,
    SUM(confirmed) AS total_cases
FROM covid_data
GROUP BY country
ORDER BY total_cases DESC
LIMIT 5;



/* Death Rate by Country */

SELECT 
    country,
    ROUND(SUM(deaths) * 100.0 / SUM(confirmed), 2) AS death_rate_percentage
FROM covid_data
GROUP BY country
ORDER BY death_rate_percentage DESC;



/* Recovery Rate by Country */

SELECT 
    country,
    ROUND(SUM(recovered) * 100.0 / SUM(confirmed), 2) AS recovery_rate_percentage
FROM covid_data
GROUP BY country
ORDER BY recovery_rate_percentage DESC;



/* Daily New Cases (Window Function) */

SELECT 
    country,
    date,
    confirmed - LAG(confirmed) OVER (
        PARTITION BY country ORDER BY date
    ) AS daily_new_cases
FROM covid_data;



/* Cumulative Cases Trend */

SELECT 
    country,
    date,
    SUM(confirmed) OVER (
        PARTITION BY country ORDER BY date
    ) AS cumulative_cases
FROM covid_data;



/* 9️⃣ Highest Daily Cases per Country */

SELECT 
    country,
    MAX(confirmed) AS max_cases
FROM covid_data
GROUP BY country
ORDER BY max_cases DESC;



/* Countries with Low Recovery Rate (< 50%) */

SELECT 
    country,
    ROUND(SUM(recovered) * 100.0 / SUM(confirmed), 2) AS recovery_rate
FROM covid_data
GROUP BY country
HAVING recovery_rate < 50
ORDER BY recovery_rate ASC;