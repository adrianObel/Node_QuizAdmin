# Controller for User interaction
app = null
db  = null

module.exports = User = (_app) ->
  app = _app
  User

# Send user info
User.getUser = (req, res) ->
  db  = app.server.set 'db' if not db
