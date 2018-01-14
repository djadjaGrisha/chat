class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast "conversations_#{message.conversation.id}_channel",
                                 message: render_message(message)
  end

  private

  def render_message(message)
    # TODO: pass user ID for identify own messages
    MessagesController.render partial: 'messages/message', locals: { message: message }
  end
end
