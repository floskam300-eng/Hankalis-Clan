import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hankalis_clan/const.dart';
import 'package:hankalis_clan/controller/side_bar_controller.dart';
import 'package:hankalis_clan/widgets/custom_icon.dart';
import 'package:hankalis_clan/widgets/message_field.dart';

class Chats extends StatelessWidget {
  const Chats({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return GetBuilder<SideBarController>(
      builder:
          (controller) => Expanded(
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomIcon(icon: Icons.chat),
                            SizedBox(width: 10),
                            CustomIcon(icon: Icons.video_call),
                            SizedBox(width: 10),
                            CustomIcon(icon: Icons.phone),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(color: theme.onPrimaryContainer),
                Expanded(
                  child: Padding(
                    padding:
                        checkDeviceSize() == DeviceType.mobile
                            ? EdgeInsets.all(0)
                            : EdgeInsets.all(20),
                    child: Column(children: [
                        
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(child: MessageField()),
                    SizedBox(width: 10),
                    CustomIcon(icon: Icons.send),
                  ],
                ),
              ],
            ),
          ),
    );
  }
}
