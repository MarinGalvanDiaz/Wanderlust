/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


function ChatWidget(pusher) {
    var self = this;
    this.pusher = pusher;
    this.channelName = "my-channel";
    this.chatContainer = $(".chat-widget");
    this.messageContainer = $(".chat-messages");
    this.chatName = $(".chat-name");
    this.chatEntry = $(".chat-entry");
    this.idUsu2 = $(".idUsu2");

    this.channel = this.pusher.subscribe(this.channelName);

    this._latestMessages();
    
    this.channel.bind('new-message',function(data){
        self._displayMessage(data);
    });
    
    this.chatEntry.keydown(function (e){
        if(e.keyCode === 13){
            e.preventDefault();
            self._sendMessage({
                name: self.chatName.val(),
                message: self.chatEntry.val()
                
            });
            self.chatEntry.val("");
        }
    });
    
}
;

ChatWidget.prototype._latestMessages = function(){
    var self = this;
    $.ajax({
        url: "LastMessages",
        dataType: 'json',
        type: 'get',
        success: function (data) {
            $.each(data,function(i,message){
                self._displayMessage(message);
            });
        }
    });
};

ChatWidget.prototype._displayMessage = function(message){
    var m = '<li class="left clearfix"><span class="chat-img pull-left"><img src=""/></span><div class="chat-body clear-fix"><div class="header"><strong class="primary-font">'+message.usuario+'</strong><small class="pull-right text-muted"><span class="glyphicon glyphicon-time"></span>'+message.fecha+'</small></div><p>'+message.mensaje+'</p></div></li>';
    this.messageContainer.prepend(m);
};


ChatWidget.prototype._sendMessage = function (message) {
    $.ajax({
       url: 'create',
        type: 'POST',
        data: {
            message: message.message,
            name: message.name
        },
        success: function (data) {
            
        }
    });
};
