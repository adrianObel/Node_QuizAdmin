# Controller for Session start and destroy
app = null
db  = null

module.exports = Session = (_app) ->
  app = _app
  Session


Session.start = (req, res) ->
  db     = app.server.set 'db' if not db
  params =
    login: req.body.user
    pass : req.body.pass

  pass = app.utils.encrypt params.pass

  if params.login? and params.pass? 
    db.users.findOne {'login': params.login,'pass': pass}, (err, user) ->
     
      if user?
        _user =
          name:
            first: user.name.first
            last : user.name.last
          id  : user.login
        
        # Update last login
        db.users.update {'login': params.login}, {$set:{'last_login': new Date()}}

        # Save user in session
        req.session.user = _user
        res.send 'true'
      else 
        res.send 'false'
  else
    res.send 'false'

Session.destroy = (req, res) ->
  req.session.regenerate -> 
    res.send '{}'

