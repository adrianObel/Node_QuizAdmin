
###
Module dependencies.
###
express  = require 'express'
http     = require 'http'
path     = require 'path'
mongoose = require 'mongoose'
utils    = require './app/utils'

app      = {}
server   = express()
db       = mongoose.createConnection 'mongodb://localhost/QuizAdmin' 

# App wide GLOBALS
app.db     = db
app.server = server
app.utils  = utils

# Database Models
mongoose.model 'User'   , require('./app/models/user'   )(app)
mongoose.model 'Staff'  , require('./app/models/staff'  )(app)
mongoose.model 'Teacher', require('./app/models/teacher')(app)
mongoose.model 'Student', require('./app/models/student')(app)
mongoose.model 'Exam'   , require('./app/models/exam'   )(app)


server.configure ->
  server.set 'port', process.env.PORT or 3000
  server.set 'views', __dirname + '/views'
  server.set 'view engine', 'jade'
  server.use express.favicon()
  server.use express.logger 'dev'
  server.use express.bodyParser()
  server.use express.methodOverride()
  server.use express.cookieParser 'your secret here'
  server.use express.session()
  server.use server.router
  server.use require('stylus').middleware __dirname + '/public'
  server.use express.static path.join __dirname, 'public'
  server.set 'db', 
    main    : db
    users   : db.model 'User'
    staff   : db.model 'Staff'
    teachers: db.model 'Teacher'
    students: db.model 'Student'
    exams   : db.model 'Exam'

server.configure 'development', ->
  server.use express.errorHandler()

# Routing
require('./app/routes')(app)

http.createServer(server).listen server.get('port'), ->
  console.log "Express server listening on port #{server.get 'port'}"
