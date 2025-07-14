const express = require('express');
const jwt = require('jsonwebtoken');

const app = express();
app.use(express.json());

const API_KEY = '2f5ae96c-b558-4c7b-a590-a501ae1c3f6c';

app.all('/DevOps', (req, res, next) => {
  if (req.method !== 'POST') return res.status(405).send('ERROR');
  next();
});

app.post('/DevOps', (req, res) => {
  const apikey = req.headers['x-parse-rest-api-key'];
  if (apikey !== API_KEY) return res.status(401).json({ error: 'Unauthorized' });

  const { to } = req.body;
  const token = jwt.sign({ to, timestamp: Date.now() }, 'secret', { expiresIn: '1h' });

  res.setHeader('X-JWT-KWY', token);
  return res.json({ message: `Hello ${to} your message will be send` });
});

const port = process.env.PORT || 3000;
app.listen(port, () => {
  console.log(`Server listening on port ${port}`);
});

app.get('/health', (req, res) => {
  res.status(200).send('OK');
});


module.exports = app;

