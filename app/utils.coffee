crypto = require 'crypto'
app    = null

module.exports = Utils =  (_app) ->
  app = _app
  Utils

Utils.encrypt = (str) ->
  crypto
    .createHash('md5')
    .update(str)
    .digest('hex' )


