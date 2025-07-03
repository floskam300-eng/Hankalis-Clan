import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hankalis_clan/controller/chats_controller.dart';
import 'package:hankalis_clan/controller/side_bar_controller.dart';
import 'package:hankalis_clan/model/scroll_behavior.dart';
import 'package:hankalis_clan/widgets/attachment_item.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';

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
                                    Container(
                                      margin: EdgeInsets.only(bottom: 5),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  "11:00 AM",
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                    fontSize: 11.0,
                                                    color: Colors.grey.shade600,
                                                  ),
                                                ),
                                                SizedBox(width: 5),
                                                Icon(
                                                  Icons.done_all,
                                                  color: Color(0xFF1B97F3),
                                                  size: 15.0,
                                                ),
                                              ],
                                            ),
                                            Bubble(
                                              margin: BubbleEdges.only(top: 10),
                                              nip: BubbleNip.rightTop,
                                              color: theme.onTertiary,
                                              child: Text(
                                                'Hello, World!',
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w100,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(bottom: 5),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "11:00 AM",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontSize: 11.0,
                                                color: Colors.grey.shade600,
                                              ),
                                            ),
                                            Bubble(
                                              margin: BubbleEdges.only(top: 10),
                                              color: theme.onPrimaryContainer,
                                              nip: BubbleNip.leftTop,
                                              child: Text(
                                                'Hi, developer!',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w100,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                "11:00 AM",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontSize: 11.0,
                                                  color: Colors.grey.shade600,
                                                ),
                                              ),
                                              SizedBox(width: 5),
                                              Icon(
                                                Icons.done_all,
                                                color: Color(0xFF1B97F3),
                                                size: 15.0,
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 5),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 5),
                                            child: Card(
                                              elevation: 20,
                                              shape: BeveledRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Container(
                                                padding: EdgeInsets.all(5),
                                                constraints: BoxConstraints(
                                                  maxWidth: Get.width * 0.25,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: theme.onTertiary,
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              20,
                                                            ),
                                                        child: Image.asset(
                                                          "../../assets/test_background.jpg",
                                                        ),
                                                      ),
                                                      Visibility(
                                                        visible: true,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets.all(
                                                                8.0,
                                                              ),
                                                          child: Text(
                                                            "This is Pretty View.",
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 16.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w100,
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
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "11:00 AM",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontSize: 11.0,
                                              color: Colors.grey.shade600,
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 5),
                                            child: Card(
                                              elevation: 20,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Container(
                                                padding: EdgeInsets.all(5),
                                                constraints: BoxConstraints(
                                                  maxWidth: Get.width * 0.25,
                                                ),
                                                decoration: BoxDecoration(
                                                  color:
                                                      theme.onPrimaryContainer,
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              20,
                                                            ),
                                                        child: Image.asset(
                                                          "../../assets/my_photo.jpg",
                                                        ),
                                                      ),
                                                      Visibility(
                                                        visible: true,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets.all(
                                                                8.0,
                                                              ),
                                                          child: Text(
                                                            "You Are Pretty.",
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 16.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w100,
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
                                                      onTap: () {},
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
                                  Expanded(
                                    child: TextFormField(
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
