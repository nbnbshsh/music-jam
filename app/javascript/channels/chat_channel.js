import consumer from "./consumer"

consumer.subscriptions.create("ChatChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    // window.onload = function(){
    //   const messages = document.getElementById('chat_left_text');
    //   messages.insertAdjacentHTML('afterbegin', html);
    // }
    const html = `<p>${data.content.message}</p>`;
    const messages = document.getElementById('chat_left_text');
    const newMessage = document.getElementById('chat_message');
    messages.insertAdjacentHTML('afterbegin', html);
    newMessage.value='';
  }
});
