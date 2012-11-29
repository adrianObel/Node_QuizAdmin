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
  teacher_id: type: String, index: true, required: true


Teacher.statics.create = (data, callback) ->
  date = new Date()
  db   = app.server.set 'db' if not db

  #Now lets add it to the teacher collection
  teacher = new db.teachers
    teacher_id: data.login

  teacher.save (err) -> 
    callback err if err
    callback null, teacher



