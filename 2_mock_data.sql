-- Sample data for employees (English version)
INSERT INTO employees (employee_code, name, position, phone, email, address, thai_id, ssn) VALUES
('EMP001', 'Somchai Jaidee', 'Store Manager', '0812345678', 'somchai.jaidee@example.com', '99/1 Sukhumvit Rd., Bang Na, Bangkok', '1234567890123', 'T-1122334455'),
('EMP002', 'Orathai Suayngam', 'Cashier', '0898765432', 'ornthai.suayngam@example.com', '8/5 Suan Suay Village, Nonthaburi', '2345678901234', 'T-2233445566'),
('EMP003', 'Channarong Thongtae', 'Sales Staff', '0867890123', 'channarong.thongtae@example.com', '15 Ladprao 80, Bangkok', '3456789012345', 'T-3344556677'),
('EMP004', 'Pornpimon Rattanannon', 'Accountant', '0923456789', 'pornpimon.rattanannon@example.com', '12/9 Charoenkrung Rd., Bangkok', '4567890123456', 'T-4455667788'),
('EMP005', 'Teerasak Rungreung', 'IT Officer', '0951234567', 'teerasak.rungreung@example.com', '45 Pracharat Rd., Samut Prakan', '5678901234567', 'T-5566778899'),
('EMP006', 'Sudarat Janchai', 'HR Officer', '0876543210', 'sudarat.janchai@example.com', '59 Moo 4, Phetkasem Rd., Ratchaburi', '6789012345678', 'T-6677889900'),
('EMP007', 'Weerayut Chuchart', 'Delivery Staff', '0843210987', 'weeryut.chuchart@example.com', '888/88 Ramkhamhaeng Rd., Bangkok', '7890123456789', 'T-7788990011'),
('EMP008', 'Narumon Thongma', 'Warehouse Staff', '0832109876', 'narumon.thongma@example.com', '22/3 Prachachuen Rd., Nonthaburi', '8901234567890', 'T-8899001122'),
('EMP009', 'Kriangkrai Pipat', 'Marketing Officer', '0821098765', 'kriangkrai.pipat@example.com', '102/45 Phaholyothin Rd., Bangkok', '9012345678901', 'T-9900112233'),
('EMP010', 'Siriporn Mangmee', 'Designer', '0801234321', 'siriporn.mangmee@example.com', '33/9 Siwalee Village, Chiang Mai', '0123456789012', 'T-1011223344');
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
('Summer Sale', '10% off','SUMMER10'),
('Winter Clearance', '20% off', 'WINTER20'),
('New Year Special', '25% off', 'NEWYEAR25'),
('Back to School', '15% off', 'BACK2SCHOOL'),
('Black Friday', '30% off', 'BLACKFRIDAY'),
('Cyber Monday', '20% off', 'CYBERMONDAY'),
('Valentine\'s Day', '10% off', 'VALENTINE10'),
('Easter Sale', '15% off', 'EASTER15'),
('Halloween Special', '20% off', 'HALLOWEEN20'),
('Thanksgiving', '10% off', 'THANKSGIVING10'),
('Christmas Sale', '25% off', 'CHRISTMAS25');

-- Sample data for customers
INSERT INTO customers (name, email, phone, address, passport_id, credit_card) VALUES
('John Smith',      'john.smith@example.com',      '0811111111', '101 Main St., Bangkok',        'PA1234567', '4111111111111111'),  -- Visa
('Sakura Tanaka',   'sakura.tanaka@example.com',   '0822222222', '202 Sakura Rd., Tokyo',         'JP9876543', '5500000000000004'),  -- MasterCard
('Lisa Chan',       'lisa.chan@example.com',       '0833333333', '303 Orchard Rd., Singapore',    'SG1234987', '340000000000009'),   -- Amex
('David Miller',    'david.miller@example.com',    '0844444444', '404 Queen St., Sydney',         'AU5432198', '6011000000000004'),  -- Discover
('Amelia Brown',    'amelia.brown@example.com',    '0855555555', '505 King Rd., London',          'GB8765432', '3530111333300000'),  -- JCB
('Thanawat Phong',  'thanawat.phong@example.com',  '0866666666', '606 Sukhumvit, Bangkok',        'TH9988776', '4111222233334444'),  -- Visa
('Marie Dubois',    'marie.dubois@example.com',    '0877777777', '707 Rue de Paris, Paris',       'FR1122334', '5555555555554444'),  -- MasterCard
('Daniel Kim',      'daniel.kim@example.com',      '0888888888', '808 Gangnam Ave., Seoul',       'KR3344556', '378282246310005'),   -- Amex
('Isabella Rossi',  'isabella.rossi@example.com',  '0899999999', '909 Via Roma, Rome',            'IT4455667', '6011111111111117'),  -- Discover
('Nguyen Minh',     'nguyen.minh@example.com',     '0801234567', '111 Le Loi, Ho Chi Minh City',  'VN2233445', '3530555555555555');  -- JCB
