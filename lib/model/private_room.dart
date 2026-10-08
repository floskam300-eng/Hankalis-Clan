class PrivateRoom {
  final String id, name, type;
  final String? picture;

  PrivateRoom({
    required this.id,
    required this.name,
    this.picture,
    required this.type,
  });
}
