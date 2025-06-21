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
('ATY001', 'Be@rbrick Andy Warhol 1000%', '/images/blank-icon.png', 5, 12000.00, 18000.00),
('ATY002', 'Kaws Companion Open Edition', '/images/blank-icon.png', 8, 8500.00, 12000.00),
('ATY003', 'Mighty Jaxx XXRAY Plus Spongebob', '/images/blank-icon.png', 10, 3200.00, 4800.00),
('ATY004', 'Pop Mart Labubu Sweet Series', '/images/blank-icon.png', 15, 600.00, 990.00),
('ATY005', 'Instinctoy Monster Fluffy', '/images/blank-icon.png', 3, 7800.00, 9500.00),
('ATY006', 'Medicom Toy UDF Snoopy', '/images/blank-icon.png', 20, 350.00, 650.00),
('ATY007', 'Molly Zodiac Series Aries', '/images/blank-icon.png', 9, 1100.00, 1790.00),
('ATY008', 'Sonny Angel Animal 4 Series', '/images/blank-icon.png', 12, 420.00, 699.00),
('ATY009', 'Coarse Little Voyagers', '/images/blank-icon.png', 6, 1850.00, 2950.00),
('ATY010', 'Dunny Azteca Series 2', '/images/blank-icon.png', 7, 2200.00, 3500.00);

-- Sample data for promotions
INSERT INTO promotions (title, discount, discount_code) VALUES
('Summer Sale', '10% off', 'SUMMER10'),
('Clearance', '20% off', 'CLEAR20');

-- Sample data for customers
INSERT INTO customers (name, email, phone, address, thai_id, credit_card) VALUES
('John Doe', 'john@example.com', '0891112233', '789 Market St, Bangkok', '1103700123456', '4111111111111111'),
('Jane Smith', 'jane@example.com', '0862223344', '1010 River Rd, Bangkok', '1103700654321', '4222222222222');
