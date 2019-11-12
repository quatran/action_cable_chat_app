App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    unless !data.content?
      $('#messages-table').append '<div class="message">' +
        '<div class="message-user">' + data.username + ":" + '</div>' +
        '<div class="message-content">' + data.content + '</div>' + '</div>'


  $(document).on 'turbolinks:load', ->
    submit_message()
  submit_message = () ->
 #DOM select $('#ElementID')
  $('#message_content').on 'keydown', (event) ->
 #keycode 13 = Enter- key
    if event.keyCode is 13
      $('input').click()
      event.target.value = ""
      event.preventDefault()