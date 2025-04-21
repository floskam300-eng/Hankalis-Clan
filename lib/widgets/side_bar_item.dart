import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hankalis_clan/const.dart';
import 'package:hankalis_clan/controller/side_bar_controller.dart';

class SideBarItem extends StatelessWidget {
  const SideBarItem({
    super.key,
    required this.itemName,
    required this.icon,
    required this.index,
  });

  final String itemName, icon;
  final int index;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SideBarController>();
    final theme = Theme.of(context).colorScheme;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            controller.setSelectedItem(index);
            if (checkDeviceSize() == DeviceType.mobile) {
              Get.back();
            }
          },
          borderRadius: BorderRadius.circular(10),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 12),
            decoration: BoxDecoration(
              color:
                  controller.selectedItem == index
                      ? theme.onTertiaryContainer
                      : null,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Image.asset(icon, height: 20),
                SizedBox(width: 14),
                Text(itemName, style: TextStyle(fontSize: 14)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
