import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hankalis_clan/const.dart';
import 'package:hankalis_clan/widgets/custom_fields.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          return Container(
            color: Color.fromRGBO(21, 23, 25, 1),
            padding:
                checkDeviceSize() == DeviceType.mobile
                    ? const EdgeInsets.all(0.0)
                    : const EdgeInsets.all(15.0),
            child: Row(
              children: [
                checkDeviceSize() == DeviceType.mobile
                    ? SizedBox()
                    : Container(
                      color: Color.fromRGBO(21, 23, 25, 1),
                      constraints: BoxConstraints(maxWidth: width * 0.3),
                      child: Padding(
                        padding: EdgeInsets.all(30),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Unlock the power of Hankalis Clan",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Color.fromRGBO(242, 244, 247, 1),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "Chat app for Hankalis Clan members and friends to have some fun together",
                                style: TextStyle(
                                  fontWeight: FontWeight.w100,
                                  fontSize: 12,
                                  color: theme.onSecondaryContainer,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: theme.onSecondary,
                      borderRadius:
                          checkDeviceSize() == DeviceType.mobile
                              ? BorderRadius.zero
                              : BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Center(
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          final height = constraints.maxHeight;
                          final width = constraints.maxWidth;
                          return Container(
                            alignment: Alignment.center,
                            height: height * 0.4,
                            width: width < 650 ? width * 0.7 : width * 0.4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () => Get.back(),
                                      icon: Icon(Icons.arrow_back),
                                    ),
                                    Expanded(
                                      child: Text(
                                        "Reset your password",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                CustomFields(
                                  title: "Username or email",
                                  icon: Icon(Icons.email),
                                  inputType: TextInputType.emailAddress,
                                ),
                                const SizedBox(height: 20),
                                MaterialButton(
                                  onPressed: () {},
                                  height: 50,
                                  minWidth:
                                      width < 650 ? width * 0.7 : width * 0.4,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  color: theme.onTertiary,
                                  child: Text(
                                    "Reset password",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
