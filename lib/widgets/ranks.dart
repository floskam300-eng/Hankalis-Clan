import 'package:flutter/material.dart';
import 'package:hankalis_clan/widgets/leaderboard_item.dart';

class Ranks extends StatelessWidget {
  const Ranks({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Container(
      color: theme.onSecondary,
      height: 265,
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: double.infinity,
            width: 100,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                      color: theme.onPrimary,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(height: 30),
                    LeadboardItem(
                      leadNumber: 2,
                      photo: "../assets/my_photo.jpg",
                    ),
                    Text(
                      "Shamshom",
                      style: TextStyle(
                        fontWeight: FontWeight.w100,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('../assets/reward.png', height: 15),
                        SizedBox(width: 3),
                        Text(
                          "90 points",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xffC0C0C0),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            width: 100,
            height: double.infinity,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 190,
                    decoration: BoxDecoration(
                      color: theme.onPrimaryContainer,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    LeadboardItem(leadNumber: 1, photo: "../assets/eldoda.jpg"),
                    Text(
                      "7mod",
                      style: TextStyle(
                        fontWeight: FontWeight.w100,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('../assets/reward.png', height: 15),
                        SizedBox(width: 3),
                        Text(
                          "100 pts",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(255, 223, 116, 1),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: double.infinity,
            width: 100,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                      color: theme.onPrimary,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(height: 30),
                    LeadboardItem(
                      leadNumber: 3,
                      photo: "../assets/hankalis_logo.webp",
                    ),
                    Text(
                      "7zom",
                      style: TextStyle(
                        fontWeight: FontWeight.w100,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('../assets/reward.png', height: 15),
                        SizedBox(width: 3),
                        Text(
                          "5 points",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xffCE8946),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
