import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hankalis_clan/controller/news_activity_controller.dart';
import 'package:hankalis_clan/widgets/news_activity_widget.dart';

class NewsActivity extends StatelessWidget {
  const NewsActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsActivityController>(
      builder:
          (controller) =>
              controller.selectedActivity > -1
                  ? controller.activities[controller.selectedActivity]
                  : NewsActivityWidget(),
    );
  }
}
