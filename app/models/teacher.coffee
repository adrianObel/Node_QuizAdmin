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
  _id       : ObjectId
  teacher_id: type: String, index: true


Teacher.create = (_teacher_id) ->
  date = new Date()
  db   = app.set 'db' if not db

  # Lets create a new teacher
  teacher = new db.teachers
    teacher_id: _teacher_id

  # Save teacher in database
  teacher.save (err) ->  return cb err if err

