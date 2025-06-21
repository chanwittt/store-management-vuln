const express = require('express');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const pool = require('./db');
const authenticate = require('./authMiddleware');

const app = express();
app.use(express.json());
// Basic CORS support so the API can be called from the frontend
app.use((req, res, next) => {
  res.header('Access-Control-Allow-Origin', '*');
  res.header('Access-Control-Allow-Methods', 'GET,POST,PUT,DELETE,OPTIONS');
  res.header('Access-Control-Allow-Headers', 'Content-Type, Authorization');
  if (req.method === 'OPTIONS') return res.sendStatus(204);
  next();
});
app.use(express.static('public'));

// user creation
app.post('/api/users', async (req, res) => {
  const { username, password, role, employee_id } = req.body;
  try {
    const hash = await bcrypt.hash(password, 10);
    await pool.query(
      'INSERT INTO users (username, password_hash, role, employee_id) VALUES (?, ?, ?, ?)',
      [username, hash, role, employee_id || null]
    );
    res.status(201).json({ message: 'User created' });
  } catch (err) {
    res.status(500).json({ error: 'Server error' });
  }
});

// user login
app.post('/api/login', async (req, res) => {
  const { username, password } = req.body;
  try {
    const [rows] = await pool.query('SELECT * FROM users WHERE username = ?', [username]);
    if (rows.length === 0) return res.status(401).json({ error: 'Invalid credentials' });
    const user = rows[0];
    const match = await bcrypt.compare(password, user.password_hash);
    if (!match) return res.status(401).json({ error: 'Invalid credentials' });
    const token = jwt.sign({ id: user.id, role: user.role }, process.env.JWT_SECRET || 'secret', { expiresIn: '1h' });
    res.json({ token });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Server error' });
  }
});

// inventory routes
app.get('/api/inventory', authenticate, async (req, res) => {
  try {
    const [rows] = await pool.query('SELECT * FROM inventory');
    res.json(rows);
  } catch (err) {
    res.status(500).json({ error: 'Server error' });
  }
});

app.post('/api/inventory', authenticate, async (req, res) => {
  const { sku, description, icon_url, quantity, cost_price, sale_price } = req.body;
  try {
    await pool.query(
      'INSERT INTO inventory (sku, description, icon_url, quantity, cost_price, sale_price) VALUES (?, ?, ?, ?, ?, ?)',
      [sku, description, icon_url, quantity, cost_price, sale_price]
    );
    res.status(201).json({ message: 'Item created' });
  } catch (err) {
    res.status(500).json({ error: 'Server error' });
  }
});

app.put('/api/inventory/:id', authenticate, async (req, res) => {
  const { id } = req.params;
  const { sku, description, icon_url, quantity, cost_price, sale_price } = req.body;
  try {
    await pool.query(
      'UPDATE inventory SET sku = ?, description = ?, icon_url = ?, quantity = ?, cost_price = ?, sale_price = ? WHERE id = ?',
      [sku, description, icon_url, quantity, cost_price, sale_price, id]
    );
    res.json({ message: 'Item updated' });
  } catch (err) {
    res.status(500).json({ error: 'Server error' });
  }
});

// promotions routes
app.get('/api/promotions', authenticate, async (req, res) => {
  try {
    const [rows] = await pool.query('SELECT * FROM promotions');
    res.json(rows);
  } catch (err) {
    res.status(500).json({ error: 'Server error' });
  }
});

app.post('/api/promotions', authenticate, async (req, res) => {
  const { title, discount, discount_code } = req.body;
  try {
    await pool.query('INSERT INTO promotions (title, discount, discount_code) VALUES (?, ?, ?)', [title, discount, discount_code]);
    res.status(201).json({ message: 'Promotion created' });
  } catch (err) {
    res.status(500).json({ error: 'Server error' });
  }
});

// employee management
app.get('/api/employees', authenticate, async (req, res) => {
  try {
    const [rows] = await pool.query(
      'SELECT e.id, e.name, u.username, u.role FROM employees e LEFT JOIN users u ON e.id = u.employee_id'
    );
    res.json(rows);
  } catch (err) {
    res.status(500).json({ error: 'Server error' });
  }
});

app.post('/api/employees', authenticate, async (req, res) => {
  const { name, username, password, role } = req.body;
  const conn = await pool.getConnection();
  try {
    await conn.beginTransaction();
    const [empResult] = await conn.query('INSERT INTO employees (name) VALUES (?)', [name]);
    const empId = empResult.insertId;
    const hash = await bcrypt.hash(password, 10);
    await conn.query(
      'INSERT INTO users (username, password_hash, role, employee_id) VALUES (?, ?, ?, ?)',
      [username, hash, role, empId]
    );
    await conn.commit();
    res.status(201).json({ message: 'Employee created' });
  } catch (err) {
    await conn.rollback();
    res.status(500).json({ error: 'Server error' });
  } finally {
    conn.release();
  }
});

// customer management
app.get('/api/customers', authenticate, async (req, res) => {
  try {
    const [rows] = await pool.query('SELECT * FROM customers');
    res.json(rows);
  } catch (err) {
    res.status(500).json({ error: 'Server error' });
  }
});

app.post('/api/customers', authenticate, async (req, res) => {
  const { name, email } = req.body;
  try {
    await pool.query('INSERT INTO customers (name, email) VALUES (?, ?)', [name, email]);
    res.status(201).json({ message: 'Customer created' });
  } catch (err) {
    res.status(500).json({ error: 'Server error' });
  }
});

const port = process.env.PORT || 3000;
app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});
