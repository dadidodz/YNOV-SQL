SELECT e.FirstName || ' ' || e.LastName AS '3rd best seller'
FROM customers c
JOIN employees e ON c.SupportRepId = e.EmployeeId
JOIN invoices i ON c.CustomerId = i.CustomerId
WHERE e.EmployeeId = (SELECT c.SupportRepId
                      WHERE c.CustomerId = (SELECT i.CustomerId
                                            WHERE ));

SELECT invoices.InvoiceId, customers.CustomerId, customers.SupportRepId
FROM invoices
JOIN customers ON invoices.CustomerId = customers.CustomerId
JOIN employees ON customers.SupportRepId = employees.EmployeeId
ORDER BY InvoiceId