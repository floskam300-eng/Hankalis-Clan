import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hankalis_clan/controller/create_public_room_controller.dart';
import 'package:hankalis_clan/widgets/custom_chip.dart';
import 'package:hankalis_clan/widgets/custom_input.dart';
import 'package:hankalis_clan/widgets/custom_popup_menu_item.dart';

class CreatePublicRoom extends StatelessWidget {
  const CreatePublicRoom({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final scrollController = ScrollController();
    final createPublicRoomController = Get.find<CreatePublicRoomController>();
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Material(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Container(
            height: 480,
            padding: const EdgeInsets.all(20),
            constraints: BoxConstraints(minWidth: 400, maxWidth: 450),
            decoration: BoxDecoration(
              color: theme.onSecondary,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: Colors.transparent,
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          ListTile(
                            title: Text(
                              "Create Group",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              "Fill the details to create a public group.",
                              style: TextStyle(
                                fontSize: 12,
                                color: theme.onSecondaryContainer,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: () => Get.back(),
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: theme.onPrimaryContainer,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(100),
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.close,
                                    color: theme.onSecondaryContainer,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 120,
                              child: Center(
                                child: GetBuilder<CreatePublicRoomController>(
                                  builder:
                                      (controller) => MouseRegion(
                                        cursor: SystemMouseCursors.click,
                                        onEnter:
                                            (_) =>
                                                controller.setIsHovered(true),
                                        onExit:
                                            (_) =>
                                                controller.setIsHovered(false),
                                        child: GestureDetector(
                                          onTap: () => controller.pickImage(),
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              AnimatedOpacity(
                                                duration: Duration(
                                                  milliseconds: 200,
                                                ),
                                                curve: Curves.fastOutSlowIn,
                                                opacity:
                                                    controller.isHovered
                                                        ? 0.1
                                                        : 1,
                                                child: SizedBox(
                                                  height: 130,
                                                  width: 130,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                          Radius.circular(100),
                                                        ),
                                                    child:
                                                        controller.file == null
                                                            ? Image.asset(
                                                              "assets/partners.png",
                                                            )
                                                            : CachedNetworkImage(
                                                              fit: BoxFit.cover,
                                                              imageUrl:
                                                                  controller
                                                                      .file!
                                                                      .path,
                                                              placeholder:
                                                                  (
                                                                    context,
                                                                    url,
                                                                  ) =>
                                                                      CircularProgressIndicator(),
                                                              errorWidget:
                                                                  (
                                                                    context,
                                                                    url,
                                                                    error,
                                                                  ) => Icon(
                                                                    Icons.error,
                                                                  ),
                                                            ),
                                                  ),
                                                ),
                                              ),
                                              controller.isHovered
                                                  ? Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.edit,
                                                        color: Colors.white,
                                                      ),
                                                      Text(
                                                        "Change Image",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                  : SizedBox.shrink(),
                                            ],
                                          ),
                                        ),
                                      ),
                                ),
                              ),
                            ),
                            Text(
                              " Group Details",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(height: 10),
                            LayoutBuilder(
                              builder:
                                  (context, constraints) => Row(
                                    children: [
                                      Expanded(
                                        child: CustomInput(
                                          hintText: "name",
                                          controller:
                                              createPublicRoomController
                                                  .roomNameController,
                                          prefixIcon: Icon(Icons.people),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      SizedBox(
                                        width: constraints.maxWidth * 0.6,
                                        child: CustomInput(
                                          hintText: "description",
                                          controller:
                                              createPublicRoomController
                                                  .roomDescriptionController,
                                          prefixIcon: Icon(Icons.description),
                                        ),
                                      ),
                                    ],
                                  ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              height: 53,
                              width: double.infinity,
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: theme.onPrimary,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                border: Border.all(
                                  color: theme.onPrimaryContainer,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Scrollbar(
                                      controller: scrollController,
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        controller: scrollController,
                                        child: GetBuilder<
                                          CreatePublicRoomController
                                        >(
                                          builder:
                                              (controller) => Row(
                                                children: [
                                                  if (controller.getChips ==
                                                          null ||
                                                      controller
                                                          .getChips!
                                                          .isEmpty)
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                        left: 10,
                                                      ),
                                                      child: Text(
                                                        "no members",
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          color:
                                                              Colors
                                                                  .grey
                                                                  .shade800,
                                                        ),
                                                      ),
                                                    ),
                                                  if (controller.getChips !=
                                                          null &&
                                                      controller
                                                          .getChips!
                                                          .isNotEmpty)
                                                    for (Map<String, dynamic>
                                                        chip
                                                        in controller.getChips!)
                                                      CustomChip(
                                                        id: chip["id"],
                                                        name: chip["name"],
                                                        photo: chip["photo"],
                                                        email: chip["email"],
                                                        index: controller
                                                            .getChips!
                                                            .indexOf(chip),
                                                      ),
                                                ],
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: GetBuilder<
                                      CreatePublicRoomController
                                    >(
                                      builder:
                                          (controller) => PopupMenuButton(
                                            constraints: BoxConstraints(
                                              minWidth: 390,
                                              minHeight: 100,
                                              maxHeight: 150,
                                            ),
                                            elevation: 10,
                                            offset: Offset(5, 55),
                                            color: theme.onSecondary,
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                color: theme.onPrimaryContainer,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            popUpAnimationStyle: AnimationStyle(
                                              duration: Duration(
                                                milliseconds: 250,
                                              ),
                                            ),
                                            itemBuilder: (context) {
                                              return <PopupMenuItem>[
                                                if (controller.getFriends !=
                                                        null &&
                                                    controller
                                                        .getFriends!
                                                        .isNotEmpty)
                                                  for (Map<String, dynamic>
                                                      friend
                                                      in controller.getFriends!)
                                                    PopupMenuItem(
                                                      value: friend["id"],
                                                      enabled: false,
                                                      child: CustomPopupmenuitem(
                                                        name: friend["name"],
                                                        email: friend['email'],
                                                        photo: friend['photo'],
                                                        onTap: () {
                                                          final currentIndex =
                                                              controller
                                                                  .getFriends!
                                                                  .indexWhere(
                                                                    (f) =>
                                                                        f["id"] ==
                                                                        friend["id"],
                                                                  );
                                                          if (currentIndex !=
                                                              -1) {
                                                            controller.chips = {
                                                              "id":
                                                                  friend["id"],
                                                              "name":
                                                                  friend["name"],
                                                              "photo":
                                                                  friend["photo"],
                                                              "email":
                                                                  friend['email'],
                                                            };
                                                            controller
                                                                .removeFriend(
                                                                  currentIndex,
                                                                );
                                                            Get.back();
                                                          }
                                                        },
                                                      ),
                                                    ),
                                              ];
                                            },
                                            child: Container(
                                              width: 100,
                                              height: double.infinity,
                                              margin: EdgeInsets.only(left: 5),
                                              decoration: BoxDecoration(
                                                color: theme.onSecondary,
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(5),
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Text("Friends"),
                                                  const SizedBox(width: 5),
                                                  Icon(
                                                    Icons.keyboard_arrow_down,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                MaterialButton(
                                  color: theme.onPrimary,
                                  hoverColor: Colors.black12,
                                  padding: EdgeInsets.all(20),
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      color: theme.onPrimaryContainer,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: Text(
                                    "Cancel",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () => Get.back(),
                                ),
                                const SizedBox(width: 10),
                                MaterialButton(
                                  color: theme.onTertiary,
                                  hoverColor: Colors.blue.shade800,
                                  padding: EdgeInsets.all(20),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: Text(
                                    "Create",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed:
                                      () =>
                                          createPublicRoomController
                                              .createRoom(),
                                ),
                              ],
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
        ),
      ),
    );
  }
}
