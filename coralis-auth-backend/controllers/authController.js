const db = require('../config/db')
const bcrypt = require('bcrypt')
const jwt = require('jsonwebtoken')
const { v4: uuidv4 } = require('uuid')

exports.register = async (req, res) => {
  const { email, password } = req.body

  const hashedPassword = await bcrypt.hash(password, 10)

  db.query(
    'INSERT INTO users (email, password) VALUES (?,?)',
    [email, hashedPassword],
    (err, result) => {
      if (err) return res.status(500).json(err)
      res.json({ message: 'User registered' })
    }
  )
}
exports.login = (req, res) => {
  const { email, password } = req.body

  db.query(
    'SELECT * FROM users WHERE email=?',
    [email],
    async (err, results) => {
      if (results.length === 0)
        return res.status(404).json({ message: 'User not found' })

      const user = results[0]
      const match = await bcrypt.compare(password, user.password)

      if (!match)
        return res.status(401).json({ message: 'Wrong password' })

      const token = jwt.sign({ id: user.id }, process.env.JWT_SECRET)

      res.json({ token })
    }
  )
}

exports.forgotPassword = (req, res) => {
  const { email } = req.body
  const token = uuidv4()

  db.query(
    'UPDATE users SET reset_token=?, reset_token_expiry=DATE_ADD(NOW(), INTERVAL 1 HOUR) WHERE email=?',
    [token, email],
    err => {
      if (err) return res.status(500).json(err)

      res.json({
        message: 'Reset token generated',
        token: token
      })
    }
  )
}

exports.resetPassword = async (req, res) => {
  const { token, newPassword } = req.body

  const hashedPassword = await bcrypt.hash(newPassword, 10)

  db.query(
    'UPDATE users SET password=?, reset_token=NULL WHERE reset_token=?',
    [hashedPassword, token],
    err => {
      if (err) return res.status(500).json(err)

      res.json({ message: 'Password updated' })
    }
  )
}

