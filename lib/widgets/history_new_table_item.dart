import 'package:flutter/material.dart';
import 'package:hankalis_clan/widgets/new.dart';

TableRow historyNewTableItem({
  required BuildContext context,
  required String news,
  required NewType type,
  required String date,
}) {
  final theme = Theme.of(context).colorScheme;
  return TableRow(
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(color: theme.onPrimaryContainer)),
    ),
    children: [
      Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border(right: BorderSide(color: theme.onPrimaryContainer)),
        ),
        child: Text(news, textAlign: TextAlign.center, overflow: TextOverflow.ellipsis, maxLines: 1),
      ),
      Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border(right: BorderSide(color: theme.onPrimaryContainer)),
        ),
        child: Text(type == NewType.danger ? "danger" : type == NewType.warning ? "warning" : "info", textAlign: TextAlign.center),
      ),
      Container(
        padding: const EdgeInsets.all(5),
        child: Text(date, textAlign: TextAlign.center),
      ),
    ],
  );
}
