/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 SELECT products.Name AS 'Product Name', categories.Name AS 'Category Name'
 FROM products
 INNER JOIN categories ON products.CategoryID = categories.CategoryID
 WHERE categories.CategoryID = 1;
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT products.name AS 'Product Name', products.Price, reviews.Rating
FROM products
INNER JOIN reviews ON products.ProductID = reviews.ProductID
WHERE reviews.Rating = 5; 

/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT employees.FirstName AS 'First Name', employees.MiddleInitial AS 'Middle Initial', 
			employees.LastName AS 'Last Name', SUM(sales.Quantity) AS 'Total Quantity Sold'
FROM employees
INNER JOIN sales on employees.EmployeeID = sales.EmployeeID
GROUP BY employees.EmployeeID
ORDER BY SUM(sales.Quantity) DESC
LIMIT 2;

-- SELECT SUM(Quantity), EmployeeID
-- FROM sales
-- GROUP BY EmployeeID
-- ORDER BY SUM(Quantity) DESC;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT departments.name AS 'Dept Name', categories.name AS 'Category Name'
FROM categories
INNER JOIN departments on departments.DepartmentID = categories.DepartmentID
WHERE categories.name = 'Appliances' OR categories.name = 'Games';

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 SELECT products.Name as 'Product Name', SUM(sales.Quantity) AS 'Total # Sold', 
			(products.price * SUM(sales.Quantity)) AS 'Total Revenue'
 FROM products
 INNER JOIN sales ON products.ProductID = sales.ProductID
 WHERE products.Name LIKE '%eagles%cali%';
 
/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT products.Name AS 'Product Name', reviews.Reviewer, reviews.Rating, reviews.Comment
FROM products
INNER JOIN reviews ON products.ProductID = reviews.ProductID
WHERE reviews.ProductID = 857 AND reviews.Rating = 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.  This query should return 
the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */
SELECT employees.EmployeeID AS 'Employee ID', employees.FirstName AS 'First Name', 
			employees.LastName AS 'Last Name', products.Name AS 'Product Name', sales.Quantity AS 'Quantity Sold'
FROM employees
INNER JOIN sales ON employees.EmployeeID = sales.EmployeeID
INNER JOIN products on sales.ProductID = products.ProductID
ORDER BY employees.EmployeeID;