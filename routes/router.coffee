# App Router

module.exports = routes = ->
  routes

# Get request of /
routes.index = (req, res) ->
  user = req.session.user

  # If there is user session render index else redirect to login
  if user?
    res.render "index", title: 'QuizAdmin'
                      , user : user
  else
    res.redirect '/login'

# Post request of /
routes.signIn = (req, res) ->
  user = req.body.user

  # If there is user POST param create session
  if user?
    req.session.user = user
    res.render 'index', title: 'QuizAdmin'
                      , user : user


# Get request of /login
routes.login = (req, res) ->
  user = req.session.user

  if not user?
    res.render 'login', title: 'QuizAdmin'
  else
    res.redirect '/'
