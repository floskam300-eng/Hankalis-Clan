import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:hankalis_clan/controller/create_public_room_controller.dart";

class CustomChip extends StatelessWidget {
  const CustomChip({
    super.key,
    required this.id,
    required this.name,
    required this.photo,
    required this.email,
    required this.index,
  });

  final String? photo;
  final String name, email, id;
  final int index;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Row(
      children: [
        GetBuilder<CreatePublicRoomController>(
          builder:
              (controller) => MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Container(
                  decoration: BoxDecoration(
                    color: theme.onPrimaryContainer,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width: 10),
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          child:
                              photo != null
                                  ? CachedNetworkImage(
                                    height: 25,
                                    width: 25,
                                    imageUrl: photo!,
                                    placeholder:
                                        (context, url) =>
                                            CircularProgressIndicator(),
                                    errorWidget:
                                        (context, url, error) =>
                                            Image.asset("assets/user.png"),
                                  )
                                  : Image.asset(
                                    "assets/user.png",
                                    height: 25,
                                    width: 25,
                                  ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          name,
                          style: TextStyle(fontSize: 12),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        IconButton(
                          onPressed: () {
                            controller.removeChip(index);
                            controller.friends = {
                              "id": id,
                              "name": name,
                              "photo": photo,
                              "email": email,
                            };
                          },
                          icon: Icon(Icons.close, size: 18),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
        ),
        const SizedBox(width: 5),
      ],
    );
  }
}
