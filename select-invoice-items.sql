SELECT invoices.InvoiceId, tracks.Name InvoiceItem, tracks.UnitPrice
FROM invoices
JOIN invoice_items ON invoices.InvoiceId = invoice_items.InvoiceId
JOIN tracks ON invoice_items.TrackId = tracks.TrackId
WHERE invoices.InvoiceId = 10