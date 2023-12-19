SELECT FirstName, LastName, Country,
    CASE
        WHEN Country IN ('Brazil', 'USA', 'Canada', 'Argentina', 'Chile') THEN 'America'
        WHEN Country IN ('Portugal', 'Germany', 'Norway', 'Czech Republic', 'Austria', 'Belgium', 'Denmark', 'France', 'Finland', 'Hungary', 'Ireland', 'Italy', 'Netherlands', 'Poland', 'Spain', 'Sweden', 'United Kingdom') THEN 'Europe'
        WHEN Country IN ('India', 'USA', 'Canada') THEN 'Asia'
        ELSE 'Oceania'
    END AS "Continent"
FROM customers