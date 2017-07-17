class MessagesController < ApplicationController
  def index
    #renders all messages for a user
    @messages = Message.where(receiver: current_user)
  end

  def new
    #renders message form
    @product = Product.find(params[:product])
  end

  def create
    @message = Message.new(message_params)
    @message.save
    if !@message.save
      flash[:errors] = @message.errors.full_messages
      redirect_to "/products"
    else
      redirect_to "/products"
    end
  end

  # def read
  #   @message1= Message.find(params[:id])
  #   @message1.mark_as_read! :for => current_user
  #   return false
  # end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to "/messages"
  end

  private
    def message_params
      params.require(:message).permit(:title, :content, :receiver_id, :sender_id)
    end
end
