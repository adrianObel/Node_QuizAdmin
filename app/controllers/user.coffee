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


    # #search in student
    # db.students.findOne {'student_id': params}, 'student_id', (err, student) ->
    #   userType = 2 if student 
    
    # #search in teachers
    # if not userType?    
    #   # search in teachers
    #   db.teachers.findOne {'teacher_id': params}, 'teacher_id', (err, teacher) ->
    #     userType = 1 if teacher
    
    # #seach in staff      
    # if not userType?
    #   db.staff.findOne {'staff_id': params}, (err, staff) ->
    #     userType = 0 if staff 

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

