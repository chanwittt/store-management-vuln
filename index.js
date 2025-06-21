const express = require('express');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const pool = require('./db');
const authenticate = require('./authMiddleware');

const app = express();
app.use(express.json());
app.use(express.static('public'));

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
  const { name, quantity } = req.body;
  try {
    await pool.query('INSERT INTO inventory (name, quantity) VALUES (?, ?)', [name, quantity]);
    res.status(201).json({ message: 'Item created' });
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
  const { title, discount } = req.body;
  try {
    await pool.query('INSERT INTO promotions (title, discount) VALUES (?, ?)', [title, discount]);
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
