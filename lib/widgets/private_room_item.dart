import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hankalis_clan/const.dart';
import 'package:hankalis_clan/model/private_room.dart';
import 'package:hankalis_clan/views/chat_view.dart';

class PrivateRoomItem extends StatelessWidget {
  const PrivateRoomItem({super.key, required this.room, required this.index});

  final PrivateRoom room;
  final int index;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: Material(
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: ListTile(
                onTap: () {
                  if (checkDeviceSize() == DeviceType.mobile) {
                    Get.to(() => ChatView());
                  }
                },
                title: Text(room.name, style: TextStyle(fontSize: 14)),
                subtitle: Text(
                  "message: ",
                  style: TextStyle(
                    color: theme.onSecondaryContainer,
                    fontSize: 10,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                leading: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  child:
                      room.photoUrl != null
                          ? CachedNetworkImage(
                            height: 40,
                            width: 40,
                            imageUrl: room.photoUrl!,
                            placeholder:
                                (context, url) => CircularProgressIndicator(),
                            errorWidget:
                                (context, url, error) => Icon(Icons.error),
                          )
                          : Image.asset(
                            "assets/user.png",
                            height: 40,
                            width: 40,
                          ),
                ),
                trailing:
                    -1 < 0
                        ? SizedBox()
                        : SizedBox(
                          height: 20,
                          child: CircleAvatar(
                            backgroundColor: Color.fromRGBO(62, 220, 120, 1),
                            child: Text(
                              "0".toString(),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
              ),
            ),
          ),
        ),
        SizedBox(height: 1),
      ],
    );
  }
}
