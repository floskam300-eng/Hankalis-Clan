import 'package:socket_io_client/socket_io_client.dart';
import 'package:hankalis_clan/model/message.dart' as message_model;

class Message {
  final Socket socket;

  Message(this.socket);

  void sendMessage(message_model.Message message) {
    socket.emit("send_message", message);
  }
}
