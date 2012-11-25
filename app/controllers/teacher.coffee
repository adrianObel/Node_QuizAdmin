# Controller for Teacher interaction
app = null
db  = null

module.exports = Teacher = (_app) ->
  app = _app
  Teacher

# Send all teachers
Teacher.getAllTeachers = (req, res) ->
 
  db = app.server.set 'db' if not db

  # Look for all the teachers in the teachers collection
  db.users.find { 'type': 1 }, 'name.first', (err, teacher) ->
    throw err if err

    # Send all the teachers found
    data = if teacher then teacher else ''
    res.send data

