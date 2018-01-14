jQuery(document).on 'turbolinks:load', ->
  messages = $('#messages')
  if $('#messages').length > 0
    messages_to_bottom = -> messages.scrollTop(messages.prop("scrollHeight"))

    messages_to_bottom()

    App.chat = App.cable.subscriptions.create {
      channel: "ConversationsChannel"
      conversation_id: messages.data('conversation-id')
    },
      connected: ->
    # Called when the subscription is ready for use on the server

      disconnected: ->
    # Called when the subscription has been terminated by the server

      received: (data) ->
        messages.append data['message']
        messages_to_bottom()

      send_message: (message, conversation_id) ->
        @perform 'send_message', message: message, conversation_id: conversation_id

    $('#new_message').submit (e) ->
      $this = $(this)
      textarea = $this.find('#message_body')
      if $.trim(textarea.val()).length > 1
        App.chat.send_message textarea.val(), messages.data('conversation-id')
        textarea.val('')
      e.preventDefault()
      return false
