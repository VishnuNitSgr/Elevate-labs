UPDATE covid_data
SET confirmed = COALESCE(confirmed, 0),
    deaths = COALESCE(deaths, 0),
    recovered = COALESCE(recovered, 0);