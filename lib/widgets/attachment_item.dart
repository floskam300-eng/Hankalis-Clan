import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hankalis_clan/controller/chats_controller.dart';
import 'package:hankalis_clan/controller/animations_controller.dart';

class AttachmentItem extends StatelessWidget {
  const AttachmentItem({
    super.key,
    required this.title,
    required this.icon,
    required this.index,
    required this.onTap,
  });

  final String title;
  final IconData icon;
  final int index;

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final chatsController = Get.find<ChatsController>();
    return GetBuilder<AnimationsController>(
      builder: (controller) {
        final isEntered =
            controller.isEntered && chatsController.attachmentIndex == index;
        return MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (event) {
            controller.isEntered = true;
            chatsController.attachmentIndex = index;
          },
          onExit: (event) {
            controller.isEntered = false;
            chatsController.attachmentIndex = -1;
          },
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              height: 30,
              width: double.infinity,
              decoration: BoxDecoration(
                color: isEntered ? theme.onPrimaryContainer : theme.onSecondary,
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 10),
                  Icon(icon, size: 20),
                  SizedBox(width: 10),
                  Text(title),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
