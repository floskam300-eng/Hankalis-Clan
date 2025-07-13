import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhotoMessageSend extends StatelessWidget {
  const PhotoMessageSend({
    super.key,
    required this.asset,
    required this.message,
    required this.time,
  });

  final String asset, message, time;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Align(
      alignment: Alignment.centerRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                time,
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 11.0, color: Colors.grey.shade600),
              ),
              SizedBox(width: 5),
              Icon(Icons.done_all, color: Color(0xFF1B97F3), size: 15.0),
            ],
          ),
          SizedBox(height: 5),
          Container(
            margin: EdgeInsets.only(bottom: 5),
            child: Card(
              elevation: 20,
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                padding: EdgeInsets.all(5),
                constraints: BoxConstraints(maxWidth: Get.width * 0.20),
                decoration: BoxDecoration(
                  color: theme.onTertiary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(asset),
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
