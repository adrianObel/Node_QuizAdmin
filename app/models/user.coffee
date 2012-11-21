crypto   = require 'crypto'
mongoose = require 'mongoose'
Schema   = mongoose.Schema
ObjectId = Schema.ObjectId

app = null
db  = null

module.exports = User = (_app) ->
  app = _app
  User

# User mongoose schema
User = new Schema 
  _id           : ObjectId
  login         : type: String
  pass          : type: String
  name:
    first: type: String
    last : type: String
  email         : type: String
  birth_date    : type: Date   
  last_login    : type: Date, default: Date.now
  creation_date : type: Date, default: Date.now

User.create = (_login, _pass, _name, _birth_date) ->
  date = new Date()
  db   = app.set 'db' if not db
  pass = crypto
    .createHash('md5')
    .update(_pass)
    .digest('hex' )

  # Lets create a new user
  user = new db.users
    login        : _login
    pass         : pass
    name:
      first: _name.first
      last : _name.last
    birth_date: _birth_date
    last_login   : date
    creation_date: date

  # Save user in database
  user.save (err) ->  return cb err if err

