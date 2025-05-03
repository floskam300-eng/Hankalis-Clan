import 'package:socket_io_client/socket_io_client.dart';

class FriendsService {
  final Socket socket;

  FriendsService(this.socket);

  void emitFriendRequest(String userId, String friendId) {
    socket.emit("friend_request", {
      "userId": userId,
      "friendId": friendId,
    });
  }

  void onFriendRemoveRequest(Function(dynamic) callback) {
    socket.on("friend_removed", callback);
  }

  void emitFriendRemoveRequest(Map<String, dynamic> callback) {
    socket.emit("remove_friend", callback);
  }

  void onFriendDeclineRequest(Function(dynamic) callback) {
    socket.on("friend_request_declined", callback);
  }

  void emitFriendDeclineRequest(Map<String, dynamic> callback) {
    socket.emit("decline_friend_request", callback);
  }

  void emitFriendAcceptRequest(Map<String, dynamic> callback) {
    socket.emit("accept_friend_request", callback);
  }

  void onFriendAcceptRequest(Function(dynamic) callback) {
    socket.on("friend_request_accepted", callback);
  }

  void emitFriendCancelRequest(Map<String, dynamic> callback) {
    socket.emit("cancel_friend_request", callback);
  }

  void onFriendCancelRequest(Function(dynamic) callback) {
    socket.on("friend_request_canceled", callback);
  }

  void onFriendRequestSent(Function(dynamic) callback) {
    socket.on("friend_request_sent", callback);
  }

  void onFriendRequestReceived(Function(dynamic) callback) {
    socket.on("friend_request_received", callback);
  }

  void onFriendsList(Function(dynamic) callback) {
    socket.on("friends", callback);
  }

  void emitFriendsList(String userId) {
    socket.emit("friends", userId);
  }

  void emitRequestsReceived(String userId) {
    socket.emit("requests_received", userId);
  }

  void onRequestsReceived(Function(dynamic) callback) {
    socket.on("requests_received", callback);
  }

  void emitRequests(String userId) {
    socket.emit("requests", userId);
  }

  void onRequests(Function(dynamic) callback) {
    socket.on("requests", callback);
  }
}