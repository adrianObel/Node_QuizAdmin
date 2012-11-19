mongoose = require 'mongoose'
Schema   = mongoose.Schema
ObjectId = Schema.ObjectId
app      = null

module.exports = User = (_app) ->
  app = _app
  User


User = new Schema 
  _id  : ObjectId
  login: type:String
  pass : type:String
  type : type:Number
  name:
    first: type:String
    last : type:String
  birth_date: type:Date 
  last_login    : type:Date, default: Date.now
  creation_date : type:Date, default: Date.now

