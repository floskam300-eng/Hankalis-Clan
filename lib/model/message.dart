class Message {
  final String roomId;
  final String senderId;
  final String text;
  final String? attachment;
  final bool seen;
  final bool delivered;

  Message({
    required this.roomId,
    required this.senderId,
    required this.text,
    this.attachment,
    this.seen = false,
    this.delivered = false,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      roomId: json['roomId'] as String,
      senderId: json['senderId'] as String,
      text: json['text'] as String,
      attachment: json['attachment'] as String?,
      seen: json['seen'] as bool? ?? false,
      delivered: json['delivered'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'roomId': roomId,
      'senderId': senderId,
      'text': text,
      'attachment': attachment,
      'seen': seen,
      'delivered': delivered,
    };
  }
}
