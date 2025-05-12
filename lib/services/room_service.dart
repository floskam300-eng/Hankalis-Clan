import 'package:socket_io_client/socket_io_client.dart';

class RoomService {
  final Socket socket;

  RoomService(this.socket);

  void onRoomCreated(Function(dynamic) callback) {
    socket.on("private_room_created", callback);
  }

  void onPrivateRooms(Function(dynamic) callback) {
    socket.on("rooms", callback);
  }

  void emitPrivateRooms(String userId) {
    socket.emit("private_rooms", userId);
  }

  void onCreatePublicRoom(Function(dynamic) callback) {
    socket.on("public_room_created", callback);
  }

  void onPublicRooms(Function(dynamic) callback) {
    socket.on("public_rooms", callback);
  }

  void emitPublicRooms(String userId) {
    socket.emit("public_rooms", userId);
  }

  void emitCreatePublicRoom(Map<String, dynamic> roomData) {
    socket.emit("create_public_room", roomData);
  }

  void emitFriends(String userId) {
    socket.emit("friends", userId);
  }

  void onFriends(Function(dynamic) callback) {
    socket.on("friends", callback);
  }
}
