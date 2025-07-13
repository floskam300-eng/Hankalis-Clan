import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hankalis_clan/controller/chats_controller.dart';
import 'package:hankalis_clan/controller/side_bar_controller.dart';
import 'package:hankalis_clan/model/scroll_behavior.dart';
import 'package:hankalis_clan/widgets/attachment_item.dart';
import 'package:hankalis_clan/widgets/document_message_receive.dart';
import 'package:hankalis_clan/widgets/document_message_send.dart';
import 'package:hankalis_clan/widgets/emojis_widget.dart';
import 'package:hankalis_clan/widgets/photo_message_receive.dart';
import 'package:hankalis_clan/widgets/video_message_receive.dart';
import 'package:hankalis_clan/widgets/video_message_send.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';
import 'package:hankalis_clan/widgets/message_send.dart';
import 'package:hankalis_clan/widgets/message_receive.dart';
import 'package:hankalis_clan/widgets/photo_message_send.dart';

class Chats extends StatelessWidget {
  const Chats({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final chatsController = Get.find<ChatsController>();
    return GetBuilder<SideBarController>(
      builder:
          (controller) => Expanded(
            child: Column(
              children: [
                Container(
                  height: 80,
                  padding: EdgeInsets.all(15),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: theme.onPrimary,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 50,
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.all(
                                Radius.circular(100),
                              ),
                              child: Image.asset("../../assets/my_photo.jpg"),
                            ),
                            Visibility(
                              visible: true,
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                  height: 10,
                                  width: 10,
                                  margin: const EdgeInsets.only(
                                    right: 2,
                                    bottom: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(100),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Omar Elshamy",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Online",
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      Expanded(child: SizedBox()),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: theme.onSecondary,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: Center(
                              child: Image.asset(
                                "../../assets/more.png",
                                color: Colors.grey.shade200,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: ScrollConfiguration(
                            behavior: NoScrollbarBehavior(),
                            child: WebSmoothScroll(
                              controller: chatsController.scrollController,
                              child: SingleChildScrollView(
                                physics: NeverScrollableScrollPhysics(),
                                controller: chatsController.scrollController,
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(bottom: 5),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Divider(
                                              color: theme.onPrimaryContainer,
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          Bubble(
                                            color: theme.onPrimaryContainer,
                                            child: Text(
                                              'TODAY',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(fontSize: 11.0),
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          Expanded(
                                            child: Divider(
                                              color: theme.onPrimaryContainer,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    MessageSend(
                                      time: "12:25 AM",
                                      message: "Hello 7mod!",
                                    ),
                                    MessageReceive(
                                      time: "4:72 PM",
                                      message: "I'm Fine!",
                                    ),
                                    PhotoMessageSend(
                                      asset: "../../assets/test_background.jpg",
                                      message: "This is Pretty View.",
                                      time: "01:46 AM",
                                    ),
                                    PhotoMessageReceive(
                                      message: "You are Awesome!",
                                      time: "05:57 PM",
                                      asset: "../../assets/my_photo.jpg",
                                    ),
                                    VideoMessageReceive(
                                      time: "09:30 AM",
                                      message: "You are so fucking cool!",
                                      asset: "../../assets/play-button.png",
                                      index: 0,
                                    ),
                                    VideoMessageSend(
                                      time: "7:35 PM",
                                      message: "Finally I'm here!",
                                      asset: "../../assets/play-button.png",
                                      index: 1,
                                    ),
                                    DocumentMessageSend(
                                      time: "7:35 PM",
                                      message: "Finally Thanks!",
                                      asset: "../../assets/my_video_2.mp4",
                                    ),
                                    DocumentMessageReceive(
                                      time: "7:35 PM",
                                      message: "Wow! You are so cool!",
                                      asset: "../../assets/my_photo.jpg",
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: const <BoxShadow>[
                              BoxShadow(
                                color: Colors.black26,
                                spreadRadius: 0.0,
                                blurRadius: 15.0,
                              ),
                            ],
                          ),
                          child: Card(
                            color: theme.onPrimary,
                            child: SizedBox(
                              width: double.infinity,
                              height: 60,
                              child: Row(
                                children: [
                                  OverlayPortal(
                                    controller:
                                        chatsController.overlayPortalController,
                                    overlayChildBuilder: (context) {
                                      final RenderBox renderBox =
                                          chatsController
                                                  .attachmentKey
                                                  .currentContext!
                                                  .findRenderObject()
                                              as RenderBox;
                                      final Offset offset = renderBox
                                          .localToGlobal(Offset.zero);
                                      return Stack(
                                        children: [
                                          Positioned.fill(
                                            child: GestureDetector(
                                              onTap: () {
                                                chatsController
                                                    .overlayPortalController
                                                    .hide();
                                              },
                                              behavior: HitTestBehavior.opaque,
                                            ),
                                          ),
                                          Positioned(
                                            top: offset.dy - 115,
                                            left: offset.dx,
                                            child: Material(
                                              elevation: 10,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(5),
                                              ),
                                              child: Container(
                                                width: 150,
                                                padding: EdgeInsets.all(5),
                                                decoration: BoxDecoration(
                                                  color: theme.onSecondary,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                        Radius.circular(5),
                                                      ),
                                                ),
                                                child: Column(
                                                  children: [
                                                    AttachmentItem(
                                                      title: "Photos",
                                                      icon:
                                                          Icons.photo_outlined,
                                                      index: 0,
                                                      onTap: () {
                                                        chatsController
                                                            .addAttachmentPhotos();
                                                        chatsController
                                                            .overlayPortalController
                                                            .hide();
                                                      },
                                                    ),
                                                    SizedBox(height: 5),
                                                    AttachmentItem(
                                                      title: "Videos",
                                                      icon:
                                                          Icons
                                                              .video_file_outlined,
                                                      index: 1,
                                                      onTap: () {
                                                        chatsController
                                                            .addAttachmentVideos();
                                                        chatsController
                                                            .overlayPortalController
                                                            .hide();
                                                      },
                                                    ),
                                                    SizedBox(height: 5),
                                                    AttachmentItem(
                                                      title: "Documents",
                                                      icon:
                                                          Icons
                                                              .attach_file_outlined,
                                                      index: 2,
                                                      onTap: () {
                                                        chatsController
                                                            .addAttachmentDocuments();
                                                        chatsController
                                                            .overlayPortalController
                                                            .hide();
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                  MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: GestureDetector(
                                      onTap:
                                          () =>
                                              chatsController
                                                  .overlayPortalController
                                                  .show(),
                                      child: Container(
                                        key: chatsController.attachmentKey,
                                        margin: EdgeInsets.all(10),
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          color: theme.onSecondary,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                        child: Center(
                                          child: Icon(Icons.add, size: 20),
                                        ),
                                      ),
                                    ),
                                  ),
                                  EmojisWidget(
                                    newTop: 305,
                                    overlayPortalController:
                                        chatsController
                                            .emojisOverlayPortalController,
                                    emojisBtnKey: chatsController.attachmentKey,
                                    onEmojiSelected:
                                        (category, emoji) => chatsController
                                            .onEmojiSelected(emoji),
                                  ),
                                  MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: GestureDetector(
                                      onTap:
                                          () =>
                                              chatsController
                                                  .emojisOverlayPortalController
                                                  .show(),
                                      child: Container(
                                        margin: EdgeInsets.only(
                                          bottom: 10,
                                          top: 10,
                                          right: 10,
                                        ),
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          color: theme.onSecondary,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                        child: Center(
                                          child: Icon(
                                            Icons.emoji_emotions_outlined,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      controller: chatsController.controller,
                                      decoration: InputDecoration(
                                        hintText: "Type a message...",
                                        hintStyle: TextStyle(
                                          color: Colors.grey.shade600,
                                        ),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    child: MouseRegion(
                                      cursor: SystemMouseCursors.click,
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          height: 40,
                                          width: 80,
                                          decoration: BoxDecoration(
                                            color: theme.onTertiary,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                          ),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text("Send"),
                                              SizedBox(width: 5),
                                              Icon(Icons.send, size: 20),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
    );
  }
}
