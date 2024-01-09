SELECT i.InvoiceId, round(avg(t.UnitPrice), 2) AS 'Average Price', sum(t.Milliseconds)/1000 AS 'Track Total Time', round((sum(it.UnitPrice)/count(it.TrackId))/sum((t.Milliseconds)/1000.0), 5) || '€' AS 'Price by second'
FROM invoices i
JOIN invoice_items it ON i.InvoiceId = it.InvoiceId
JOIN tracks t ON it.TrackId = t.TrackId
GROUP BY i.InvoiceId
ORDER BY i.InvoiceId;