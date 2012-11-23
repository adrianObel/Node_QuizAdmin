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
    # Lets check what kind of user he is
    userType = null
    

    #search in student
    db.students.findOne 'student_id': params, 'student_id', (err, student) ->
      if student 
        userType = 2
      else
        # search in teachers
        db.teachers.findOne 'teacher_id': params, 'teacher_id', (err, teacher) ->
          if teacher
            userType = 1
          else
            #seach in staff
            db.staff.findOne 'staff_id': params, 'staff_id', (err, staff) ->
              userType = 0 if staff 

    # Look for user details
    db.users.findOne {'login': params}, (err, user) ->
      throw err if err

      if user 
        userFound =
          name : user.name.first
          last : user.name.last
          email: user.email
          type : userType

        res.send userFound

