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
  student_id: type: String, required: true, index: true
  teacher   : [String]
  exams     : [ObjectId]

Student.statics.create = (data, callback) ->
  date = new Date()
  db   = app.server.set 'db' if not db

  # Lets create a new user
  student = new db.students
    student_id: data.login

  # Save student in database
  student.save (err) ->  
    callback err if err
    # Return student in callback
    callback null, student

