import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Overview extends StatelessWidget {
  const Overview({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Container(
      height: 350,
      constraints: BoxConstraints(maxWidth: 700),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: theme.onPrimary,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: LayoutBuilder(
        builder:
            (context, constraints) => Column(
              children: [
                ListTile(
                  title: Text(
                    "Overview",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w100),
                  ),
                  subtitle: Text(
                    "this your stats and your rank in the leaderboard",
                    style: TextStyle(
                      fontSize: 12,
                      color: theme.onSecondaryContainer,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                margin:
                                    Get.width > 1100
                                        ? EdgeInsets.only(
                                          top: 20,
                                          left: 20,
                                          bottom: 10,
                                          right: 10,
                                        )
                                        : EdgeInsets.only(
                                          top: 10,
                                          left: 10,
                                          bottom: 5,
                                          right: 5,
                                        ),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border.all(color: theme.onSecondary),
                                  color: theme.onPrimary,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                                child: ListTile(
                                  title: Row(
                                    children: [
                                      Text(
                                        "4 ",
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 25,
                                        ),
                                      ),
                                      Text(
                                        "Games",
                                        style: TextStyle(
                                          color: theme.onSecondaryContainer,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                  subtitle: Text(
                                    "Wins",
                                    style: TextStyle(
                                      color: Colors.green[300],
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin:
                                    Get.width < 1100
                                        ? EdgeInsets.only(
                                          left: 10,
                                          bottom: 10,
                                          right: 5,
                                          top: 5,
                                        )
                                        : EdgeInsets.only(
                                          left: 20,
                                          bottom: 20,
                                          right: 10,
                                          top: 10,
                                        ),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border.all(color: theme.onSecondary),
                                  color: theme.onPrimary,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                                child: ListTile(
                                  title: Row(
                                    children: [
                                      Text(
                                        "90 ",
                                        style: TextStyle(fontSize: 25),
                                      ),
                                      Text(
                                        "Points",
                                        style: TextStyle(
                                          color: theme.onSecondaryContainer,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                  subtitle: Text(
                                    "Score",
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                margin:
                                    Get.width < 1100
                                        ? EdgeInsets.only(
                                          left: 5,
                                          bottom: 5,
                                          top: 10,
                                          right: 10,
                                        )
                                        : EdgeInsets.only(
                                          left: 10,
                                          bottom: 10,
                                          top: 20,
                                          right: 20,
                                        ),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border.all(color: theme.onSecondary),
                                  color: theme.onPrimary,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                                child: ListTile(
                                  title: Row(
                                    children: [
                                      Text(
                                        "6 ",
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 25,
                                        ),
                                      ),
                                      Text(
                                        "Games",
                                        style: TextStyle(
                                          color: theme.onSecondaryContainer,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                  subtitle: Text(
                                    "Lose",
                                    style: TextStyle(
                                      color: Colors.red[300],
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin:
                                    Get.width < 1100
                                        ? EdgeInsets.only(
                                          left: 5,
                                          top: 5,
                                          bottom: 10,
                                          right: 10,
                                        )
                                        : EdgeInsets.only(
                                          left: 10,
                                          top: 10,
                                          bottom: 20,
                                          right: 20,
                                        ),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border.all(color: theme.onSecondary),
                                  color: theme.onPrimary,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                                child: ListTile(
                                  title: Row(
                                    children: [
                                      Text(
                                        "10 ",
                                        style: TextStyle(fontSize: 25),
                                      ),
                                      Text(
                                        "Played",
                                        style: TextStyle(
                                          color: theme.onSecondaryContainer,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                  subtitle: Text(
                                    "Your games",
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 16,
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
              ],
            ),
      ),
    );
  }
}
