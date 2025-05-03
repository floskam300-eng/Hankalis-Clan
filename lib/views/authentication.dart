import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hankalis_clan/controller/authentication_controller.dart';
import 'package:hankalis_clan/widgets/build_option.dart';
import 'package:hankalis_clan/widgets/custom_sign_buttons.dart';
import 'package:hankalis_clan/widgets/custom_fields.dart';

import '../const.dart';

class Authentication extends StatelessWidget {
  const Authentication({super.key});
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final theme = Theme.of(context).colorScheme;
    final controller = Get.find<AuthenticationController>();

    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      body: Form(
        key: formKey,
        child: LayoutBuilder(
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
                                Text(
                                  "Chat app for Hankalis Clan memebers and friends to have some fun together",
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
                              height: height * 0.9,
                              width: width < 650 ? width * 0.7 : width * 0.4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                          100,
                                        ),
                                        child: Image.asset(
                                          "../assets/hankalis_logo.webp",
                                          height: 50,
                                          width: 50,
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        "Hankalis Clan",
                                        style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                  Container(
                                    height: 50,
                                    padding: EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                      color:
                                          Theme.of(
                                            context,
                                          ).colorScheme.onPrimary,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                    child: GetBuilder<AuthenticationController>(
                                      builder:
                                          (controller) => Row(
                                            children: [
                                              Expanded(
                                                child: BuildOption(
                                                  index:
                                                      AuthenticationType.login,
                                                  title: "Sign in",
                                                ),
                                              ),
                                              Expanded(
                                                child: BuildOption(
                                                  index:
                                                      AuthenticationType
                                                          .register,
                                                  title: "Create account",
                                                ),
                                              ),
                                            ],
                                          ),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomSignButtons(
                                    title: "Continue with Google",
                                    asset: '../assets/google.png',
                                    onTap: () {
                                      controller.loginWithGoogle();
                                    },
                                  ),
                                  SizedBox(height: 10),
                                  CustomSignButtons(
                                    title: "Continue with Facebook",
                                    asset: '../assets/facebook.png',
                                    onTap: () {
                                      controller.loginWithFacebook();
                                    },
                                  ),
                                  SizedBox(height: 20),
                                  SizedBox(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Divider(
                                            color:
                                                Theme.of(context)
                                                    .colorScheme
                                                    .onPrimaryContainer,
                                          ),
                                        ),
                                        const SizedBox(width: 20),
                                        Text(
                                          "OR",
                                          style: TextStyle(
                                            color:
                                                Theme.of(context)
                                                    .colorScheme
                                                    .onPrimaryContainer,
                                          ),
                                        ),
                                        const SizedBox(width: 20),
                                        Expanded(
                                          child: Divider(
                                            color:
                                                Theme.of(context)
                                                    .colorScheme
                                                    .onPrimaryContainer,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  GetBuilder<AuthenticationController>(
                                    builder:
                                        (controller) =>
                                            controller.getIndex ==
                                                    AuthenticationType.register
                                                ? Column(
                                                  children: [
                                                    CustomFields(
                                                      title: "username",
                                                      icon: Icon(Icons.person),
                                                      controller:
                                                          nameController,
                                                      validator:
                                                          (
                                                            String? name,
                                                          ) => controller
                                                              .valideInputes(
                                                                name!,
                                                                InputType.name,
                                                              ),
                                                      inputType:
                                                          TextInputType.name,
                                                    ),
                                                    const SizedBox(height: 10),
                                                  ],
                                                )
                                                : SizedBox(),
                                  ),
                                  CustomFields(
                                    title: "email",
                                    icon: Icon(Icons.email),
                                    controller: emailController,
                                    validator: (String? email) {
                                      return controller.valideInputes(
                                        email!,
                                        InputType.email,
                                      );
                                    },
                                    inputType: TextInputType.emailAddress,
                                  ),
                                  const SizedBox(height: 10),
                                  CustomFields(
                                    title: "password",
                                    icon: Icon(Icons.lock),
                                    controller: passwordController,
                                    validator: (String? password) {
                                      return controller.valideInputes(
                                        password!,
                                        InputType.password,
                                      );
                                    },
                                    inputType: TextInputType.visiblePassword,
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: GetBuilder<AuthenticationController>(
                                      builder:
                                          (controller) =>
                                              controller.getIndex ==
                                                      AuthenticationType.login
                                                  ? TextButton(
                                                    onPressed:
                                                        () => Get.toNamed(
                                                          "/auth/forgot-password",
                                                        ),
                                                    child: Text(
                                                      "Forgot password?",
                                                      style: TextStyle(
                                                        color: theme.onTertiary,
                                                      ),
                                                    ),
                                                  )
                                                  : SizedBox(),
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  GetBuilder<AuthenticationController>(
                                    builder:
                                        (controller) => MaterialButton(
                                          onPressed: () {
                                            if (formKey.currentState!
                                                .validate()) {
                                              if (controller.getIndex ==
                                                  AuthenticationType.login) {
                                                controller.login(
                                                  credentials: (
                                                    emailController.text,
                                                    passwordController.text,
                                                  ),
                                                );
                                              } else {
                                                controller.register(
                                                  credentials: (
                                                    nameController.text,
                                                    emailController.text,
                                                    passwordController.text,
                                                  ),
                                                );
                                              }
                                            }
                                          },
                                          height: 50,
                                          minWidth:
                                              width < 650
                                                  ? width * 0.7
                                                  : width * 0.4,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                          ),
                                          color: theme.onTertiary,
                                          child: Text(
                                            "Sign in with Hankalis",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
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
      ),
    );
  }
}
