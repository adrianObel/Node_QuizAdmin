# Page routing
app        = null
controllers = {}

module.exports = (a)->
  app = a
  controllers.index   = require('./controllers/index'  )(app)
  controllers.login   = require('./controllers/login'  )(app)
  controllers.session = require('./controllers/session')(app)

  app.server.get  '/'       , controllers.index.render
  app.server.get  '/login'  , controllers.login.render
  app.server.post '/session', controllers.session.start
  app.server.del  '/session', controllers.session.destroy

