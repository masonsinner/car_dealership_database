-- Insert sales data
CREATE OR REPLACE FUNCTION insert_sales(
    p_first_name VARCHAR,
    p_last_name VARCHAR,
    p_total_sales INTEGER,
    p_recent_sale INTEGER,
    p_invoice_id INTEGER
) RETURNS VOID AS $$
BEGIN
    INSERT INTO sales (first_name, last_name, total_sales, recent_sale, invoice_id)
    VALUES (p_first_name, p_last_name, p_total_sales, p_recent_sale, p_invoice_id);
END;
$$ LANGUAGE plpgsql;

-- Insert invoice data
CREATE OR REPLACE FUNCTION insert_invoices(
    p_car_id INTEGER,
    p_customer_id INTEGER,
    p_sales_id INTEGER,
    p_mechanic_id INTEGER
) RETURNS VOID AS $$
BEGIN
    INSERT INTO invoices (car_id, customer_id, sales_id, mechanic_id)
    VALUES (p_car_id, p_customer_id, p_sales_id, p_mechanic_id);
END;
$$ LANGUAGE plpgsql;

-- Insert customer data
CREATE OR REPLACE FUNCTION insert_customer(
    p_first_name VARCHAR,
    p_last_name VARCHAR,
    p_invoice_id INTEGER,
    p_service_id INTEGER
) RETURNS VOID AS $$
BEGIN
    INSERT INTO customer (first_name, last_name, invoice_id, service_id)
    VALUES (p_first_name, p_last_name, p_invoice_id, p_service_id);
END;
$$ LANGUAGE plpgsql;



-- Insert sales data example
SELECT insert_sales('John', 'Doe', 5000, 1000, 1);

-- Insert invoice data example 
SELECT insert_invoices(1, 1, 1, 1);


-- Insert customer data example 
SELECT insert_customer('John', 'Doe', 1, 1);
