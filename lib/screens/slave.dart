import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hankalis_clan/controller/news_activity_controller.dart';
import 'package:hankalis_clan/widgets/custom_buttons.dart';

class Slave extends StatelessWidget {
  const Slave({super.key});

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
                            title: Text(
                              "Slaves",
                              style: TextStyle(fontSize: 18),
                            ),
                            subtitle: Text(
                              "you can buy Slave by clicking add button.",
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
              Container(
                height: 180,
                decoration: BoxDecoration(
                  color: theme.onPrimary,
                  border: Border.all(color: theme.onPrimaryContainer),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.all(
                              Radius.circular(100),
                            ),
                            child: Image.asset(
                              "../assets/hankalis_logo.webp",
                              height: 70,
                              width: 70,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Tok tok 7azem",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
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
      ),
    );
  }
}
