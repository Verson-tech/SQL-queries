/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
SELECT P.Name AS ProductName, C.Name AS CategoryName
FROM products ASP
INNER JOIN categories AS C
ON C.CategoryID = P.CategoryID
WHERE C.Name = 'Computers';
/*or without alias:*/
SELECT products.Name, categories.Name
FROM products
INNER JOIN categories on categories.CategoryID = products.CategoryID
WHERE categories.Name = "Computers";

/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
--  select p.Name, p.Price, r.Rating from products as p
--  inner join reviews as r on r.ProductID = p.ProductID
--  where r.Rating = 5;

SELECT * 
FROM products
LEFT JOIN reviews ON reviews.ProductID = products.ProductID
WHERE reviews.Rating = 5;

/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
-- SELECT e.FirstName, e.LastName, Sum(s.Quantity)  AS Total
-- FROM sales AS s
-- INNER JOIN employees AS e ON e.EmployeeID = s.EmployeeID
-- GROUP BY e.EmployeeID
-- ORDER BY Total DESC
-- LIMIT 20;
select e.EmployeeID, e.FirstName, e.LastName, sum(s.Quantity) as Total_Quantity_Sold
from employees e 
inner join sales s
On e.EmployeeID = s.EmployeeID
group by s.EmployeeID
order by Total_Quantity_Sold desc;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
select d.Name, c.Name
FROM categories c
inner join departments d
on c.DepartmentID=d.DepartmentID
where c.Name = "Appliances" or c.Name="Games";

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
select p.Name, sum(s.Quantity) as Quantity, sum(s.Quantity * s.PricePerUnit) as Total_Price_Sold
from products p
inner join sales s
On p.productID = s.ProductID
Where s.ProductID = 97;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
select p.Name, r.Reviewer, r.Rating, r.Comment
from products p 
inner join reviews r
on p.ProductID = r.ProductID
where r.ProductID = 857 and r.rating = 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.*/
/*This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */
select e.EmployeeID, e.FirstName, e.LastName, p.ProductID, p.Name, sum(s.Quantity) as Quantity, s.Date
from sales as s
inner join employees as e
on e.EmployeeID = s.EmployeeID
inner join products as p
on p.productid = s.productid
group by e.employeeid, e.FirstName, e.LastName, p.ProductID, p.name, s.Date;


