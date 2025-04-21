import 'package:flutter/material.dart';
import 'package:hankalis_clan/widgets/categories.dart';
import 'package:hankalis_clan/widgets/overview.dart';
import 'package:hankalis_clan/widgets/ranks.dart';

class Leaderboard extends StatelessWidget {
  const Leaderboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              Text(
                "Leaderboard",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              const SizedBox(height: 10),
              Categories(),
              const SizedBox(height: 10),
              Ranks(),
              Overview(),
            ],
          ),
        ),
      ),
    );
  }
}
