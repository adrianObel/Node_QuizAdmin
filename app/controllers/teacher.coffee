# Controller for Teacher interaction
app = null
db  = null

module.exports = Teacher = (_app) ->
  app = _app
  Teacher

# Send all teachers
Teacher.getAllTeachers = (req, res) ->
 
  db = app.server.set 'db' if not db

  db.teachers.find {}, 'teacher_id', (err, teacher) ->
    throw err if err
    # Send all the teachers found
    res.send teacher

