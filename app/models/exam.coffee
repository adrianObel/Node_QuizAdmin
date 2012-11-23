crypto   = require 'crypto'
mongoose = require 'mongoose'
Schema   = mongoose.Schema
ObjectId = Schema.ObjectId

app = null
db  = null

module.exports = Exam = (_app) ->
  app = _app
  Exam

# Staff mongoose schema
Exam = new Schema 
  _id       : ObjectId
  teacher_id: type: String
  questions : [
                title  : type: String
                options: [type: String]
                answer : type: Number
  ]

Exam.create = (_teacher_id, _questions) ->
  date = new Date()
  db   = app.set 'db' if not db

  # Lets create a new exam
  exam = new db.exams
    teacher_id: _teacher_id
    questions : _questions

  # Save exam in database
  exam.save (err) ->  return cb err if err

