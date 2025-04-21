import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hankalis_clan/controller/news_activity_controller.dart';
import 'package:hankalis_clan/controller/sell_slave_controller.dart';
import 'package:hankalis_clan/widgets/custom_buttons.dart';

class SellSlave extends StatelessWidget {
  const SellSlave({super.key});

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
                    "Sell Slave",
                    style: TextStyle(fontSize: 18),
                  ),
                  subtitle: Text(
                    "you can sell your slave by clicking on 'sell' button.",
                    style: TextStyle(
                      color: theme.onSecondaryContainer,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 180,
                constraints: BoxConstraints(maxWidth: 600),
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
                        border: Border(
                          right: BorderSide(
                            color: theme.onPrimaryContainer
                          )
                        ),
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
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 15, right: 15),
                            padding: EdgeInsets.all(10),
                            constraints: BoxConstraints(minWidth: 150),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: theme.onPrimaryContainer,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            child: GetBuilder<SellSlaveController>(
                              builder:
                                  (controller) => DropdownButton<String>(
                                    value: controller.selectedMenuItem,
                                    onChanged: (String? value) {
                                      controller.selectedMenuItem =
                                          value == "7mod" ? "7mod" : "Ahmed";
                                    },
                                    items: [
                                      DropdownMenuItem(
                                        value: "7mod",
                                        child: Text("7mod"),
                                      ),
                                      DropdownMenuItem(
                                        value: "Ahmed",
                                        child: Text("Ahmed"),
                                      ),
                                    ],
                                  ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            margin: EdgeInsets.only(bottom: 15, right: 15),
                            width: 150,
                            child: CustomButtons(
                              child: Text("Sell"),
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
