import 'package:bubble/bubble.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hankalis_clan/const.dart';
import 'package:hankalis_clan/controller/side_bar_controller.dart';
import 'package:hankalis_clan/widgets/custom_icon.dart';
import 'package:hankalis_clan/widgets/message_field.dart';
import 'package:chat_bubbles/chat_bubbles.dart';

class Chats extends StatelessWidget {
  const Chats({super.key});

  @override
  Widget build(BuildContext context) {
    final Duration duration = Duration(seconds: 10);
    final Duration position = Duration(seconds: 5);
    final bool isPlaying = false;
    final bool isLoading = false;
    final bool isPause = true;
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
                        child: ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child:
                                controller.selectedChatData.avatarUrl != null
                                    ? CachedNetworkImage(
                                      height: 40,
                                      width: 40,
                                      imageUrl:
                                          controller
                                              .selectedChatData
                                              .avatarUrl!,
                                      placeholder:
                                          (context, url) =>
                                              CircularProgressIndicator(),
                                      errorWidget:
                                          (context, url, error) =>
                                              Icon(Icons.error),
                                    )
                                    : Image.asset(
                                      'assets/user.png',
                                      height: 40,
                                      width: 40,
                                    ),
                          ),
                          title: Text(
                            overflow: TextOverflow.ellipsis,
                            controller.selectedChatData.name,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
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
                    child: Column(
                      children: [
                        Bubble(
                          alignment: Alignment.center,
                          color: theme.onPrimary,
                          child: Text(
                            'YASTERDAY',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 11.0),
                          ),
                        ),
                        ...controller
                            .getChats(controller.selectedChatData)[controller
                                .selectedChat]
                            .map(
                              (e) =>
                                  e['isSender']
                                      ? Bubble(
                                        margin: BubbleEdges.only(top: 10),
                                        alignment: Alignment.topRight,
                                        nip: BubbleNip.rightTop,
                                        color: Color(0xFF1B97F3),
                                        child: Text(
                                          e['message'],
                                          textAlign: TextAlign.right,
                                        ),
                                      )
                                      : Bubble(
                                        margin: BubbleEdges.only(top: 10),
                                        alignment: Alignment.topLeft,
                                        color: Color(0xFFE8E8EE),
                                        nip: BubbleNip.leftTop,
                                        child: Text(
                                          e['message'],
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ),
                            ),
                        Bubble(
                          margin: BubbleEdges.only(top: 10),
                          alignment: Alignment.center,
                          nip: BubbleNip.no,
                          color: theme.onPrimary,
                          child: Text(
                            'TODAY',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 11.0),
                          ),
                        ),
                        controller.selectedChat == 1
                            ? BubbleNormalImage(
                              id: 'id001',
                              image: Image.asset(
                                '../assets/cannot_see.png',
                                height: 200,
                              ),
                              color: Color(0xFFE8E8EE),
                              tail: true,
                              delivered: true,
                              isSender: false,
                            )
                            : SizedBox(),
                        controller.selectedChat == 2
                            ? BubbleNormalAudio(
                              constraints: BoxConstraints(maxWidth: 300),
                              color: Color(0xFFE8E8EE),
                              duration: duration.inSeconds.toDouble(),
                              position: position.inSeconds.toDouble(),
                              isPlaying: isPlaying,
                              isLoading: isLoading,
                              isPause: isPause,
                              isSender: false,
                              tail: true,
                              seen: true,
                              onSeekChanged: (value) => debugPrint("$value"),
                              onPlayPauseButtonClick:
                                  () => debugPrint('onPlayPauseButtonClick'),
                              sent: true,
                            )
                            : SizedBox(),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: MessageField(
                      ),
                    ),
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
