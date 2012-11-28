# Page routing
app         = null
controllers = {}

module.exports = (_app)->
  app = _app

  # Controllers for routing
  controllers.index   = require('./controllers/index'  )(app)
  controllers.login   = require('./controllers/login'  )(app)
  controllers.session = require('./controllers/session')(app)
  controllers.user    = require('./controllers/user'   )(app)
  controllers.modify  = require('./controllers/modify' )(app)

  # General route handling
  app.server.get  '/login'          , controllers.login.render
  app.server.get  '/'               , controllers.index.render
  app.server.get  '/modifyAccount'  , controllers.modify.render

  # User sessions
  app.server.post '/user/connect'   , controllers.session.start
  app.server.del  '/user/connect'   , controllers.session.destroy

  # Api for user interaction
  app.server.get  '/api/1/user/:id' , controllers.user.getUser
  app.server.put  '/api/1/user/:id' , controllers.user.updateUser
  app.server.del  '/api/1/user/:id' , controllers.user.deleteUser 
  app.server.post '/api/1/user'    , controllers.user.createUser
  app.server.get  '/api/1/user'    , controllers.user.getAllUsers 

  # Api for user searching
  app.server.get  '/api/1/teacher' , controllers.user.getAllTeachers
  app.server.get  '/api/1/student' , controllers.user.getAllStudents