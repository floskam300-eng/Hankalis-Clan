import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hankalis_clan/controller/firends_side_bar_controller.dart';
import 'package:hankalis_clan/controller/homepage_controller.dart';
import 'package:hankalis_clan/widgets/friend_item.dart';

class Friends extends StatelessWidget {
  const Friends({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final searchController = TextEditingController();
    final FirendsSideBarController friendsSideController =
        Get.find<FirendsSideBarController>();
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
                      "Friends",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      "This list of your friends.",
                      style: TextStyle(
                        fontSize: 12,
                        color: theme.onSecondaryContainer,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        TextFormField(
                          keyboardType: TextInputType.webSearch,
                          validator:
                              (String? search) => friendsSideController
                                  .valideInputes(search!, InputType.name),
                          controller: searchController,
                          style: TextStyle(fontSize: 14),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                        SizedBox(height: 10),
                        FriendItem(
                          name: "Omar Shamy",
                          id: "680c05851f12053393d9048f",
                          picture:
                              Get.find<HomepageController>().user['photoUrl']
                                  .toString(),
                        ),
                        FriendItem(
                          name: "Omar Shamy",
                          id: "680c05851f12053393d9048f",
                          picture:
                              Get.find<HomepageController>().user['photoUrl']
                                  .toString(),
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
