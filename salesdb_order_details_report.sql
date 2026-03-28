     USE SalesDB;
     
     /* Task: Using SalesDB, Retrieve a list of all orders, along with the related customer, product, 
   and employee details. For each order, display:
   - Order ID
   - Customer's name
   - Product name
   - Sales amount
   - Product price
   - Salesperson's name */
	
     
   SELECT 
		   O.orderid,
		   C.firstname AS Customer_FirstName,
		   C.lastname AS Customer_LastName,
		   P.product AS ProductName,
		   P.price AS ProductPrice,
		   E.firstname AS EmpFirstName,
		   E.lastname AS EmpLastName
FROM orders AS O
   
   LEFT JOIN customers AS C
   ON O.customerid = C.customerid
   
	   LEFT JOIN products AS P
	   ON O.productid = P.productid
       
		   LEFT JOIN employees AS E
		   ON O.salespersonid =E.employeeid;
		   
   
   
      
   SELECT *
   FROM customers;
   
   SELECT *
   FROM employees;
   
   SELECT *
   FROM orders;
   
   SELECT *
   FROM orders_archive;
   
   SELECT *
   FROM products;
   

   
   
   
   
   
   
