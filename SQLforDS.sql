--How many albums does the artist Led Zeppelin have? 
SELECT COUNT(AlbumId)
FROM albums
WHERE ArtistId IN (SELECT ArtistId FROM artists WHERE Name = "Led Zeppelin");

--Create a list of album titles and the unit prices for the artist "Audioslave"
SELECT  tra.AlbumId 
       ,tra.Name 
       ,tra.TrackiD 
       ,alb.title 
       ,tra.unitprice 
--     ,tra.unitprice*COUNT(Tra.TrackId) AS TOTALPRICEALB
FROM tracks tra
INNER JOIN albums alb
ON alb.albumId = tra.albumId
WHERE alb.ArtistId IN ( SELECT ArtistId FROM artists WHERE Name = "Audioslave"); 

--Find the first and last name of any customer who does not have an invoice. 
--Are there any customers returned from the query?
SELECT FirstName, LastName
FROM Customers
WHERE CustomerId NOT IN (SELECT CustomerId FROM invoices);

--Find the total price for each album.
SELECT AL.Title, SUM(TR.UnitPrice)
FROM albums AS AL
INNER JOIN tracks AS TR ON AL.AlbumId = TR.AlbumId
--WHERE AL.Title = "Big Ones"
GROUP BY AL.Title

--How many records are created when you apply a Cartesian join to the invoice and invoice items table?
SELECT  IV.InvoiceId, II.InvoiceId
FROM invoices AS IV, invoice_items AS II

