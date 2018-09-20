$(document).on('turbolinks:load', function (){
    chat_windows_count = $(".conversation-window").length;
    if(gon.last_visible_chat_window == null && chat_windows_count > 0){
        gon.last_visible_chat_window = chat_windows_count
    }

    if(gon.hidden_chats == null){
        gon.hidden_chats = 0
    }

    window.addEventListener('resize', hideShowChatWindow);

    positionChatWindows();
    hideShowChatWindow();
})

function positionChatWindows(){
    chat_windows_count = $('.conversation-window').length

    if (gon.hidden_chats + gon.last_visible_chat_window !== chat_windows_count) {
        if (gon.hidden_chats == 0) {
            gon.last_visible_chat_window = chat_windows_count;
        }
    }

    for (i = 0; i < chat_windows_count; i++ ) {
        var right_position = i * 410;
        var chat_window = i + 1;
        $('.conversation-window:nth-of-type(' + chat_window + ')')
            .css('right', '' + right_position + 'px');
    }

}

const hideShowChatWindow = () => {
    if ($('.conversation-window').length < 1) {
        return;
    }

    var offset = $('.conversation-window:nth-of-type(' + gon.last_visible_chat_window + ')').offset();

    if (offset.left < 50 && gon.last_visible_chat_window !== 1) {
        $('.conversation-window:nth-of-type(' + gon.last_visible_chat_window + ')')
            .css('display', 'none');
        gon.hidden_chats++;
        gon.last_visible_chat_window--;
    }

    if (offset.left > 550 && gon.hidden_chats !== 0) {
        gon.hidden_chats--;
        gon.last_visible_chat_window++;
        $('.conversation-window:nth-of-type(' + gon.last_visible_chat_window + ')')
            .css('display', 'initial');
    }
}