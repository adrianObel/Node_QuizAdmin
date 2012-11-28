# Controller for User interaction
app = null
db  = null

module.exports = User = (_app) ->
  app = _app
  User

# Send user info
User.getUser = (req, res) ->
 
  db        = app.server.set 'db' if not db
  params    = req.params.id

  if params?
    # Look for user details
    db.users.findOne {'login': params}, (err, user) ->
      throw err if err

      if user 
        userFound =
          name : user.name.first
          last : user.name.last
          email: user.email
          type : user.type

        res.send userFound

# Send all students
User.getAllStudents = (req, res) ->

  db = app.server.set 'db' if not db

  # Look for all the teachers in the teachers collection
  db.users.find { 'type': 2 }, 'name.first', (err, student) ->
    throw err if err

    # Send all the teachers found
    data = if student then student else ''
    res.send data

# Send all teachers
User.getAllTeachers = (req, res) ->
 
  db = app.server.set 'db' if not db

  # Look for all the teachers in the teachers collection
  db.users.find { 'type': 1 }, 'name.first', (err, teacher) ->
    throw err if err

    # Send all the teachers found
    data = if teacher then teacher else ''
    res.send data

# Create user
User.createUser = (req, res) ->
  db      = app.server.set 'db' if not db
  params  = req.body
  errCode = [
    0 # User Exists
    1 # Params required not met
  ]

  if params?
    type = if params.type is "1" then 'teachers' else 'students'

    # Lets make sure user is unique
    db.users.findOne {'login': params.login}, (err, foundUser) ->
      res.send err if err

      if foundUser?
        res.send errCode[0]
      else 
        db.users.create params, (err, user) ->
          res.send err if err
          if user?
            db[type].create params, (err, created) ->
              res.send JSON.stringify(created) if created
  else
    res.send errCode[1]


#  user
User.updateUser = (req, res) ->

# Delete user
User.deleteUser = (req, res) ->