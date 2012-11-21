crypto   = require 'crypto'
mongoose = require 'mongoose'
Schema   = mongoose.Schema
ObjectId = Schema.ObjectId

app = null
db  = null

module.exports = Staff = (_app) ->
  app = _app
  Staff

# Staff mongoose schema
Staff = new Schema 
  _id: type: Number

Staff.create = (_login, _pass, _name, _birth_date) ->
  date = new Date()
  db   = app.set 'db' if not db

  # Lets create a new staff memeber
  staff = new db.staff
    # Staff stuff here

  # Save staff member in database
  staff.save (err) ->  return cb err if err

