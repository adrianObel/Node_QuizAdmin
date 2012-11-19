mongoose = require 'mongoose'
Schema   = mongoose.Schema
ObjectId = Schema.ObjectId

app = null
db  = null

module.exports = User = (_app) ->
  app = _app
  User


User = new Schema 
  _id           : ObjectId
  login         : type: String, index: true
  pass          : type: String
  type          : type: Number
  name:
    first: type: String
    last : type: String
  birth_date    : type: Date 
  last_login    : type: Date, default: Date.now
  creation_date : type: Date, default: Date.now

User.create = (login, pass, name, birth_date) ->
  date = new Date()
  db   = app.set 'db' if not db

  # Lets create a new user
  user = new db.users
    login        : login
    pass         : pass
    name:
      first: name.first
      last : name.last
    birth_date: birth_date
    last_login   : date
    creation_date: date

  # Save user in database
  user.save (err) ->  return cb err if err
