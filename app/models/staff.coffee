crypto   = require 'crypto'
mongoose = require 'mongoose'
Schema   = mongoose.Schema
ObjectId = Schema.ObjectId

app = null
db  = null

module.exports = Staff = (_app) ->
  app = _app
  Staff

# Staff mongoose schema
Staff = new Schema 
  _id     : ObjectId
  staff_id: type: String, index: true

Staff.statics.create = (data, callback) ->
  date = new Date()
  db   = app.set 'db' if not db

  # Lets create a new staff memeber
  staff = new db.staff
    staff_id: data.login

  # Save staff member in database
  staff.save (err) ->  
    callback err if err
    # Return student in callback
    callback null, staff
 
