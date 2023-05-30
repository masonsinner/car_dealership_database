-- Create the tables

CREATE TABLE cars (
  car_id SERIAL PRIMARY KEY,
  make VARCHAR(25),
  model VARCHAR(25),
  color VARCHAR(25),
  invoice_id INTEGER,
  is_serviced BOOLEAN,
  service_id INTEGER,
  service_rec_id INTEGER
);

CREATE TABLE mechanic (
  mechanic_id SERIAL PRIMARY KEY,
  car_id INTEGER,
  invoice_id INTEGER
);

CREATE TABLE service (
  service_id SERIAL PRIMARY KEY,
  car_id INTEGER,
  mechanic_id INTEGER
);

CREATE TABLE service_records (
  service_rec_id SERIAL PRIMARY KEY,
  car_id INTEGER,
  service_id INTEGER
);

CREATE TABLE customer (
  customer_id SERIAL PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  invoice_id INTEGER,
  service_id INTEGER
);

CREATE TABLE invoices (
  invoice_id SERIAL PRIMARY KEY,
  car_id INTEGER,
  customer_id INTEGER,
  sales_id INTEGER,
  mechanic_id INTEGER
);

CREATE TABLE sales (
  sales_id SERIAL PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  total_sales INTEGER,
  recent_sale INTEGER,
  invoice_id INTEGER
);

-- Add foreign key constraints

ALTER TABLE cars
ADD CONSTRAINT fk_cars_invoices
FOREIGN KEY (invoice_id) REFERENCES invoices(invoice_id);

ALTER TABLE mechanic
ADD CONSTRAINT fk_mechanic_cars
FOREIGN KEY (car_id) REFERENCES cars(car_id);

ALTER TABLE mechanic
ADD CONSTRAINT fk_mechanic_invoices
FOREIGN KEY (invoice_id) REFERENCES invoices(invoice_id);

ALTER TABLE service
ADD CONSTRAINT fk_service_cars
FOREIGN KEY (car_id) REFERENCES cars(car_id);

ALTER TABLE service
ADD CONSTRAINT fk_service_mechanic
FOREIGN KEY (mechanic_id) REFERENCES mechanic(mechanic_id);

ALTER TABLE service_records
ADD CONSTRAINT fk_service_records_cars
FOREIGN KEY (car_id) REFERENCES cars(car_id);

ALTER TABLE service_records
ADD CONSTRAINT fk_service_records_service
FOREIGN KEY (service_id) REFERENCES service(service_id);

ALTER TABLE customer
ADD CONSTRAINT fk_customer_invoices
FOREIGN KEY (invoice_id) REFERENCES invoices(invoice_id);

ALTER TABLE customer
ADD CONSTRAINT fk_customer_service
FOREIGN KEY (service_id) REFERENCES service(service_id);

ALTER TABLE invoices
ADD CONSTRAINT fk_invoices_cars
FOREIGN KEY (car_id) REFERENCES cars(car_id);

ALTER TABLE invoices
ADD CONSTRAINT fk_invoices_customer
FOREIGN KEY (customer_id) REFERENCES customer(customer_id);

ALTER TABLE invoices
ADD CONSTRAINT fk_invoices_sales
FOREIGN KEY (sales_id) REFERENCES sales(sales_id);

ALTER TABLE invoices
ADD CONSTRAINT fk_invoices_mechanic
FOREIGN KEY (mechanic_id) REFERENCES mechanic(mechanic_id);

ALTER TABLE sales
ADD CONSTRAINT fk_sales_invoices
FOREIGN KEY (invoice_id) REFERENCES invoices(invoice_id);






-- Insert sample data into cars
INSERT INTO mechanic (car_id, invoice_id)
VALUES (1, 1),
       (2, 2);

-- Insert sample data into service
INSERT INTO service (car_id, mechanic_id)
VALUES (1, 1),
       (2, 2);

-- Insert sample data into service_records
INSERT INTO service_records (car_id, service_id)
VALUES (1, 1),
       (2, 2);

-- Insert sample data into customer
INSERT INTO customer (first_name, last_name, invoice_id, service_id)
VALUES ('John', 'Doe', 1, 1),
       ('Jane', 'Smith', 2, 2);

-- Insert sample data into invoices
INSERT INTO invoices (car_id, customer_id, sales_id, mechanic_id)
VALUES (1, 1, 1, 1),
       (2, 2, 2, 2);

-- Insert sample data into cars
INSERT INTO cars (make, model, color, invoice_id, is_serviced, service_id, service_rec_id)
VALUES ('Toyota', 'Corolla', 'Blue', 1, true, 1, 1),
       ('Honda', 'Civic', 'Red', 2, false, 2, 2);

-- Insert sample data into sales
INSERT INTO sales (first_name, last_name, total_sales, recent_sale, invoice_id)
VALUES ('John', 'Doe', 5000, 1000, 1),
       ('Jane', 'Smith', 7500, 2000, 2);
