# Controller for Session start and destroy
app = null

module.exports = sess = (_app) ->
  app = _app
  sess


sess.start = (req, res) ->
  user = req.body.user

  if user?
    req.session.user = user
    res.render 'index', title: 'QuizAdmin'
                      , user : user

sess.destroy = (req, res) ->
  req.session.regenerate -> 
    res.send '{}'
