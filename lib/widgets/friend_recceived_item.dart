import 'package:flutter/material.dart';

class FriendRecceivedItem extends StatelessWidget {
  const FriendRecceivedItem({
    super.key,
    required this.id,
    required this.name,
    this.picture,
    this.onAccept,
    this.onDecline,
  });

  final String? picture;
  final String id, name;
  final void Function()? onAccept;
  final void Function()? onDecline;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Card(
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        title: Text(name),
        subtitle: Text(
          "ID: $id",
          style: TextStyle(color: Colors.grey, fontSize: 12),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Container(
          decoration: BoxDecoration(
            color: theme.onPrimary,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border(right: BorderSide(color: theme.onSecondary)),
                ),
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: onAccept,
                    child: Icon(Icons.check, color: Colors.green),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: onDecline,
                    child: Icon(Icons.close, color: Colors.red),
                  ),
                ),
              ),
            ],
          ),
        ),
        leading: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child:
              picture == null
                  ? Image.asset("assets/user.png")
                  : Image.network(picture!),
        ),
      ),
    );
  }
}
