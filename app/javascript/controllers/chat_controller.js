import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["chat"];
  
  submitCreate(event) {
    let token = document.querySelector("meta[name='csrf-token']").getAttribute("content");
    const content = event.target.value
    const chatRoomId = event.target.dataset.chatRoomId
    const url = `/chats`
    if(content != '') {
      const data = {
        content: content,
        chat_room_id: chatRoomId,
      }

      fetch(url, {
        method: 'POST',
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'X-CSRF-Token': token
        },
        body: JSON.stringify(data)
      })
      .then(function(_res){ event.target.value = ""; })
    }
  }
}
