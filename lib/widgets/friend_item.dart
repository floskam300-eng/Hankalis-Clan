import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class FriendItem extends StatelessWidget {
  const FriendItem({
    super.key,
    required this.name,
    required this.id,
    this.picture,
    this.onTap,
  });

  final String name, id;
  final String? picture;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Card(
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        trailing: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: theme.onPrimary,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Icon(Icons.person_remove, color: Colors.red),
            ),
          ),
        ),
        title: Text(name),
        subtitle: Text(
          "ID: $id",
          style: TextStyle(color: Colors.grey, fontSize: 12),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        leading: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child:
              picture == null
                  ? Image.asset("assets/user.png")
                  : CachedNetworkImage(
                    imageUrl: picture!,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget:
                        (context, url, error) => Image.asset("assets/user.png"),
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
        ),
      ),
    );
  }
}
