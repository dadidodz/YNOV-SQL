SELECT g.Name
FROM genres g
WHERE g.Name = (SELECT a.Title FROM albums a)