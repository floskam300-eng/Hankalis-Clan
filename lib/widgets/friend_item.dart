import 'package:flutter/material.dart';

class FriendItem extends StatelessWidget {
  const FriendItem({
    super.key,
    required this.name,
    required this.id,
    required this.picture,
  });

  final String name, id, picture;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        onTap: () {},
        title: Text(name),
        subtitle: Text(
          "ID: $id",
          style: TextStyle(color: Colors.grey, fontSize: 12),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        leading: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: Image.network(picture),
        ),
      ),
    );
  }
}
