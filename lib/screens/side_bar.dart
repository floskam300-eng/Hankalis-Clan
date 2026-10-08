// ignore_for_file: deprecated_member_use
import 'dart:html' as html;

import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import "package:get/get.dart";
import "package:hankalis_clan/const.dart";
import "package:hankalis_clan/controller/homepage_controller.dart";
import "package:hankalis_clan/controller/side_bar_controller.dart";
import "package:hankalis_clan/main.dart";
import "package:hankalis_clan/widgets/change_themes_buttons.dart";
import "package:hankalis_clan/widgets/side_bar_item.dart";
import "package:toastification/toastification.dart";

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final HomepageController homepageController = Get.find();
    return Padding(
      padding:
          Get.width < 1100 ? const EdgeInsets.all(15) : const EdgeInsets.all(0),
      child: GetBuilder<SideBarController>(
        builder:
            (controller) => Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    height: 400,
                    child: ListView(
                      children: [
                        ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(
                              "../assets/hankalis_logo.webp",
                              height: 40,
                              width: 40,
                            ),
                          ),
                          title: Text(
                            "Hankalis Clan",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          trailing:
                              checkDeviceSize() == DeviceType.mobile
                                  ? SizedBox()
                                  : Container(
                                    margin: EdgeInsets.only(top: 8),
                                    child: MouseRegion(
                                      cursor: SystemMouseCursors.click,
                                      child: GestureDetector(
                                        onTap: () => controller.toggleSideBar(),
                                        child: SvgPicture.asset(
                                          "../assets/side_bar.svg",
                                          height: 30,
                                          width: 30,
                                          colorFilter: ColorFilter.mode(
                                            theme.onSecondaryContainer,
                                            BlendMode.srcIn,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                        ),
                        const SizedBox(height: 20),
                        SideBarItem(
                          itemName: "Chats",
                          icon: "../assets/chat.png",
                          index: 0,
                        ),
                        SizedBox(height: 10),
                        SideBarItem(
                          itemName: "Games",
                          icon: "../assets/video-game.png",
                          index: 1,
                        ),
                        SizedBox(height: 10),
                        SideBarItem(
                          itemName: "Leaderboard",
                          icon: "../assets/ranking.png",
                          index: 2,
                        ),
                        SizedBox(height: 10),
                        SideBarItem(
                          itemName: "News & Activities",
                          icon: "../assets/earth.png",
                          index: 3,
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: 230,
                    child: Column(
                      children: [
                        Expanded(child: SizedBox()),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: theme.onSecondary,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                blurRadius: 20,
                                spreadRadius: 2,
                                offset: Offset(0, 20),
                              ),
                            ],
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ListTile(
                                title: Text(
                                  homepageController.user['name'],
                                  style: TextStyle(fontSize: 14),
                                ),
                                subtitle: Text(
                                  homepageController.user['email'],
                                  style: TextStyle(fontSize: 10),
                                ),
                                trailing: Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    color: Color.fromRGBO(62, 220, 120, 1),
                                  ),
                                  child: Text(
                                    "  ${homepageController.user['role']}  ",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child:
                                      homepageController.user['photoUrl'] !=
                                              null
                                          ? CachedNetworkImage(
                                            height: 40,
                                            width: 40,
                                            imageUrl:
                                                homepageController
                                                    .user['photoUrl'],
                                            placeholder:
                                                (context, url) =>
                                                    CircularProgressIndicator(),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Image.asset(
                                                      "assets/user.png",
                                                    ),
                                          )
                                          : Image.asset(
                                            "../assets/user.png",
                                            height: 40,
                                            width: 40,
                                          ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: () async {
                                    await storage.remove("token");
                                    html.window.location.href = '/';
                                    toastification.show(
                                      title: Text("Token removed!"),
                                      type: ToastificationType.success,
                                      style: ToastificationStyle.fillColored,
                                      autoCloseDuration: const Duration(
                                        seconds: 5,
                                      ),
                                    );
                                  },
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color:
                                            Theme.of(
                                              context,
                                            ).colorScheme.onPrimaryContainer,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                    child: Center(child: Text("Edit profile")),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          padding: EdgeInsets.all(5),
                          height: 50,
                          decoration: BoxDecoration(
                            color: theme.onSecondary,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: ChangeThemesButtons(
                                  title: "Dark",
                                  icon: Icons.dark_mode_outlined,
                                  index: 0,
                                ),
                              ),
                              Expanded(
                                child: ChangeThemesButtons(
                                  title: "Light",
                                  icon: Icons.light_mode,
                                  index: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
      ),
    );
  }
}
