# Page routing
app        = null
controllers = {}

module.exports = (_app)->
  app = _app
  controllers.index   = require('./controllers/index'  )(app)
  controllers.login   = require('./controllers/login'  )(app)
  controllers.session = require('./controllers/session')(app)

  app.server.get  '/login'       , controllers.login.render
  app.server.get  '/'            , controllers.index.render
  
  # User sessions
  app.server.post '/user/connect', controllers.session.start
  app.server.del  '/user/connect', controllers.session.destroy

