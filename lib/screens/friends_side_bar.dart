import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hankalis_clan/controller/side_bar_controller.dart';
import 'package:hankalis_clan/widgets/chat_item.dart';
import 'package:hankalis_clan/widgets/custom_buttons.dart';
import 'package:hankalis_clan/widgets/custom_fields.dart';

class FriendsSideBar extends StatelessWidget {
  const FriendsSideBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return GetBuilder<SideBarController>(
      builder:
          (controller) => Container(
            color: theme.onSecondary,
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    "Friends and Groups",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "this list of your friends and your Groups.",
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
                        CustomFields(
                          title: "Search",
                          inputType: TextInputType.text,
                          icon: Icon(Icons.search),
                          obscureText: false,
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
                                ChatItem(
                                  name: "Tok tok 7azem",
                                  lastMsgs: "can i see your ass?",
                                  image: '../assets/hankalis_logo.webp',
                                  numOfMsgs: 5,
                                  index: 1,
                                ),
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
