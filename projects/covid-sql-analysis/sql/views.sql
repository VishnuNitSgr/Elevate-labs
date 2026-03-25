CREATE VIEW covid_summary AS
SELECT 
    country,
    SUM(confirmed) AS total_cases,
    SUM(deaths) AS total_deaths,
    SUM(recovered) AS total_recovered
FROM covid_data
GROUP BY country;