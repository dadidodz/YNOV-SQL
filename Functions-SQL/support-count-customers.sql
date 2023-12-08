SELECT employees.FirstName || ' ' || upper(employees.LastName) FullName, COUNT(customers.SupportRepId) NumberOfCustomers
FROM employees
JOIN customers ON employees.EmployeeId = customers.SupportRepId
WHERE employees.Title = 'Sales Support Agent'
GROUP BY employees.EmployeeId, customers.SupportRepId
ORDER BY NumberOfCustomers ASC