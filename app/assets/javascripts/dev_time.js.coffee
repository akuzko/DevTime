@devtime = {}

class @devtime.Application
  constructor: ->
    @params = {}
    @websockets = on if 'WebSocket' of window
  eventComments: ->
    if @websockets?
      connection = new WebSocket 'ws://localhost:3030'
      connection.onopen = =>
        connection.send @params.eventId
      connection.onmessage = (evt) =>
        data = JSON.parse evt.data
        @comments[data.action](data.comment, @params.eventId)
  comments:
    create: (commentId, eventId) ->
      $('<div>Loading...</div>').appendTo('#comments .all').load "/events/#{eventId}/comments/#{commentId}", ->
        $(this).children().hide().unwrap().slideDown()
    destroy: (commentId) ->
      $("#comment_#{commentId}").fadeOut 'slow', -> $(this).remove()


@app = new @devtime.Application
