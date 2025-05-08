import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hankalis_clan/controller/friends_controller.dart';
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
                      "Friend Requests Received",
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
                  Expanded(
                    child: SizedBox(
                      width: 330,
                      child: GetBuilder<FriendsController>(
                        builder:
                            (controller) =>
                                controller.friendReceived.isNotEmpty
                                    ? ListView.builder(
                                      itemCount:
                                          controller.friendReceived.length,
                                      itemBuilder:
                                          (
                                            context,
                                            index,
                                          ) => FriendRecceivedItem(
                                            id:
                                                controller
                                                    .friendReceived[index]['id'],
                                            name:
                                                controller
                                                    .friendReceived[index]['name'],
                                            picture:
                                                controller
                                                    .friendReceived[index]['photoUrl'],
                                            onAccept: () {
                                              controller.emitFriendAcceptRequest(
                                                controller
                                                    .friendReceived[index]['id'],
                                              );
                                            },
                                            onDecline: () {
                                              controller.emitFriendDeclineRequest(
                                                controller
                                                    .friendReceived[index]['id'],
                                              );
                                            },
                                          ),
                                    )
                                    : Center(
                                      child: ListTile(
                                        title: Text(
                                          "No friend received.",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.grey.shade600,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        subtitle: Text(
                                          "You don't have any friend received.",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.grey.shade700,
                                          ),
                                        ),
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
    );
  }
}
