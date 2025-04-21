import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hankalis_clan/controller/side_bar_controller.dart';

class MiniSideBarItem extends StatelessWidget {
  const MiniSideBarItem({
    super.key,
    required this.itemName,
    required this.index,
  });

  final String itemName;
  final int index;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return GetBuilder<SideBarController>(
      builder:
          (controller) => MouseRegion(
            cursor: SystemMouseCursors.click,
            child: InkWell(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              onTap: () => controller.setSelectedItem(index),
              child: Container(
                decoration: BoxDecoration(
                  color:
                      controller.selectedItem == index
                          ? theme.onSecondary
                          : null,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                padding: const EdgeInsets.all(10),
                child: Image.asset(itemName, height: 20, width: 20),
              ),
            ),
          ),
    );
  }
}
