SELECT e.FirstName || ' ' || e.LastName AS '3rd best seller'
FROM customers c
JOIN employees e ON c.SupportRepId = e.EmployeeId
JOIN invoices i ON c.CustomerId = i.CustomerId
WHERE e.EmployeeId = (SELECT c.SupportRepId
                        FROM invoices i
                        JOIN customers c ON i.CustomerId = c.CustomerId
                        JOIN employees e ON c.SupportRepId = e.EmployeeId
                        GROUP BY c.SupportRepId
                        LIMIT 1 OFFSET 2)
GROUP BY '3rd best seller';