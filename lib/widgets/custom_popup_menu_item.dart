import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomPopupmenuitem extends StatelessWidget {
  const CustomPopupmenuitem({
    super.key,
    required this.name,
    required this.email,
    required this.photo,
    this.onTap,
  });

  final String? photo;
  final String name, email;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: ListTile(
          mouseCursor: SystemMouseCursors.click,
          title: Text(
            name,
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          subtitle: Text(
            email,
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
          leading: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(100)),
            child:
                photo != null
                    ? CachedNetworkImage(
                      height: 40,
                      width: 40,
                      imageUrl: photo!,
                      fit: BoxFit.cover,
                      placeholder:
                          (context, url) => CircularProgressIndicator(),
                      errorWidget:
                          (context, url, error) =>
                              Image.asset("assets/user.png"),
                    )
                    : Image.asset(
                      "assets/user.png",
                      height: 40,
                      width: 40,
                      fit: BoxFit.cover,
                    ),
          ),
        ),
      ),
    );
  }
}
