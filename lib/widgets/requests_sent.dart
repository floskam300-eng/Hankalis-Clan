import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hankalis_clan/controller/firends_side_bar_controller.dart';
import 'package:hankalis_clan/widgets/friend_request_item.dart';

class RequestsSent extends StatelessWidget {
  const RequestsSent({super.key});

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
                      "Friend Requests",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      "This list of your friend requests.",
                      style: TextStyle(
                        fontSize: 12,
                        color: theme.onSecondaryContainer,
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      width: 320,
                      child: GetBuilder<FirendsSideBarController>(
                        builder: (controller) {
                          return controller.friendRequest.isNotEmpty
                              ? ListView.builder(
                                itemCount: controller.friendRequest.length,
                                itemBuilder:
                                    (context, index) => FriendRequestItem(
                                      id:
                                          controller
                                              .friendRequest[index]['id'],
                                      name:
                                          controller
                                              .friendRequest[index]['name'],
                                      picture:
                                          controller
                                              .friendRequest[index]['photoUrl'],
                                      onTap: () {
                                        controller.friendRequestCancel(
                                          controller
                                              .friendRequest[index]['id'],
                                        );
                                      },
                                    ),
                              )
                              : Center(
                                child: ListTile(
                                  title: Text(
                                    "No friend requests.",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.grey.shade600,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  subtitle: Text(
                                    "You don't have any friend requests.",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.grey.shade700,
                                    ),
                                  ),
                                ),
                              );
                        },
                      ),
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
