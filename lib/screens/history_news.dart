import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hankalis_clan/const.dart';
import 'package:hankalis_clan/controller/news_activity_controller.dart';
import 'package:hankalis_clan/widgets/history_new_table_item.dart';
import 'package:hankalis_clan/widgets/new.dart';

class HistoryNews extends StatelessWidget {
  const HistoryNews({super.key});

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
                title: Text("History Of News", style: TextStyle(fontSize: 18)),
                subtitle: Text(
                  "you can see all news history from here.",
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
                                    "New",
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
                                    "Type",
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
                            historyNewTableItem(
                              context: context,
                              news:
                                  "7mod sent a request for the enslavement of tok tok 7azem.",
                              type: NewType.danger,
                              date: "2024-03-11",
                            ),
                            historyNewTableItem(
                              context: context,
                              news: "7mod have new slave tok tok 7azom.",
                              type: NewType.warning,
                              date: "2023-02-06",
                            ),
                            historyNewTableItem(
                              context: context,
                              news: "7mod have new slave tok tok 7azom.",
                              type: NewType.info,
                              date: "2024-09-14",
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
