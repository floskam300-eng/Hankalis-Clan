// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Game extends StatelessWidget {
  const Game({
    super.key,
    required this.isSender,
    required this.isLose,
    required this.photo,
    required this.winner,
    required this.loser,
    required this.winnerScore,
    required this.loserScore,
    required this.game,
  });

  final bool isSender;
  final bool isLose;
  final String photo, winner, loser, game;
  final int winnerScore, loserScore;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Align(
      alignment: isSender ? Alignment.topRight : Alignment.topLeft,
      child: Container(
        height: 330,
        constraints: BoxConstraints(maxWidth: 270),
        decoration: BoxDecoration(
          border: Border.all(color: theme.onPrimaryContainer),
          color: theme.onPrimary,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          children: [
            Container(
              height: 40,
              decoration: BoxDecoration(
                color:
                    isLose
                        ? Colors.red.withOpacity(0.1)
                        : Colors.green.withOpacity(0.1),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                border: Border(
                  bottom: BorderSide(color: theme.onPrimaryContainer),
                ),
              ),
              child: Center(
                child: Text(
                  isLose ? "You Lose" : "You Win",
                  style: TextStyle(
                    color: isLose ? Colors.red : Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Get.generalDialog(
                    pageBuilder:
                        (context, animation, secondaryAnimation) => Scaffold(
                          backgroundColor: Colors.transparent,
                          body: Stack(
                            children: [
                              Positioned.fill(
                                child: GestureDetector(
                                  onTap: () => Get.back(),
                                  behavior: HitTestBehavior.opaque,
                                ),
                              ),
                              Center(
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(
                                    maxWidth: Get.width * 0.8,
                                    maxHeight: Get.height * 0.8,
                                  ),
                                  child: Hero(
                                    tag: photo,
                                    child: InteractiveViewer(
                                      child: MouseRegion(
                                        cursor: SystemMouseCursors.grab,
                                        child: Image.asset(
                                          photo,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                  );
                },
                child: Hero(
                  tag: photo,
                  child: MouseRegion(
                    cursor: SystemMouseCursors.zoomIn,
                    child: Image.asset(photo, fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
            Container(
              height: 110,
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color:
                    isLose
                        ? Colors.red.withOpacity(0.1)
                        : Colors.green.withOpacity(0.1),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                border: Border(
                  top: BorderSide(color: theme.onPrimaryContainer),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          winner,
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("   VS   ", style: TextStyle(fontSize: 12)),
                        Text(
                          loser,
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          winnerScore.toString(),
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("   VS   ", style: TextStyle(fontSize: 12)),
                        Text(
                          loserScore.toString(),
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(color: theme.onPrimaryContainer),
                  Text(
                    game,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
