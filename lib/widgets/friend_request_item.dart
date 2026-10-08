import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class FriendRequestItem extends StatelessWidget {
  const FriendRequestItem({
    super.key,
    required this.id,
    required this.name,
    this.picture,
    this.onTap,
  });

  final String? picture;
  final String id, name;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        title: Text(name, style: TextStyle(fontSize: 14)),
        subtitle: Text(
          "ID: $id",
          style: TextStyle(color: Colors.grey, fontSize: 12),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Text(
                "Cancel",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ),
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
