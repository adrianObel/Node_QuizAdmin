# Controller for Topics
app = null
db  = null

module.exports = Topic = (_app) ->
  app = _app
  Topic

Topic.create = (req, res) ->
  params = req.body
  db     = app.server.set 'db' if not db

  db.topics.create params, (err, topic) ->
    res.send 400 if err
    res.json params if topic

Topic.getTopics = (req, res) ->
  params = req.params.name
  db     = app.server.set 'db' if not db

  res.send 400 if not params?
  db.topics.find {'name': params}, (err, topic) ->
    res.send 204 if not topic?
    res.send topic