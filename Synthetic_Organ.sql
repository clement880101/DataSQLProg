DROP DATABASE IF EXISTS synthetic_store;
CREATE DATABASE IF NOT EXISTS synthetic_store;

USE synthetic_store;

CREATE TABLE customer(
  customer_id INT NOT NULL PRIMARY KEY,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL
);

CREATE TABLE payment(
  payment_id INT NOT NULL,
  total_cost DECIMAL(11,2) NOT NULL,
  date DATETIME NULL,
  PRIMARY KEY (payment_id)
);

CREATE TABLE surgery(
  surgery_id INT NOT NULL PRIMARY KEY,
  machine_brand VARCHAR(30) NULL,
  machine_model VARCHAR(30) NULL,
  start_time DATETIME NULL,
  duration TIME NULL,
  success BOOLEAN NULL
);

CREATE TABLE store(
  store_id INT NOT NULL PRIMARY KEY,
  district VARCHAR(30) NOT NULL,
  city VARCHAR(30) NOT NULL,
  address TEXT NOT NULL
);

CREATE TABLE item(
  item_id INT NOT NULL PRIMARY KEY,
  cost DECIMAL(11,2) NOT NULL,
  brand VARCHAR(30) NOT NULL,
  model VARCHAR(30) NOT NULL,
  organ VARCHAR(30) NOT NULL,
  description TEXT NULL
);

CREATE TABLE employee(
  employee_id INT NOT NULL PRIMARY KEY,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  salary DECIMAL(11,2) NOT NULL,
  position VARCHAR(30) NOT NULL
);

CREATE TABLE orders(
  payment_id INT,
  surgery_id INT,
  item_id INT,
  store_id INT,
  date DATETIME NOT NULL,
  FOREIGN KEY (payment_id) REFERENCES payment (payment_id),
  FOREIGN KEY (surgery_id) REFERENCES surgery(surgery_id),
  FOREIGN KEY (item_id) REFERENCES item(item_id),
  FOREIGN KEY (store_id) REFERENCES store(store_id)
);

CREATE TABLE item_store(
  item_id INT,
  store_id INT,
  stock INT NOT NULL,
  FOREIGN KEY (item_id) REFERENCES item(item_id),
  FOREIGN KEY (store_id) REFERENCES store(store_id)
);

CREATE TABLE item_surgery(
  item_id INT,
  surgery_id INT,
  FOREIGN KEY (surgery_id) REFERENCES surgery(surgery_id),
  FOREIGN KEY (item_id) REFERENCES item(item_id)
);

CREATE TABLE store_surgery(
  store_id INT,
  surgery_id INT,
  FOREIGN KEY (surgery_id) REFERENCES surgery(surgery_id),
  FOREIGN KEY (store_id) REFERENCES store(store_id)
);

CREATE TABLE customer_payment(
  customer_id INT,
  payment_id INT,
  FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
  FOREIGN KEY (payment_id) REFERENCES payment (payment_id)
);

CREATE TABLE customer_surgery(
  customer_id INT,
  surgery_id INT,
  FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
  FOREIGN KEY (surgery_id) REFERENCES surgery(surgery_id)
);

CREATE TABLE employee_store(
  store_id INT,
  employee_id INT,
  FOREIGN KEY (store_id) REFERENCES store(store_id),
  FOREIGN KEY (employee_id) REFERENCES employee(employee_id)
);

INSERT INTO customer VALUES (1, "Alex", "Tai");
INSERT INTO customer VALUES (2, "Joseph", "Huang");
INSERT INTO customer VALUES (3, "Andrew", "Yeh");
INSERT INTO customer VALUES (4, "Sabrina", "Ho");
INSERT INTO customer VALUES (5, "Yasmine", "Erna");
INSERT INTO customer VALUES (6, "Kaycee", "Ioanna");
INSERT INTO customer VALUES (7, "Nthanda", "Eko");
INSERT INTO customer VALUES (8, "Lanh", "Iman");
INSERT INTO customer VALUES (9, "Jamie", "Ayotunde");
INSERT INTO customer VALUES (10, "Osee", "Andres");
INSERT INTO customer VALUES (11, "Alexander", "Vienna");

INSERT INTO payment VALUES (1, 6800.00,  "2131-11-03 11:29:34");
INSERT INTO payment VALUES (2, 3500.00, "2130-11-01 09:03:57");
INSERT INTO payment VALUES (3, 6600.00, "2130-11-25 15:14:53");
INSERT INTO payment VALUES (4, 5120.00, "2130-11-24 09:03:44");
INSERT INTO payment VALUES (5, 9730.00, "2130-10-25 09:34:15");
INSERT INTO payment VALUES (6, 3500.00, "2130-11-20 23:06:23");
INSERT INTO payment VALUES (7, 6000.00, "2130-12-01 14:01:02");
INSERT INTO payment VALUES (8, 10000.00, "2130-10-23 05:41:28");
INSERT INTO payment VALUES (9, 3500.00, "2130-11-20 16:03:33");
INSERT INTO payment VALUES (10, 9500.00, "2131-09-13 05:07:08");
INSERT INTO payment VALUES (11, 3120.00, "2131-01-14 05:03:34");
INSERT INTO payment VALUES (12, 9500.00, "2131-01-17 03:30:41");

INSERT INTO employee VALUES (1, "Clement", "Chang", 800000000, "CEO");
INSERT INTO employee VALUES (2, "Marianus", "Muir", 520000, "Technician");
INSERT INTO employee VALUES (3, "Andrea", "Washington", 490000, "Doctor");
INSERT INTO employee VALUES (4, "Gloria", "Smith", 330000, "Technician");
INSERT INTO employee VALUES (5, "Vlan", "Irimca", 390000, "Doctor");
INSERT INTO employee VALUES (6, "Powei", "Tsao", 330000, "Technician");
INSERT INTO employee VALUES (7, "Dea", "Rambler", 320000, "Doctor");
INSERT INTO employee VALUES (8, "Lorendana", "Baciu", 440000, "Technician");
INSERT INTO employee VALUES (9, "Mary", "Gonzalez", 420000, "Doctor");
INSERT INTO employee VALUES (10, "Jonathon", "Strauss", 380000, "Technician");
INSERT INTO employee VALUES (11, "Joseph", "Mara", 390000, "Doctor");

INSERT INTO item VALUES (1,3030.00, "Pfizer", "AYE-300MG", "eyes", "Eyes with 10x magnification ability. Low Risk.");
INSERT INTO item VALUES (2,3500.00, "Pfizer", "AYE-630LZ", "eyes", "Eyes with infrared detection. Low Risk.");
INSERT INTO item VALUES (3,3120.00, "Roche", "RE10", "eyes", "Eyes with 10x magnification ability. Low Risk.");
INSERT INTO item VALUES (4,2000.00, "Amgen", "L2-3", "legs", "Legs with enhanced durability. Low Risk.");
INSERT INTO item VALUES (5,2200.00, "Roche", "RL30", "legs", "Legs with enhansed strength. Low Risk.");
INSERT INTO item VALUES (6,4600.00, "Pfizer", "HRT-120M", "heart", "Mechanical pace control. Blood clot prevention system. Medium Risk");
INSERT INTO item VALUES (7,4500.00, "Amgen", "H4-3", "heart", "Mechanical pace control. Blood clot prevention system. Medium Risk");
INSERT INTO item VALUES (8,6000.00, "Roche", "RH40", "heart", "Biological pace control. Blood clot prevention system. Low Risk");
INSERT INTO item VALUES (9,4000.00, "Amgen", "B1-0", "blood", "Health monitor. Tissue repair. Anti-pathogen. Low Risk");
INSERT INTO item VALUES (10,3500.00, "Pfizer", "BLO-700H", "blood", "Health monitor. Anti-pathogen. Low Risk");

INSERT INTO surgery VALUES (9, "Celgene", "S1", "2131-11-03 12:30:43", "01:32:02", TRUE);
INSERT INTO surgery VALUES (1, "Novo", "Surgery 2000", "2130-11-05 13:30:43", "01:06:02", TRUE);
INSERT INTO surgery VALUES (17, "Celgene", "S1", "2130-11-25 15:30:43", "03:32:00", FALSE);
INSERT INTO surgery VALUES (7, "Novo", "Surgery 2000", "2130-12-04 23:30:43", "01:32:00", TRUE);
INSERT INTO surgery VALUES (2, "Novo", "Surgery 2000", "2130-12-05 13:33:43", "01:32:00", TRUE);
INSERT INTO surgery VALUES (16, "Novo", "Surgery 2000", "2130-12-05 17:30:43", "00:30:00", TRUE);
INSERT INTO surgery VALUES (10, "Novo", "Surgery 2000", "2130-12-06 10:30:43", "00:34:00", TRUE);
INSERT INTO surgery VALUES (11, "Novo", "Surgery 2000", "2130-12-12 09:30:43", "03:32:00", FALSE);
INSERT INTO surgery VALUES (23, "Novo", "Surgery 3000", "2131-12-16 09:30:43", "01:32:00", TRUE);
INSERT INTO surgery VALUES (18, "Novo", "Surgery 2000", "2130-12-23 13:30:43", "00:54:00", TRUE);
INSERT INTO surgery VALUES (4, "Novo", "Surgery 2000", "2130-12-30 02:03:03", "00:32:00", TRUE);
INSERT INTO surgery VALUES (6, "Novo", "Surgery 3000", "2131-01-01 08:30:43", "02:41:00", TRUE);
INSERT INTO surgery VALUES (22, "Celgene", "S2", "2131-01-10 20:30:43", "02:32:00", TRUE);
INSERT INTO surgery VALUES (12, "Celgene", "S2", "2131-01-12 03:30:43", "02:32:00", TRUE);
INSERT INTO surgery VALUES (20, "Novo", "Surgery 3000", "2131-01-13 19:30:43", "02:32:00", TRUE);
INSERT INTO surgery VALUES (3, "Novo", "Surgery 3000", "2131-01-14 05:03:34", "02:32:00", TRUE);
INSERT INTO surgery VALUES (5, "Celgene", "S2", "2131-01-17 03:30:41", "02:32:00", TRUE);

INSERT INTO store VALUES (1, "UN District", "UN Capital", "2nd St.");
INSERT INTO store VALUES (2, "District 3", "Amsterdam", "12 Damrak St.");
INSERT INTO store VALUES (3, "District 3", "London", "60 Strand St.");
INSERT INTO store VALUES (4, "District 5", "New Beijing", "1230 S Xinhua St.");
INSERT INTO store VALUES (5, "District 1", "Los Angeles", "5730 S San Pedro St.");

INSERT INTO orders VALUES (1, 9, 5, 1, "2131-11-03 11:29:34");
INSERT INTO orders VALUES (1, 9, 6, 1, "2131-11-03 11:29:34");
INSERT INTO orders VALUES (2, 1, 10, 3, "2130-11-01 09:03:56");
INSERT INTO orders VALUES (3, 17, 6, 2, "2130-11-25 15:14:52");
INSERT INTO orders VALUES (3, 17, 4, 2, "2130-11-25 15:14:52");
INSERT INTO orders VALUES (4, 7, 3, 5,"2130-11-24 09:03:43");
INSERT INTO orders VALUES (4, 2, 4, 5,"2130-11-24 09:03:43");
INSERT INTO orders VALUES (5, 16, 1, 3, "2130-10-25 09:34:14");
INSERT INTO orders VALUES (5, 10, 5, 2, "2130-10-25 09:34:14");
INSERT INTO orders VALUES (5, 11, 7, 2, "2130-10-25 09:34:14");
INSERT INTO orders VALUES (6, 23, 2, 3, "2130-11-20 23:06:23");
INSERT INTO orders VALUES (7, 18, 8, 4, "2130-12-01 14:01:01");
INSERT INTO orders VALUES (8, 4, 8, 1, "2130-10-23 05:41:28");
INSERT INTO orders VALUES (8, 6, 9, 1, "2130-10-23 05:41:28");
INSERT INTO orders VALUES (9, 22, 2, 1, "2130-11-20 16:03:32");
INSERT INTO orders VALUES (10, 12, 8, 4, "2131-01-13 05:07:08");
INSERT INTO orders VALUES (10, 20, 10, 4, "2131-01-13 05:07:08");
INSERT INTO orders VALUES (11, 3, 3, 1, "2131-01-14 05:03:34");
INSERT INTO orders VALUES (12, 5, 10, 2, "2131-01-17 03:30:41");
INSERT INTO orders VALUES (12, 5, 8, 2, "2131-01-17 03:30:41");

INSERT INTO store_surgery VALUES (1,9);
INSERT INTO store_surgery VALUES (3,1);
INSERT INTO store_surgery VALUES (2,17);
INSERT INTO store_surgery VALUES (5,7);
INSERT INTO store_surgery VALUES (5,2);
INSERT INTO store_surgery VALUES (3,16);
INSERT INTO store_surgery VALUES (2,10);
INSERT INTO store_surgery VALUES (2,11);
INSERT INTO store_surgery VALUES (3,23);
INSERT INTO store_surgery VALUES (4,18);
INSERT INTO store_surgery VALUES (1,6);
INSERT INTO store_surgery VALUES (1,4);
INSERT INTO store_surgery VALUES (1,22);
INSERT INTO store_surgery VALUES (4,12);
INSERT INTO store_surgery VALUES (4,20);
INSERT INTO store_surgery VALUES (1,3);
INSERT INTO store_surgery VALUES (2,5);

INSERT INTO customer_payment VALUES (1, 3);
INSERT INTO customer_payment VALUES (2, 1);
INSERT INTO customer_payment VALUES (3, 2);
INSERT INTO customer_payment VALUES (4, 4);
INSERT INTO customer_payment VALUES (5, 12);
INSERT INTO customer_payment VALUES (6, 11);
INSERT INTO customer_payment VALUES (3, 6);
INSERT INTO customer_payment VALUES (7, 5);
INSERT INTO customer_payment VALUES (8, 10);
INSERT INTO customer_payment VALUES (9, 7);
INSERT INTO customer_payment VALUES (10, 8);
INSERT INTO customer_payment VALUES (11, 9);

INSERT INTO item_store VALUES (1, 1, 28);
INSERT INTO item_store VALUES (2, 1, 30);
INSERT INTO item_store VALUES (3, 1, 29);
INSERT INTO item_store VALUES (4, 1, 20);
INSERT INTO item_store VALUES (5, 1, 27);
INSERT INTO item_store VALUES (6, 1, 7);
INSERT INTO item_store VALUES (7, 1, 9);
INSERT INTO item_store VALUES (8, 1, 8);
INSERT INTO item_store VALUES (9, 1, 57);
INSERT INTO item_store VALUES (10, 1, 60);
INSERT INTO item_store VALUES (1, 2, 0);
INSERT INTO item_store VALUES (2, 2, 0);
INSERT INTO item_store VALUES (3, 2, 6);
INSERT INTO item_store VALUES (4, 2, 7);
INSERT INTO item_store VALUES (5, 2, 5);
INSERT INTO item_store VALUES (6, 2, 0);
INSERT INTO item_store VALUES (7, 2, 3);
INSERT INTO item_store VALUES (8, 2, 4);
INSERT INTO item_store VALUES (9, 2, 15);
INSERT INTO item_store VALUES (10, 2, 0);
INSERT INTO item_store VALUES (1, 3, 16);
INSERT INTO item_store VALUES (2, 3, 20);
INSERT INTO item_store VALUES (3, 3, 17);
INSERT INTO item_store VALUES (4, 3, 19);
INSERT INTO item_store VALUES (5, 3, 15);
INSERT INTO item_store VALUES (6, 3, 0);
INSERT INTO item_store VALUES (7, 3, 3);
INSERT INTO item_store VALUES (8, 3, 5);
INSERT INTO item_store VALUES (9, 3, 39);
INSERT INTO item_store VALUES (10, 3, 45);
INSERT INTO item_store VALUES (1, 4, 29);
INSERT INTO item_store VALUES (2, 4, 18);
INSERT INTO item_store VALUES (3, 4, 16);
INSERT INTO item_store VALUES (4, 4, 0);
INSERT INTO item_store VALUES (5, 4, 12);
INSERT INTO item_store VALUES (6, 4, 5);
INSERT INTO item_store VALUES (7, 4, 7);
INSERT INTO item_store VALUES (8, 4, 9);
INSERT INTO item_store VALUES (9, 4, 75);
INSERT INTO item_store VALUES (10, 4, 34);
INSERT INTO item_store VALUES (1, 5, 12);
INSERT INTO item_store VALUES (2, 5, 0);
INSERT INTO item_store VALUES (3, 5, 3);
INSERT INTO item_store VALUES (4, 5, 14);
INSERT INTO item_store VALUES (5, 5, 26);
INSERT INTO item_store VALUES (6, 5, 4);
INSERT INTO item_store VALUES (7, 5, 0);
INSERT INTO item_store VALUES (8, 5, 0);
INSERT INTO item_store VALUES (9, 5, 59);
INSERT INTO item_store VALUES (10, 5, 49);

INSERT INTO employee_store VALUES (1, 2);
INSERT INTO employee_store VALUES (1, 3);
INSERT INTO employee_store VALUES (2, 4);
INSERT INTO employee_store VALUES (2, 5);
INSERT INTO employee_store VALUES (3, 6);
INSERT INTO employee_store VALUES (3, 7);
INSERT INTO employee_store VALUES (4, 8);
INSERT INTO employee_store VALUES (4, 9);
INSERT INTO employee_store VALUES (5, 10);
INSERT INTO employee_store VALUES (5, 11);

INSERT INTO item_surgery VALUES (5, 9);
INSERT INTO item_surgery VALUES (6, 9);
INSERT INTO item_surgery VALUES (10, 1);
INSERT INTO item_surgery VALUES (6, 17);
INSERT INTO item_surgery VALUES (4, 17);
INSERT INTO item_surgery VALUES (3, 7);
INSERT INTO item_surgery VALUES (4, 2);
INSERT INTO item_surgery VALUES (1, 16);
INSERT INTO item_surgery VALUES (5, 10);
INSERT INTO item_surgery VALUES (7, 11);
INSERT INTO item_surgery VALUES (2, 23);
INSERT INTO item_surgery VALUES (8, 18);
INSERT INTO item_surgery VALUES (8, 4);
INSERT INTO item_surgery VALUES (9, 6);
INSERT INTO item_surgery VALUES (2, 22);
INSERT INTO item_surgery VALUES (8, 12);
INSERT INTO item_surgery VALUES (10, 20);
INSERT INTO item_surgery VALUES (3, 3);
INSERT INTO item_surgery VALUES (10, 5);
INSERT INTO item_surgery VALUES (8, 5);

INSERT INTO customer_surgery VALUES (1, 17);
INSERT INTO customer_surgery VALUES (2, 9);
INSERT INTO customer_surgery VALUES (3, 1);
INSERT INTO customer_surgery VALUES (4, 7);
INSERT INTO customer_surgery VALUES (4, 2);
INSERT INTO customer_surgery VALUES (5, 5);
INSERT INTO customer_surgery VALUES (6, 3);
INSERT INTO customer_surgery VALUES (3, 23);
INSERT INTO customer_surgery VALUES (7, 16);
INSERT INTO customer_surgery VALUES (7, 10);
INSERT INTO customer_surgery VALUES (7, 11);
INSERT INTO customer_surgery VALUES (8, 12);
INSERT INTO customer_surgery VALUES (8, 20);
INSERT INTO customer_surgery VALUES (9, 18);
INSERT INTO customer_surgery VALUES (10, 4);
INSERT INTO customer_surgery VALUES (10, 6);
INSERT INTO customer_surgery VALUES (11, 22);

SELECT first_name, last_name FROM customer INNER JOIN customer_surgery USING (customer_id)
INNER JOIN surgery USING (surgery_id) WHERE success = FALSE;

SELECT first_name, last_name, position FROM employee INNER JOIN employee_store USING (employee_id)
INNER JOIN store USING (store_id) WHERE city LIKE "UN%";

SELECT DISTINCT organ FROM item INNER JOIN item_surgery USING (item_id) INNER JOIN surgery USING (surgery_id)
WHERE success = FALSE;

SELECT brand, model FROM item INNER JOIN item_store USING (item_id) INNER JOIN store USING (store_id)
WHERE city = "New Beijing" AND stock = 0;

SELECT model, brand, cost FROM item ORDER BY cost DESC;



SELECT district, city, address, avg(salary) as Average FROM store INNER JOIN employee_store USING (store_id)
INNER JOIN employee USING (employee_id) GROUP BY store_id;

(SELECT first_name, last_name, count(item_id) as Bought FROM customer INNER JOIN customer_payment USING (customer_id)
INNER JOIN payment USING (payment_id) INNER JOIN orders USING (payment_id) GROUP BY customer_id
ORDER BY Bought DESC LIMIT 1)
UNION
(SELECT first_name, last_name, count(item_id) as Bought FROM customer INNER JOIN customer_payment USING (customer_id)
INNER JOIN payment USING (payment_id) INNER JOIN orders USING (payment_id) GROUP BY customer_id
ORDER BY Bought LIMIT 1);

SELECT brand, model, sum(total_cost) AS totalgain FROM item INNER JOIN orders USING (item_id)
INNER JOIN payment USING (payment_id) GROUP BY item_id ORDER BY totalgain DESC;

SELECT first_name, last_name, sum(total_cost) FROM customer INNER JOIN customer_payment USING (customer_id)
INNER JOIN payment USING (payment_id) GROUP BY customer_id ORDER BY total_cost DESC;

SELECT first_name, last_name FROM employee INNER JOIN employee_store USING (employee_id) INNER JOIN store
USING (store_id) INNER JOIN store_surgery USING (store_id) INNER JOIN surgery USING (surgery_id)
WHERE success = FALSE GROUP BY employee_id;