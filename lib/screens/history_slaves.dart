import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hankalis_clan/const.dart';
import 'package:hankalis_clan/controller/news_activity_controller.dart';
import 'package:hankalis_clan/widgets/history_slave_table_item.dart';

class HistorySlaves extends StatelessWidget {
  const HistorySlaves({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Expanded(
      child: Container(
        color: theme.onSecondary,
        child: Column(
          children: [
            Container(
              height: 75,
              width: double.infinity,
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: theme.onPrimaryContainer),
                ),
              ),
              child: ListTile(
                leading: GetBuilder<NewsActivityController>(
                  builder:
                      (controller) => IconButton(
                        onPressed: () {
                          if (Navigator.of(context).canPop()) {
                            Get.back();
                          } else {
                            controller.setSelectedActivity(-1);
                            Get.offNamed("/");
                          }
                        },
                        icon: Icon(Icons.arrow_back),
                      ),
                ),
                title: Text(
                  "History Of Slaves",
                  style: TextStyle(fontSize: 18),
                ),
                subtitle: Text(
                  "you can see all slaves history from here.",
                  style: TextStyle(
                    color: theme.onSecondaryContainer,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Container(
                margin:
                    checkDeviceSize() == DeviceType.mobile
                        ? EdgeInsets.all(10)
                        : EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  border: Border.all(color: theme.onPrimaryContainer),
                ),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: theme.onPrimary,
                        border: Border(
                          bottom: BorderSide(color: theme.onPrimaryContainer),
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Center(child: Text("History")),
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: Table(
                          children: [
                            TableRow(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: theme.onPrimaryContainer,
                                  ),
                                ),
                              ),
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      right: BorderSide(
                                        color: theme.onPrimaryContainer,
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    "Master",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: theme.onSecondaryContainer,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      right: BorderSide(
                                        color: theme.onPrimaryContainer,
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    "Slave",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: theme.onSecondaryContainer,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    "Date",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: theme.onSecondaryContainer,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            historySlaveTableItem(
                              context: context,
                              master: "7zom",
                              slave: "7mod",
                              date: "2024-03-11",
                            ),
                            historySlaveTableItem(
                              context: context,
                              master: "7mod",
                              slave: "7zom",
                              date: "2023-02-06",
                            ),
                            historySlaveTableItem(
                              context: context,
                              master: "3mor",
                              slave: "Ahmed",
                              date: "2024-09-14",
                            ),
                            historySlaveTableItem(
                              context: context,
                              master: "Ahmed",
                              slave: "7zom",
                              date: "2021-05-21",
                            ),
                            historySlaveTableItem(
                              context: context,
                              master: "7mod",
                              slave: "3mor",
                              date: "2025-04-11",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
