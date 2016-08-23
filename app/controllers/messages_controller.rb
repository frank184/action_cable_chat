class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.all
    @message = Message.new
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)
    if @message.save
      ActionCable.server.broadcast "chat", {
        message: render(
          partial: 'message',
          locals: { message: @message }
        ).squish
      }
    end
  end

  private
    def message_params
      params.require(:message).permit(:content)
    end
end
