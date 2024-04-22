class ChatChannel < ApplicationCable::Channel
  def subscribed
    return unless params[:chat_room_id]

    stream_from "chat_channel_#{params[:chat_room_id]}"
  end

  def unsubscribed
    stop_all_streams
  end
end
