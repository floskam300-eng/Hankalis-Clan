import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hankalis_clan/controller/homepage_controller.dart';
import 'package:hankalis_clan/widgets/friend_recceived_item.dart';

class RequestsReceived extends StatelessWidget {
  const RequestsReceived({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Align(
        alignment: Alignment.topLeft,
        child: Center(
          child: SafeArea(
            child: Container(
              width: 350,
              decoration: BoxDecoration(
                color: theme.onSecondary,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      "Firend Requests Received",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      "This list of your friend requests received.",
                      style: TextStyle(
                        fontSize: 12,
                        color: theme.onSecondaryContainer,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 320,
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        FriendRecceivedItem(
                          id: "680c05851f12053393d9048f",
                          name: "Omar Shamy",
                          picture:
                              Get.find<HomepageController>().user['photoUrl'],
                        ),
                        FriendRecceivedItem(
                          id: "780c05851f12053393d9048f",
                          name: "7mod",
                          picture:
                              Get.find<HomepageController>().user['photoUrl'],
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
    );
  }
}
