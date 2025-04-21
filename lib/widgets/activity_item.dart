import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hankalis_clan/controller/news_activity_controller.dart';

class ActivityItem extends StatelessWidget {
  const ActivityItem({
    super.key,
    required this.image,
    required this.title,
    required this.readedMsgs,
    required this.index,
  });

  final String image, title;
  final int readedMsgs, index;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final controller = Get.find<NewsActivityController>();
    return InkWell(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      onTap: () => controller.setSelectedActivity(index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: theme.onPrimary,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              alignment: Alignment.centerLeft,
              image,
              height: 35,
              width: 35,
            ),
            const SizedBox(height: 15),
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(62, 220, 120, 1),
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                  ),
                  child: Center(
                    child: Text(
                      readedMsgs.toString(),
                      style: TextStyle(
                        color: theme.onPrimary,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 7),
                Text(
                  "unreaded.",
                  style: TextStyle(
                    color: theme.onSecondaryContainer,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
