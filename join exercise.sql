/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 select p.name as 'products name', c.name as 'category name'
 from categories as c
 join products as p
 on c.categoryID = p.CategoryID
  where c.name = 'computers';
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 select p.name, p.price, r.rating
 from products as p
 join reviews as r
 on p.productID = r.productID
 where r.rating = 5;

/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
select e.firstname as 'First Name', e.lastname as 'Last Name', sum(s.quantity) as total
from sales as s
join employees as e
on s.EmployeeID = e.EmployeeID
group by e.EmployeeID
order by total desc;
/* joins: find the name of the department, and the name of the category for Appliances and Games */
select d.name as 'department name', c.name as 'category name'
from departments as d
join categories as c
on d.DepartmentID = c.DepartmentID
where c.name = 'appliances' or c.name = 'games';
/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
select p.name, sum(s.quantity) as 'total sold', (p.price * sum(s.quantity)) as 'total price sold'
from products as p
join sales as s
on p.ProductID = s.ProductID
where P.name like '%hotel california%'
group by p.name, p.price;
/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
select p.name as 'product name' , r.reviewer , r.rating, r.comment
from products as p
join reviews as r
on p.ProductID = r.ProductID
where p.name like '%Visio%' and r.rating =1
;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */
select e.employeeID, e.firstname as 'first name' , e.lastname as 'last name', p.name as 'product name', sum(s.quantity) as 'total sold'
from sales as s
join employees as e
on e.employeeID = s.EmployeeID
join products as p 
on p.ProductID = s.ProductID
group by e.EmployeeID, p.ProductID
order by sum(s.Quantity) desc
;