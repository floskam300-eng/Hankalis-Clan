import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hankalis_clan/controller/games_controller.dart';

class CategoryGames extends StatelessWidget {
  const CategoryGames({super.key, required this.title, required this.index});

  final String title;
  final int index;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final controller = Get.find<GamesController>();
    final isSelected = controller.selectedCategory == index;
    return Row(
      children: [
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: InkWell(
            onTap: () => controller.setSelectedCategory(index),
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                border: Border.all(color: theme.onPrimaryContainer),
                color:
                    isSelected ? theme.onPrimaryContainer : theme.onSecondary,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Text(title),
            ),
          ),
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}
