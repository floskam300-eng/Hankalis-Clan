import 'package:flutter/material.dart';
import 'package:hankalis_clan/const.dart';

enum NewType { danger, warning, info }

class New extends StatelessWidget {
  const New({
    super.key,
    required this.title,
    required this.description,
    required this.type,
  });

  final String title, description;
  final NewType type;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return LayoutBuilder(
      builder:
          (context, constraints) => Padding(
            padding: EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 170,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color:
                          type == NewType.danger
                              ? Colors.red.withAlpha(25)
                              : type == NewType.warning
                              ? Colors.yellow.withAlpha(25)
                              : Colors.green.withAlpha(25),
                      border: Border.all(color: theme.onPrimaryContainer),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: constraints.maxWidth * 0.3,
                          height: double.infinity,
                          child: Image.asset(
                            type == NewType.danger
                                ? "../assets/caution.png"
                                : type == NewType.warning
                                ? "../assets/warning-sign.png"
                                : "../assets/info.png",
                            height: 100,
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: ListTile(
                              title: Text(
                                title,
                                style: TextStyle(
                                  fontSize:
                                      checkDeviceSize() == DeviceType.mobile
                                          ? 18
                                          : 25,
                                ),
                              ),
                              subtitle: Text(
                                description,
                                style: TextStyle(
                                  color: theme.onSecondaryContainer,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
