-- Sample data for employees
INSERT INTO employees (employee_code, name, phone, email, address, thai_id, ssn, role) VALUES
('EMP001', 'สมชาย ใจดี', '0812345678', 'somchai.jaidee@example.com', '99/1 ถ.สุขุมวิท แขวงบางนา กรุงเทพฯ', '1234567890123', 'T-1122334455', 'manager'),
('EMP002', 'อรทัย สวยงาม', '0898765432', 'ornthai.suayngam@example.com', '8/5 หมู่บ้านสวนสวย นนทบุรี', '2345678901234', 'T-2233445566'),
('EMP003', 'ชาญณรงค์ ทองแท้', '0867890123', 'channarong.thongtae@example.com', '15 ซ.ลาดพร้าว 80 กรุงเทพฯ', '3456789012345', 'T-3344556677'),
('EMP004', 'พรพิมล รัตนานนท์', '0923456789', 'pornpimon.rattanannon@example.com', '12/9 ถ.เจริญกรุง กรุงเทพฯ', '4567890123456', 'T-4455667788'),
('EMP005', 'ธีรศักดิ์ รุ่งเรือง', '0951234567', 'teerasak.rungreung@example.com', '45 ถ.ประชาราษฎร์ สมุทรปราการ', '5678901234567', 'T-5566778899'),
('EMP006', 'สุดารัตน์ จันทร์ฉาย', '0876543210', 'sudarat.janchai@example.com', '59 หมู่ 4 ถ.เพชรเกษม ราชบุรี', '6789012345678', 'T-6677889900'),
('EMP007', 'วีรยุทธ ชูชาติ', '0843210987', 'weeryut.chuchart@example.com', '888/88 ถ.รามคำแหง กรุงเทพฯ', '7890123456789', 'T-7788990011'),
('EMP008', 'นฤมล ทองมา', '0832109876', 'narumon.thongma@example.com', '22/3 ถ.ประชาชื่น นนทบุรี', '8901234567890', 'T-8899001122'),
('EMP009', 'เกรียงไกร พิพัฒน์', '0821098765', 'kriangkrai.pipat@example.com', '102/45 ถ.พหลโยธิน กรุงเทพฯ', '9012345678901', 'T-9900112233'),
('EMP010', 'สิริพร มั่งมี', '0801234321', 'siriporn.mangmee@example.com', '33/9 หมู่บ้านสีวลี เชียงใหม่', '0123456789012', 'T-1011223344');

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
INSERT INTO customers (name, email, phone, address, thai_id, credit_card) VALUES
('John Doe', 'john@example.com', '0891112233', '789 Market St, Bangkok', '1103700123456', '4111111111111111'),
('Jane Smith', 'jane@example.com', '0862223344', '1010 River Rd, Bangkok', '1103700654321', '4222222222222');
