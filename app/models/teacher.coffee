crypto   = require 'crypto'
mongoose = require 'mongoose'
Schema   = mongoose.Schema
ObjectId = Schema.ObjectId

app = null
db  = null

module.exports = Teacher = (_app) ->
  app = _app
  Teacher

# Teacher mongoose schema
Teacher = new Schema 
  _id: type: Number

Teacher.create = (_login, _pass, _name, _birth_date) ->
  date = new Date()
  db   = app.set 'db' if not db

  # Lets create a new teacher
  teacher = new db.teachers
    # Teacher stuff here :D

  # Save teacher in database
  teacher.save (err) ->  return cb err if err

