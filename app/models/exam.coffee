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
  name      : type: String, required: true
  questions : [
    title   : type : String
    choice  : [type: String]
    answer  : type : Number
  ]

Exam.statics.create = (data, callback) ->
  date = new Date()
  db   = app.server.set 'db' if not db

  callback 'Missing data' if not data?

  # Lets create a new exam
  exam = new db.exams
    name: data.name
    questions : data.questions

  # Save exam in database
  exam.save (err) ->  
    callback err if err
    callback null, exam

