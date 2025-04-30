import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hankalis_clan/const.dart';
import 'package:hankalis_clan/controller/side_bar_controller.dart';
import 'package:hankalis_clan/model/chat.dart';
import 'package:hankalis_clan/views/chat_view.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({
    super.key,
    required this.name,
    required this.lastMsgs,
    required this.image,
    required this.numOfMsgs,
    required this.index,
  });

  final String name, lastMsgs, image;
  final int numOfMsgs, index;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SideBarController>();
    final isSelected = controller.selectedChat == index;
    final theme = Theme.of(context).colorScheme;
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: Material(
        color: isSelected ? theme.onPrimaryContainer : Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: ListTile(
            onTap: () {
              controller.setSelectedChat(
                index,
                Chat(
                  name: name,
                  avatarUrl: image,
                  message: lastMsgs,
                  numOfMsgs: numOfMsgs,
                ),
              );
              if (checkDeviceSize() == DeviceType.mobile) {
                Get.to(() => ChatView());
              }
            },
            title: Text(name, style: TextStyle(fontSize: 14)),
            subtitle: Text(
              lastMsgs,
              style: TextStyle(color: theme.onSecondaryContainer, fontSize: 10),
            ),
            leading: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(100)),
              child: Image.asset(image, height: 40, width: 40),
            ),
            trailing:
                numOfMsgs < 0
                    ? SizedBox()
                    : SizedBox(
                      height: 20,
                      child: CircleAvatar(
                        backgroundColor: Color.fromRGBO(62, 220, 120, 1),
                        child: Text(
                          numOfMsgs.toString(),
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
    );
  }
}
