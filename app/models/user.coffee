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
  type          : type: Number, required: true, index: true
  login         : type: String, required: true, index: true 
  pass          : type: String, required: true
  name:
    first: type: String, required: true
    last : type: String, required: true
  email         : type: String, required: true
  birth_date    : type: Date  , required: true
  last_login    : type: Date
  creation_date : type: Date


User.pre 'save', (next) ->
  @last_login = new Date()
  next()

User.statics.create = (data, callback) ->
  callback 'missing data' if not data
  
  date     = new Date()
  db       = app.server.set 'db' if not db
  bDate    = new Date data.year, data.month, data.day
  passHash = app.utils.encrypt data.login
  # Lets create a new user
  user = new db.users
    type         : data.type
    login        : data.login
    pass         : passHash
    name:
      first: data.first
      last : data.last
    email: data.email
    birth_date   : bDate
    last_login   : date
    creation_date: date

  # Save user in database
  user.save (err) -> 
    callback err if err

    # Lets return the user in the callback
    callback null, user

