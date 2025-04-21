import 'package:flutter/material.dart';
import 'package:hankalis_clan/widgets/activity_item.dart';

class NewsActivityWidget extends StatelessWidget {
  const NewsActivityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return GridView(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 180,
              mainAxisExtent: 140,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
            ),
            children: [
              ActivityItem(
                image: "../assets/news.png",
                title: "News",
                readedMsgs: 10,
                index: 0,
              ),
              ActivityItem(
                image: "../assets/buy.png",
                title: "Slaves",
                readedMsgs: 6,
                index: 1,
              ),
              ActivityItem(
                image: "../assets/sell.png",
                title: "Sell slave",
                readedMsgs: 8,
                index: 2,
              ),
              ActivityItem(
                image: "../assets/history-slave.png",
                title: "history of slaves",
                readedMsgs: 2,
                index: 3,
              ),
              ActivityItem(
                image: "../assets/order-history.png",
                title: "History of news",
                readedMsgs: 3,
                index: 4,
              ),
            ],
          );
        },
      ),
    );
  }
}
