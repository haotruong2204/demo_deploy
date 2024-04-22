import consumer from "channels/consumer"

consumer.subscriptions.create({
  channel: "ChatChannel",
  chat_room_id: document.querySelector(".chat-rom-id")?.dataset?.chatRoomId
}, 
{
  connected() {
  },
  received(data) {
    const elmChild = document.querySelector(`#chat-list-${data.chat_room_id}`);
    elmChild.insertAdjacentHTML( 'beforeend', data.html );
  }
});
