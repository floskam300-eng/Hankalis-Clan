import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hankalis_clan/controller/firends_side_bar_controller.dart';
import 'package:hankalis_clan/widgets/custom_buttons.dart';

class AddFriend extends StatelessWidget {
  const AddFriend({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final friendIdController = TextEditingController();
    final controller = Get.find<FirendsSideBarController>();
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Align(
        alignment: Alignment.topLeft,
        child: Center(
          child: SafeArea(
            child: Container(
              width: 350,
              decoration: BoxDecoration(
                color: theme.onSecondary,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      "Add Friend",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      "Enter your friend ID to add him.",
                      style: TextStyle(
                        fontSize: 12,
                        color: theme.onSecondaryContainer,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    validator:
                        (String? value) =>
                            controller.valideInputes(value!, InputType.name),
                    controller: friendIdController,
                    style: TextStyle(fontSize: 14),
                    decoration: InputDecoration(
                      constraints: BoxConstraints(maxWidth: 300),
                      hintText: "Friend ID",
                      hintStyle: TextStyle(
                        color: theme.onPrimaryContainer,
                        fontSize: 14,
                      ),
                      prefixIcon: Icon(Icons.person),
                      prefixIconColor: theme.onPrimaryContainer,
                      fillColor: theme.onPrimary,
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 300,
                    child: CustomButtons(child: Text("Add"), onTap: () {}),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
