SELECT employees.FirstName, employees.LastName, CAST(strftime('%Y', HireDate) - strftime('%Y',BirthDate ) AS INT)ApproximateAge
FROM employees
ORDER BY ApproximateAge ASC