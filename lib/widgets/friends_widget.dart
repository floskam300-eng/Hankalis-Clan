import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hankalis_clan/controller/friends_controller.dart';
import 'package:hankalis_clan/widgets/friend_item.dart';
import 'package:panara_dialogs/panara_dialogs.dart';

class FriendsWidget extends StatelessWidget {
  const FriendsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final FriendsController friendsController =
        Get.find<FriendsController>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: Center(
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
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "This list of your friends.",
                    style: TextStyle(
                      fontSize: 12,
                      color: theme.onSecondaryContainer,
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    width: 300,
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        TextFormField(
                          keyboardType: TextInputType.webSearch,
                          controller: friendsController.searchController,
                          style: TextStyle(fontSize: 14),
                          onChanged: (String value) {
                            if (value.isEmpty) {
                              friendsController.searchFriends(value);
                            }
                          },
                          onEditingComplete: () {
                            friendsController.searchFriends(
                              friendsController.searchController.text,
                            );
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            hintText: "Search by name",
                            hintStyle: TextStyle(
                              color: theme.onPrimaryContainer,
                              fontSize: 14,
                            ),
                            suffixIcon: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: () {
                                  friendsController.searchFriends(
                                    friendsController.searchController.text,
                                  );
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(5),
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: theme.onSecondary,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.search,
                                    color: theme.onTertiary,
                                  ),
                                ),
                              ),
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
                        Expanded(
                          child: GetBuilder<FriendsController>(
                            builder:
                                (controller) =>
                                    controller.filteredFriends.isNotEmpty
                                        ? ListView.builder(
                                          itemCount:
                                              controller.filteredFriends.length,
                                          itemBuilder:
                                              (context, index) => FriendItem(
                                                id:
                                                    controller
                                                        .filteredFriends[index]["id"],
                                                name:
                                                    controller
                                                        .filteredFriends[index]["name"],
                                                picture:
                                                    controller
                                                        .filteredFriends[index]["photoUrl"],
                                                onTap: () {
                                                  PanaraConfirmDialog.show(
                                                    context,
                                                    imagePath:
                                                        "../../assets/confirm.png",
                                                    title: "Delete friend.",
                                                    message:
                                                        "Are you sure you want to delete this friend?",
                                                    confirmButtonText:
                                                        "Confirm",
                                                    cancelButtonText: "Cancel",
                                                    onTapCancel: () {
                                                      Get.back();
                                                    },
                                                    onTapConfirm: () {
                                                      controller.friendRemove(
                                                        controller
                                                            .filteredFriends[index]["id"],
                                                      );
                                                      Get.back();
                                                    },
                                                    panaraDialogType:
                                                        PanaraDialogType
                                                            .warning,
                                                    barrierDismissible: false,
                                                  );
                                                },
                                              ),
                                        )
                                        : Center(
                                          child: ListTile(
                                            title: Text(
                                              "No friends.",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                color: Colors.grey.shade600,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            subtitle: Text(
                                              "You don't have any friends.",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.grey.shade700,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
