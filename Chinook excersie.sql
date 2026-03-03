/*
The Chinook database contains details of an online music store.
Here are some example answers to the question
*/

-- List all customers
SELECT
    *
FROM
    Customer c
    WHERE C.COMPANY IS  NULL 

-- List all customers. Show only the CustomerId, FirstName and LastName columns
SELECT
    c.CustomerId
    ,c.FirstName
    ,c.LastName
FROM
    Customer c


-- List customers in the United Kingdom  
SELECT
    c.CustomerId
    ,c.FirstName
    ,c.LastName
FROM
    Customer c
WHERE c.Country = 'United Kingdom'






-- List customers whose first names begins with an A.
SELECT
    c.CustomerId
    ,c.FirstName
    ,c.LastName
FROM
    Customer c
WHERE c.FirstName LIKE 'A%'
-- Hint: use LIKE and the % wildcard

-- List Customers with an apple email address
SELECT
    c.CustomerId
    ,c.FirstName
    ,c.LastName
FROM
    Customer c
WHERE c.Email LIKE '%@apple.com'


-- Which customers have the initials LK?

SELECT
    c.CustomerId
    ,c.FirstName
    ,c.LastName
FROM
    Customer c
WHERE LEFT(c.FirstName,1) = 'L' AND LEFT(c.LastName,1) = 'K'

-- Which are the corporate customers i.e. those with a value, not NULL, in the Company column?
SELECT
    c.CustomerId
    ,c.FirstName
    ,c.LastName
FROM
    Customer c
    WHERE C.COMPANY IS NOT NULL 

-- How many customers are in each country.  Order by the most popular country first.
SELECT
    C.COUNTRY
    ,COUNT(*) AS TOTAL_CUSTOMERS
FROM
    CUSTOMER C
GROUP  BY C.COUNTRY
ORDER BY COUNT(*) DESC

-- When was the oldest employee born?  Who is that?
SELECT
    TOP 1
    E.FirstName
    ,E.LastName
    ,E.BirthDate
FROM
    Employee E
ORDER BY E.BirthDate ASC

-- List the 10 latest invoices. Include the InvoiceId, InvoiceDate and Total
-- Then  also include the customer full name (first and last name together)

SELECT
    TOP 10
    I.InvoiceId
    ,I.InvoiceDate
    ,I.Total
    ,CONCAT(C.FirstName,' ',C.LastName) AS CustomerFullName
FROM
    Invoice I
    JOIN Customer C ON I.CustomerId = C.CustomerId
ORDER BY I.InvoiceDate DESC



SELECT
    TOP 10
    i.InvoiceId
    ,i.InvoiceDate
    ,i.Total
    ,c.FirstName
    ,c.LastName
    ,CONCAT(c.FirstName, ' ', c.LastName) AS CustomerFullName
    ,c.SupportRepId
    ,CONCAT(e.FirstName, ' ', e.LastName) AS EmployeeFullName
FROM
    Invoice i LEFT JOIN Customer c ON i.CustomerId = c.CustomerId
    LEFT JOIN Employee e ON c.SupportRepId = e.EmployeeId
ORDER BY i.InvoiceDate DESC
 

-- List the customers who have spent more than £45

SELECT
    I.InvoiceId
    ,I.InvoiceDate
    ,I.Total
    ,CONCAT(C.FirstName,' ',C.LastName) AS CustomerFullName
FROM
    Invoice I
    LEFT JOIN Customer C ON I.CustomerId = C.CustomerId
    WHERE I.Total > 45

SELECT * FROM Employee




-- List the City, CustomerId and LastName of all customers in Paris and London, 
-- and the Total of their invoices
	
-- Show all details about customer Michelle Brooks.  List salient details of her invoices.

/*
Which employees were born in the 1960s?  Show only the EmployeeId, FirstName, LastName and BirthDate columns
Note: Define a date value as with the region independent format 'yyyy-mm-dd' e.g. '1969-12-31'
*/


-- List countries, and the number of customers and the total invoiced amount
-- Order  high to low in terms of the number of customers

-- What are the top 10 most popular artists in terms of number of tracks bought by customers?

-- List the albums in alphabetical order of Title

-- List 10 albums and their artist.  Order by album title.


