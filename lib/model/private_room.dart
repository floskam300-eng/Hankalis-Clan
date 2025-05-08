class PrivateRoom {
  final String id, name, type;
  final String? photoUrl;

  PrivateRoom({
    required this.id,
    required this.name,
    this.photoUrl,
    required this.type,
  });
}
