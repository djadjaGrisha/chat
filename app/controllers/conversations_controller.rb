class ConversationsController < ApplicationController
  before_action :set_conversation, only: %i[show destroy]

  def index
    @conversations = Conversation.all
  end

  def show
    @message = Message.new
  end

  def new
    @conversation = Conversation.new
    # @message = Message.new
  end

  def create
    @conversation = current_user.conversations.build(conversation_params)
    if @conversation.save
      flash[:success] = 'Conversation added!'
      redirect_to conversations_path
    else
      render 'new'
    end
  end

  def destroy
    redirect_to conversations_path
  end

  private

  def set_conversation
    @conversation = Conversation.find(params[:id])
  end

  def conversation_params
    params.require(:conversation).permit(:topic)
  end
end
