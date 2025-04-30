import 'package:dynamic_tabbar/dynamic_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hankalis_clan/controller/firends_side_bar_controller.dart';
import 'package:hankalis_clan/controller/side_bar_controller.dart';
import 'package:hankalis_clan/services/services.dart';
import 'package:hankalis_clan/widgets/add_friend.dart';
import 'package:hankalis_clan/widgets/chat_item.dart';
import 'package:hankalis_clan/widgets/custom_buttons.dart';
import 'package:hankalis_clan/widgets/custom_icon.dart';
import 'package:hankalis_clan/widgets/friend_received.dart';
import 'package:hankalis_clan/widgets/friends.dart';
import 'package:toastification/toastification.dart';

class FriendsSideBar extends StatelessWidget {
  const FriendsSideBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final searchController = TextEditingController();
    final FirendsSideBarController friendsSideController =
        Get.find<FirendsSideBarController>();
    return GetBuilder<SideBarController>(
      builder:
          (controller) => Container(
            color: theme.onSecondary,
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    "Friends and Chats",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "this list of your friends and your Chats.",
                    style: TextStyle(
                      fontSize: 12,
                      color: theme.onSecondaryContainer,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                keyboardType: TextInputType.webSearch,
                                validator:
                                    (String? search) => friendsSideController
                                        .valideInputes(search!, InputType.name),
                                controller: searchController,
                                style: TextStyle(fontSize: 14),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                decoration: InputDecoration(
                                  hintText: "Search",
                                  hintStyle: TextStyle(
                                    color: theme.onPrimaryContainer,
                                    fontSize: 14,
                                  ),
                                  prefixIcon: Icon(Icons.search),
                                  prefixIconColor: theme.onPrimaryContainer,
                                  constraints: BoxConstraints(),
                                  fillColor: theme.onPrimary,
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            CustomIcon(
                              icon: Icons.person,
                              onTap: () {
                                Get.generalDialog(
                                  pageBuilder:
                                      (_, __, ___) => Container(
                                        margin: const EdgeInsets.symmetric(
                                          horizontal: 20,
                                        ),
                                        child: Center(
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(20),
                                            ),
                                            child: Container(
                                              height: 500,
                                              width: 400,
                                              decoration: BoxDecoration(
                                                color: theme.onSecondary,
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(20),
                                                ),
                                              ),
                                              child: Scaffold(
                                                backgroundColor:
                                                    Colors.transparent,
                                                body: SafeArea(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                          0.0,
                                                        ),
                                                    child: Column(
                                                      children: [
                                                        Expanded(
                                                          child: DynamicTabBarWidget(
                                                            labelColor:
                                                                theme
                                                                    .onTertiary,
                                                            indicatorColor:
                                                                theme
                                                                    .onTertiary,
                                                            dividerColor:
                                                                theme
                                                                    .onPrimaryContainer,
                                                            onTabControllerUpdated:
                                                                (p0) {
                                                                  debugPrint(
                                                                    "p0",
                                                                  );
                                                                },
                                                            dynamicTabs: [
                                                              TabData(
                                                                index: 0,
                                                                title: Tab(
                                                                  text:
                                                                      "Friends",
                                                                ),
                                                                content:
                                                                    Friends(),
                                                              ),
                                                              TabData(
                                                                index: 1,
                                                                title: Tab(
                                                                  text:
                                                                      "Add Friend",
                                                                ),
                                                                content:
                                                                    AddFriend(),
                                                              ),
                                                              TabData(
                                                                index: 2,
                                                                title: Tab(
                                                                  text:
                                                                      "Requests Received",
                                                                ),
                                                                content:
                                                                    FriendReceived(),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          height: 50,
                                                          decoration: BoxDecoration(
                                                            border: Border(
                                                              top: BorderSide(
                                                                color:
                                                                    theme
                                                                        .onPrimaryContainer,
                                                              ),
                                                            ),
                                                          ),
                                                          child: Center(
                                                            child: IconButton(
                                                              color:
                                                                  Colors
                                                                      .red
                                                                      .shade100,
                                                              onPressed:
                                                                  () =>
                                                                      Get.back(),
                                                              icon: Icon(
                                                                Icons.close,
                                                                color:
                                                                    Colors.red,
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
                                          ),
                                        ),
                                      ),
                                );
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Divider(color: theme.onPrimaryContainer),
                        const SizedBox(height: 10),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                ChatItem(
                                  name: "Edoda elsokhna",
                                  lastMsgs: "7mod can we marry pls?",
                                  image: '../assets/eldoda.jpg',
                                  numOfMsgs: 10,
                                  index: 0,
                                ),
                                SizedBox(height: 1),
                                ChatItem(
                                  name: "Tok tok 7azem",
                                  lastMsgs: "can i see your ass?",
                                  image: '../assets/hankalis_logo.webp',
                                  numOfMsgs: 5,
                                  index: 1,
                                ),
                                SizedBox(height: 1),
                                ChatItem(
                                  name: "Ahmed",
                                  lastMsgs:
                                      "ahmed can you tell me yameta kodasaiii?",
                                  image: '../assets/ahmed.jpg',
                                  numOfMsgs: 1,
                                  index: 2,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Divider(color: theme.onPrimaryContainer),
                        const SizedBox(height: 10),
                        CustomButtons(
                          onTap: () async {
                            await Services.storage.remove("token");
                            toastification.show(
                              title: Text("Token removed!"),
                              type: ToastificationType.success,
                              style: ToastificationStyle.fillColored,
                              autoCloseDuration: const Duration(seconds: 5),
                            );
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.add, color: Colors.white),
                              const SizedBox(width: 5),
                              Text(
                                "New chat",
                                style: TextStyle(color: Colors.white),
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
