import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hankalis_clan/const.dart';
import 'package:hankalis_clan/controller/homepage_controller.dart';
import 'package:hankalis_clan/controller/side_bar_controller.dart';
import 'package:hankalis_clan/screens/friends_side_bar.dart';
import 'package:hankalis_clan/widgets/mini_side_bar_item.dart';
import 'package:hankalis_clan/screens/side_bar.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    Get.find<HomepageController>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: scaffoldKey,
      drawer: Drawer(child: SideBar()),
      body: LayoutBuilder(
        builder:
            (context, constraints) => Padding(
              padding:
                  checkDeviceSize() == DeviceType.mobile
                      ? EdgeInsets.all(0)
                      : EdgeInsets.only(
                        top: 15,
                        right: 15,
                        bottom: 15,
                        left: Get.width < 1100 ? 15 : 0,
                      ),
              child: Row(
                children: [
                  GetBuilder<SideBarController>(
                    builder:
                        (controller) => AnimatedContainer(
                          duration: Duration(milliseconds: 250),
                          width:
                              Get.width < 1100
                                  ? 0
                                  : controller.isSideBarOpen
                                  ? 300
                                  : 60,
                          padding: EdgeInsets.only(
                            top: 10,
                            left: 10,
                            right: 10,
                          ),
                          child:
                              Get.width < 1100
                                  ? SizedBox()
                                  : controller.isSideBarOpen
                                  ? SideBar()
                                  : ListView(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(top: 8),
                                        child: MouseRegion(
                                          cursor: SystemMouseCursors.click,
                                          child: GestureDetector(
                                            onTap:
                                                () =>
                                                    controller.toggleSideBar(),
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
                                      const SizedBox(height: 30),
                                      MiniSideBarItem(
                                        itemName: '../assets/chat.png',
                                        index: 0,
                                      ),
                                      const SizedBox(height: 15),
                                      MiniSideBarItem(
                                        itemName: "../assets/video-game.png",
                                        index: 1,
                                      ),
                                      const SizedBox(height: 15),
                                      MiniSideBarItem(
                                        itemName: "../assets/ranking.png",
                                        index: 2,
                                      ),
                                      const SizedBox(height: 15),
                                      MiniSideBarItem(
                                        itemName: "../assets/earth.png",
                                        index: 3,
                                      ),
                                    ],
                                  ),
                        ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: theme.onSecondary,
                        borderRadius: BorderRadius.only(
                          topLeft:
                              checkDeviceSize() == DeviceType.mobile
                                  ? Radius.circular(0)
                                  : Radius.circular(10),
                          bottomLeft:
                              checkDeviceSize() == DeviceType.mobile
                                  ? Radius.circular(0)
                                  : Radius.circular(10),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            checkDeviceSize() == DeviceType.mobile
                                ? GetBuilder<SideBarController>(
                                  builder:
                                      (controller) =>
                                          controller.selectedItem == 0
                                              ? Expanded(
                                                child: Container(
                                                  constraints: BoxConstraints(
                                                    maxWidth: 400,
                                                  ),
                                                  child: FriendsSideBar(),
                                                ),
                                              )
                                              : SizedBox(),
                                )
                                : SizedBox(),
                            GetBuilder<SideBarController>(
                              builder:
                                  (controller) =>
                                      controller.handleSideBarScreens(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 250),
                    width: checkDeviceSize() == DeviceType.mobile ? 0 : 300,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: theme.onPrimaryContainer,
                          style: BorderStyle.solid,
                        ),
                      ),
                      color: theme.onInverseSurface,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: FriendsSideBar(),
                  ),
                ],
              ),
            ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: LayoutBuilder(
        builder:
            (context, constraints) =>
                Get.width < 1100
                    ? Container(
                      margin: EdgeInsets.only(top: 20),
                      child: FloatingActionButton(
                        backgroundColor: theme.onPrimary,
                        onPressed: () => scaffoldKey.currentState!.openDrawer(),
                        child: Icon(
                          Icons.menu,
                          color: theme.onSecondaryContainer,
                        ),
                      ),
                    )
                    : SizedBox(),
      ),
    );
  }
}
