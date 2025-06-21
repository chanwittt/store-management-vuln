-- Sample data for employees
INSERT INTO employees (name, phone, email, address, thai_id, ssn) VALUES
('Admin User', '0812345678', 'admin@example.com', '123 Main St, Bangkok', '1103700234567', 'S123456789'),
('Cashier User', '0823456789', 'cashier@example.com', '456 Side St, Bangkok', '1103700987654', 'S987654321');

-- Sample data for users
INSERT INTO users (username, password_hash, role, employee_id) VALUES
('admin', '$2a$10$8rRy8x.f2ivp/kvld8WKBOGKdcZFh/H185Q2ieu.XGSBgKkpiDB7i', 'manager', 1),
('cashier', '$2a$10$mdD4xqVcraHoABhgziHpfuAMDSvGkoxMZj2WQmVHra6k2sC.coI7i', 'staff', 2);

-- Sample data for inventory
INSERT INTO inventory (sku, description, icon_url, quantity, cost_price, sale_price) VALUES
('WID123', 'Widget', '/images/blank-icon.png', 50, 10.00, 15.00),
('GAD456', 'Gadget', '/images/blank-icon.png', 100, 20.00, 30.00);

-- Sample data for promotions
INSERT INTO promotions (title, discount) VALUES
('Summer Sale', '10% off'),
('Clearance', '20% off');

-- Sample data for customers
INSERT INTO customers (name, email, phone, address, thai_id, credit_card) VALUES
('John Doe', 'john@example.com', '0891112233', '789 Market St, Bangkok', '1103700123456', '4111111111111111'),
('Jane Smith', 'jane@example.com', '0862223344', '1010 River Rd, Bangkok', '1103700654321', '4222222222222');
