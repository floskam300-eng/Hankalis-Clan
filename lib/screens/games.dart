import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:hankalis_clan/widgets/categories_games.dart';
import 'package:hankalis_clan/widgets/custom_buttons.dart';
import 'package:hankalis_clan/widgets/game.dart';

class Games extends StatelessWidget {
  const Games({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Expanded(
      child: Column(
        children: [
          CategoriesGames(),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: theme.onPrimaryContainer),
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: theme.onPrimary,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      border: Border(
                        bottom: BorderSide(color: theme.onPrimaryContainer),
                      ),
                    ),
                    child: Center(child: Text("Games")),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Bubble(
                              alignment: Alignment.center,
                              color: theme.onPrimary,
                              child: Text(
                                'YASTERDAY',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 11.0),
                              ),
                            ),
                            SizedBox(height: 10),
                            Game(
                              isSender: true,
                              isLose: false,
                              photo: "../assets/win-game.jpg",
                              winner: "3mor",
                              loser: "7mod",
                              winnerScore: 30,
                              loserScore: 26,
                              game: "Valorant",
                            ),
                            SizedBox(height: 10),
                            Game(
                              game: "Rocket League",
                              isSender: false,
                              isLose: true,
                              photo: "../assets/lose-game.jpg",
                              winner: "7mod",
                              loser: "3mor",
                              winnerScore: 6,
                              loserScore: 5,
                            ),
                            SizedBox(height: 10),
                            Bubble(
                              margin: BubbleEdges.only(top: 10),
                              alignment: Alignment.center,
                              nip: BubbleNip.no,
                              color: theme.onPrimary,
                              child: Text(
                                'TODAY',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 11.0),
                              ),
                            ),
                            SizedBox(height: 10),
                            Game(
                              isSender: true,
                              isLose: false,
                              photo: "../assets/win-game.jpg",
                              winner: "3mor",
                              loser: "7mod",
                              winnerScore: 30,
                              loserScore: 26,
                              game: "Valorant",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: theme.onPrimaryContainer),
                      ),
                    ),
                    child: CustomButtons(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add),
                          SizedBox(width: 5),
                          Text("Add new game"),
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
    );
  }
}
