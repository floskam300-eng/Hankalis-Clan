import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:hankalis_clan/controller/games_controller.dart';
import 'package:hankalis_clan/widgets/category_games.dart';

class CategoriesGames extends StatelessWidget {
  const CategoriesGames({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    return GetBuilder<GamesController>(
      builder:
          (controller) => SizedBox(
            height: 60,
            width: double.infinity,
            child: Scrollbar(
              controller: scrollController,
              child: SingleChildScrollView(
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      CategoryGames(title: "Valorant", index: 0),
                      CategoryGames(title: "Rocket League", index: 1),
                      CategoryGames(title: "MineCraft", index: 2),
                      CategoryGames(title: "Stronghold Legends", index: 3),
                      CategoryGames(title: "Brawlhala", index: 4),
                      CategoryGames(title: "Pubg Mobile", index: 5),
                      CategoryGames(title: "All", index: 6),
                    ],
                  ),
                ),
              ),
            ),
          ),
    );
  }
}
