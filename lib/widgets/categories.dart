import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:hankalis_clan/controller/leaderboard_controller.dart';
import 'package:hankalis_clan/widgets/category.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    return GetBuilder<LeaderboardController>(
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
                      Category(title: "Valorant", index: 0),
                      Category(title: "Rocket League", index: 1),
                      Category(title: "MineCraft", index: 2),
                      Category(title: "Stronghold Legends", index: 3),
                      Category(title: "Brawlhala", index: 4),
                      Category(title: "Pubg Mobile", index: 5),
                      Category(title: "All", index: 6),
                    ],
                  ),
                ),
              ),
            ),
          ),
    );
  }
}
