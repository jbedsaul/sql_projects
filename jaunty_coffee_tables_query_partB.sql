CREATE TABLE COFFEE_SHOP (
    shop_id int,
    shop_name VARCHAR(50),
    city VARCHAR(50),
    state CHAR(2),
    PRIMARY KEY (shop_id)
);

CREATE TABLE SUPPLIER (
    supplier_id	 int,
    company_name VARCHAR(50),
    country VARCHAR(30),
    sales_contact_name VARCHAR(60),
    email VARCHAR(50) NOT NULL,
    PRIMARY KEY (supplier_id)
);

CREATE TABLE EMPLOYEE (
    employee_id int,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    hire_date Date,
    job_title VARCHAR(30),
    shop_id int,
    PRIMARY KEY (employee_id),
    FOREIGN KEY (shop_id) REFERENCES COFFEE_SHOP(shop_id)
);

CREATE TABLE COFFEE (
    coffee_id int,
    shop_id int,
    supplier_id int,
    coffee_name VARCHAR(30),
    price_per_pound	NUMERIC(5,2),
    PRIMARY KEY (coffee_id),
    FOREIGN KEY (shop_id) REFERENCES COFFEE_SHOP(shop_id),
    FOREIGN KEY (supplier_id) REFERENCES SUPPLIER(supplier_id)
);


INSERT INTO COFFEE_SHOP
VALUES 
(1,'Coffeetopia','Palm Beach','CA'),
(2,'Cafe NY','New York','NY'),
(3,'Caffinated','Kansas City','MO')
;

INSERT INTO SUPPLIER
VALUES 
(1,'A Supply Co','Canada','Brad Foster','bfoster@gmail.com'),
(2,'Brand Supplier','France','Jean Luc Pacarde','jeanlucp@yahoo.com'),
(3,'Best Supplier','USA','Billy Williams','billythewilliams@netscape.net')
;

INSERT INTO EMPLOYEE
VALUES 
(1,'Alex','Gordan','2014-10-19','Staff', 2),
(2,'Paul','Thomas','2010-02-16','Supervisor',1),
(3,'Tom','Young','2001-04-10','Owner',3)
;

INSERT INTO COFFEE
VALUES 
(1, 1, 3,'Tar Black', 100.00),
(3, 2, 1,'Medium', 75.70),
(2, 1, 2,'Lighty McLightpants', 120.50 )
;


CREATE VIEW view_employee AS
SELECT employee_id, CONCAT(first_name,' ',last_name) AS employee_full_name,
           hire_date, job_title, shop_id
FROM employee


CREATE INDEX java 
ON COFFEE (coffee_name)
;


SELECT * FROM coffee
WHERE price_per_pound > 80.00;


SELECT * FROM coffee, coffee_shop, supplier
WHERE coffee.shop_id = coffee_shop.shop_id
          AND coffee.supplier_id = supplier.supplier_id
;



 


