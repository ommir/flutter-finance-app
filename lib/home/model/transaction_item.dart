import 'package:flutter/material.dart';

class TransactionItem {
  final String title;
  final String date;
  final dynamic amount;
  final String? type;
  final IconData icon;

  TransactionItem({
    required this.title,
    required this.date,
    required this.amount,
    this.type,
    required this.icon,
  });
}
