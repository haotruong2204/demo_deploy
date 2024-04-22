class ChatsController < ApplicationController
  def create
    @chat = Chat.new chat_params
    @chat.chat_room_id = params[:chat_room_id]

    return unless @chat.save

    ActionCable.server.broadcast("chat_channel_#{params[:chat_room_id]}",
      {
        chat_id: @chat.id,
        chat_room_id: @chat.chat_room_id,
        html: render_to_string(partial: "chats/chat", locals: { chat: @chat }, formats: [:html], locale: [:en], handlers: [:erb])
      })
  end

  private

  def chat_params
    params.require(:chat).permit(:content, :chat_room_id)
  end
end
