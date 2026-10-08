import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hankalis_clan/controller/friends_side_bar_controller.dart';
import 'package:hankalis_clan/controller/side_bar_controller.dart';
import 'package:hankalis_clan/model/private_room.dart';
import 'package:hankalis_clan/model/public_room.dart';
import 'package:hankalis_clan/screens/create_public_room.dart';
import 'package:hankalis_clan/widgets/private_room_item.dart';
import 'package:hankalis_clan/widgets/custom_buttons.dart';
import 'package:hankalis_clan/widgets/custom_icon.dart';
import 'package:hankalis_clan/screens/friends.dart';
import 'package:hankalis_clan/widgets/public_room_item.dart';

class FriendsSideBar extends StatelessWidget {
  const FriendsSideBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final searchController = TextEditingController();
    final FriendsSideBarController friendsSideController =
        Get.find<FriendsSideBarController>();
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
                                    (String? search) =>
                                        friendsSideController.validateInputs(
                                          search!,
                                          InputType.name,
                                        ),
                                controller: searchController,
                                style: TextStyle(fontSize: 14),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                decoration: InputDecoration(
                                  hintText: "Search your chats",
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
                                  transitionDuration: Duration(
                                    milliseconds: 150,
                                  ),
                                  transitionBuilder:
                                      (
                                        context,
                                        animation,
                                        secondaryAnimation,
                                        child,
                                      ) => Transform.scale(
                                        origin: Offset(0, 0),
                                        scale: animation.value,
                                        alignment: Alignment.bottomCenter,
                                        child: child,
                                      ),
                                  pageBuilder: (_, __, ___) => Friends(),
                                );
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Divider(color: theme.onPrimaryContainer),
                        Expanded(
                          child: SingleChildScrollView(
                            child: GetBuilder<FriendsSideBarController>(
                              builder:
                                  (controller) => Column(
                                    children: [
                                      controller.privateRooms.isEmpty &&
                                              controller.publicRooms.isEmpty
                                          ? Center(
                                            child: ListTile(
                                              title: Text(
                                                "No Chats.",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                  color: Colors.grey.shade600,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              subtitle: Text(
                                                "You don't have any chats.",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.grey.shade700,
                                                ),
                                              ),
                                            ),
                                          )
                                          : Column(
                                            children: [
                                              for (
                                                int index = 0;
                                                index <
                                                    controller
                                                        .privateRooms
                                                        .length;
                                                index++
                                              )
                                                PrivateRoomItem(
                                                  room: PrivateRoom(
                                                    id:
                                                        controller
                                                            .privateRooms[index]['id'],
                                                    name:
                                                        controller
                                                            .privateRooms[index]['name'],
                                                    picture:
                                                        controller
                                                            .privateRooms[index]['picture'],
                                                    type:
                                                        controller
                                                            .privateRooms[index]['type'],
                                                  ),
                                                  index: index,
                                                ),
                                              Divider(
                                                color: theme.onPrimaryContainer,
                                              ),
                                              for (
                                                int index = 0;
                                                index <
                                                    controller
                                                        .publicRooms
                                                        .length;
                                                index++
                                              )
                                                PublicRoomItem(
                                                  room: PublicRoom(
                                                    id:
                                                        controller
                                                            .publicRooms[index]['id'],
                                                    name:
                                                        controller
                                                            .publicRooms[index]['name'],
                                                    description:
                                                        controller
                                                            .publicRooms[index]['description'],
                                                    type:
                                                        controller
                                                            .publicRooms[index]['type'],
                                                    admin:
                                                        controller
                                                            .publicRooms[index]['admin'],
                                                    picture:
                                                        controller
                                                            .publicRooms[index]['picture'],
                                                    participants:
                                                        controller
                                                            .publicRooms[index]['participants'],
                                                  ),
                                                  index: controller.privateRooms.length + index,
                                                ),
                                            ],
                                          ),
                                    ],
                                  ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Divider(color: theme.onPrimaryContainer),
                        const SizedBox(height: 10),
                        CustomButtons(
                          onTap: () {
                            Get.generalDialog(
                              transitionDuration: Duration(milliseconds: 150),
                              transitionBuilder:
                                  (
                                    context,
                                    animation,
                                    secondaryAnimation,
                                    child,
                                  ) => Transform.scale(
                                    origin: Offset(0, 0),
                                    scale: animation.value,
                                    alignment: Alignment.bottomCenter,
                                    child: child,
                                  ),
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      CreatePublicRoom(),
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
