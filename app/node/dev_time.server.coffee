ws = require 'websocket-server'
red = require 'redis'

exports.start = ->
  server = ws.createServer()
  redis = red.createClient()
  redis.on 'pmessage', (pattern, channel, message) ->
    eventId = channel.split('.')[1]
    server.broadcastIf message, (connection) ->
      connection.eventId is eventId
  redis.psubscribe 'comments.*'

  server.on 'connection', (connection) ->
    connection.on 'message', (@eventId) ->
  server.listen 3030
