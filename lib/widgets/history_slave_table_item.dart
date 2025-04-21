import 'package:flutter/material.dart';

TableRow historySlaveTableItem({
  required BuildContext context,
  required String master,
  required String slave,
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
        child: Text(master, textAlign: TextAlign.center),
      ),
      Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border(right: BorderSide(color: theme.onPrimaryContainer)),
        ),
        child: Text(slave, textAlign: TextAlign.center),
      ),
      Container(
        padding: const EdgeInsets.all(5),
        child: Text(date, textAlign: TextAlign.center),
      ),
    ],
  );
}
