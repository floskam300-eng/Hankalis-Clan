import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hankalis_clan/controller/authentication_controller.dart';

class BuildOption extends StatelessWidget {
  const BuildOption({super.key, required this.title, required this.index});

  final String title;
  final AuthenticationType index;

  @override
  Widget build(BuildContext context) {
    bool isSelected = Get.find<AuthenticationController>().getIndex == index;
    return GetBuilder<AuthenticationController>(
      builder:
          (controller) => MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                controller.newIndex = index;
              },
              child: Container(
                decoration: BoxDecoration(
                  color:
                      isSelected
                          ? Theme.of(context).colorScheme.onSecondary
                          : Theme.of(context).colorScheme.onPrimary,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Center(
                  child: Text(
                    title,
                    style: TextStyle(
                      color:
                          isSelected
                              ? null
                              : Theme.of(
                                context,
                              ).colorScheme.onSecondaryContainer,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ),
              ),
            ),
          ),
    );
  }
}
