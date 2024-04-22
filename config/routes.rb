Rails.application.routes.draw do
  mount ActionCable.server => "/cable"
  
  resources :chats
  resources :chat_rooms
end
