class Message < ApplicationRecord
  belongs_to :user
  belongs_to :conversation

  after_create_commit { MessageBroadcastJob.perform_later(self) }

  def send_at
    created_at.strftime('%H:%M:%S')
  end
end
