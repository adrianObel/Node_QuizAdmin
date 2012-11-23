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
  _id       : ObjectId
  student_id: type: String, index: true
  teacher   : [String]
  exams     : [String]

Student.create = (_student_id, _teacher, _exams) ->
  date = new Date()
  db   = app.set 'db' if not db

  # Lets create a new user
  student = new db.students
    student_id: _student_id
    teacher   : [_teacher]
    exams     : [_exams]

  # Save student in database
  student.save (err) ->  return cb err if err

