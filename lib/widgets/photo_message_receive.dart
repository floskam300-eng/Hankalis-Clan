import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:hankalis_clan/const.dart";

class PhotoMessageReceive extends StatelessWidget {
  const PhotoMessageReceive({
    super.key,
    required this.message,
    required this.time,
    required this.asset,
  });

  final String message, time, asset;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            time,
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 11.0, color: Colors.grey.shade600),
          ),
          SizedBox(height: 5),
          Container(
            margin: EdgeInsets.only(bottom: 5),
            child: Card(
              elevation: 20,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                padding: EdgeInsets.all(5),
                constraints: BoxConstraints(
                  maxWidth:
                      checkDeviceSize() == DeviceType.mobile
                          ? Get.width * 0.6
                          : Get.width * 0.2,
                ),
                decoration: BoxDecoration(
                  color: theme.onPrimaryContainer,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: GestureDetector(
                          onTap: () {
                            Get.generalDialog(
                              pageBuilder:
                                  (
                                    context,
                                    animation,
                                    secondaryAnimation,
                                  ) => Scaffold(
                                    backgroundColor: Colors.transparent,
                                    body: Stack(
                                      children: [
                                        Positioned.fill(
                                          child: GestureDetector(
                                            onTap: () => Get.back(),
                                            behavior: HitTestBehavior.opaque,
                                          ),
                                        ),
                                        Center(
                                          child: ConstrainedBox(
                                            constraints: BoxConstraints(
                                              maxWidth: Get.width * 0.8,
                                              maxHeight: Get.height * 0.8,
                                            ),
                                            child: Hero(
                                              tag: asset,
                                              child: InteractiveViewer(
                                                child: MouseRegion(
                                                  cursor:
                                                      SystemMouseCursors.grab,
                                                  child: Image.asset(
                                                    asset,
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                            );
                          },
                          child: Hero(tag: asset, child: Image.asset(asset)),
                        ),
                      ),
                      Visibility(
                        visible: true,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            message,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
