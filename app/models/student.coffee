crypto   = require 'crypto'
mongoose = require 'mongoose'
Schema   = mongoose.Schema
ObjectId = Schema.ObjectId

app = null
db  = null

module.exports = Student = (_app) ->
  app = _app
  Student

# Student mongoose schema
Student = new Schema 
  _id: type: Number

Student.create = (_login, _pass, _name, _birth_date) ->
  date = new Date()
  db   = app.set 'db' if not db

  # Lets create a new user
  student = new db.students
    # Student stuff here :D

  # Save student in database
  student.save (err) ->  return cb err if err

