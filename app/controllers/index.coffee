# Controller for '/' page
app = null

module.exports = page = (_app) ->
  app = _app
  page


page.render = (req, res) ->
  user = req.session.user

  # If there is user session render index otherwise redirect to login
  if user?
    res.render "index", title: 'QuizAdmin'
                      , user : "#{user.name.first} #{user.name.last}"
  else
    res.redirect '/login'

