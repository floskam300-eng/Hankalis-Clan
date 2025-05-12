import 'dart:typed_data';

class PublicRoom {
  final String id, name, description, type, admin;
  final Uint8List picture;
  final List participants;

  PublicRoom({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    required this.admin,
    required this.picture,
    required this.participants,
  });
}
