import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hankalis_clan/controller/side_bar_controller.dart';

class ChangeThemesButtons extends StatelessWidget {
  const ChangeThemesButtons({
    super.key,
    required this.title,
    required this.index,
    required this.icon,
  });

  final String title;
  final int index;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    bool isSelected = Get.find<SideBarController>().selectedButton == index;
    final theme = Theme.of(context).colorScheme;
    return GetBuilder<SideBarController>(
      builder:
          (controller) => MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                controller.setSelectedButton(index);
              },
              child: Container(
                height: double.infinity,
                decoration: BoxDecoration(
                  color:
                      isSelected
                          ? Theme.of(context).colorScheme.onSecondary
                          : Theme.of(context).colorScheme.onPrimary,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      icon,
                      size: 20,
                      color: isSelected ? null : theme.onSecondaryContainer,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      title,
                      style: TextStyle(
                        color: isSelected ? null : theme.onSecondaryContainer,
                        fontWeight: FontWeight.bold,
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
