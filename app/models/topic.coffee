mongoose = require 'mongoose'
Schema   = mongoose.Schema
ObjectId = Schema.ObjectId

app = null
db  = null

module.exports = Topic = (_app) ->
  app = _app
  Topic

# Topic mongoose schema
Topic = new Schema 
  _id       : ObjectId
  name      : type: String, required: true, index: true
  questions : [
    title    : type: String
    selection: [type: String]
    answer   : type: Number
  ]


Topic.statics.create = (data, callback) ->
  date = new Date()
  db   = app.server.set 'db' if not db

  #Now lets add it to the topic collection
  topic = new db.topics
    name: data.name

  topic.save (err) -> 
    callback err if err
    callback null, topic



