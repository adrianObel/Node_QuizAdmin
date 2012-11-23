# Controller for '/login' page
app = null 

module.exports = page = (_app) ->
  app = _app
  page


page.render = (req, res) ->
  user = req.session.user
  
  if not user?
    res.render 'login', title: 'QuizAdmin'
  else
    res.redirect '/'
