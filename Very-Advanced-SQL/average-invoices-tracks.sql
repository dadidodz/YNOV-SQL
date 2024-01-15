SELECT invoices.InvoiceId, ROUND(SUM(invoice_items.unitprice) / COUNT(*), 2) AS "Average Price", SUM(tracks.Milliseconds)/1000 AS "Track Total Time", ROUND((SUM(invoice_items.UnitPrice) / COUNT(invoice_items.TrackId)) / (SUM(tracks.Milliseconds) / 1000), 5) || '€' AS "Price by second"
FROM invoices
INNER JOIN invoice_items ON invoice_items.invoiceid = invoices.invoiceid
INNER JOIN tracks ON tracks.TrackId = invoice_items.trackid
GROUP BY invoices.invoiceid