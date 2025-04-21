import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hankalis_clan/controller/news_activity_controller.dart';
import 'package:hankalis_clan/widgets/custom_buttons.dart';
import 'package:hankalis_clan/widgets/new.dart';

class News extends StatelessWidget {
  const News({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Expanded(
      child: Container(
        color: theme.onSecondary,
        child: SingleChildScrollView(
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
                child: Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
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
                            title: Text("News", style: TextStyle(fontSize: 18)),
                            subtitle: Text(
                              "you can add new by clicking add button.",
                              style: TextStyle(
                                color: theme.onSecondaryContainer,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: SizedBox(
                          width: 100,
                          child: CustomButtons(child: Text("Add")),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              New(
                title:
                    "7mod sent a request for the enslavement of tok tok 7azem.",
                description: "the request sent by 7mod.",
                type: NewType.danger,
              ),
              New(
                title: "7mod have new slave tok tok 7azom.",
                description: "the request accepted 7mod request.",
                type: NewType.info,
              ),
              New(
                title: "7mod have new slave tok tok 7azom.",
                description: "the request accepted 7mod request.",
                type: NewType.warning,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
