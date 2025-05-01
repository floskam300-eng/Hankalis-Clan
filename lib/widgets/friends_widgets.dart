import 'package:dynamic_tabbar/dynamic_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hankalis_clan/widgets/add_friend.dart';
import 'package:hankalis_clan/widgets/friends.dart';
import 'package:hankalis_clan/widgets/requests_received.dart';
import 'package:hankalis_clan/widgets/requests_sent.dart';

class FriendsWidgets extends StatelessWidget {
  const FriendsWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: Container(
            height: 500,
            constraints: BoxConstraints(minWidth: 400, maxWidth: 450),
            decoration: BoxDecoration(
              color: theme.onSecondary,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: DynamicTabBarWidget(
                          labelColor: theme.onTertiary,
                          indicatorColor: theme.onTertiary,
                          dividerColor: theme.onPrimaryContainer,
                          onTabControllerUpdated: (p0) {
                            debugPrint("p0");
                          },
                          dynamicTabs: [
                            TabData(
                              index: 0,
                              title: Tab(text: "Friends"),
                              content: Friends(),
                            ),
                            TabData(
                              index: 1,
                              title: Tab(text: "Add Friend"),
                              content: AddFriend(),
                            ),
                            TabData(
                              index: 2,
                              title: Tab(text: "Requests Received"),
                              content: RequestsReceived(),
                            ),
                            TabData(
                              index: 3,
                              title: Tab(text: "Requests Sent"),
                              content: RequestsSent(),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: theme.onPrimary,
                          border: Border(
                            top: BorderSide(color: theme.onPrimaryContainer),
                          ),
                        ),
                        child: Center(
                          child: IconButton(
                            color: Colors.red.shade100,
                            onPressed: () => Get.back(),
                            icon: Icon(Icons.close, color: Colors.red),
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
    );
  }
}
