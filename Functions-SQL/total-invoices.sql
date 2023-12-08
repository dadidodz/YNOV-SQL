SELECT customers.FirstName || ' ' || upper(customers.LastName) FullName, sum(invoices.Total) AllInvoices
FROM customers
JOIN invoices ON customers.CustomerId = invoices.CustomerId
GROUP BY customers.CustomerId
HAVING sum(invoices.Total) > 38
ORDER BY FullName
