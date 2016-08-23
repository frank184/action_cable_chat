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
    @message = Message.create(message_params)
  end

  private
    def message_params
      params.require(:message).permit(:content)
    end
end
