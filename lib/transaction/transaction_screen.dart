import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_finance_app/common/common_appbar.dart';
import 'package:flutter_finance_app/constant.dart';
import 'package:flutter_finance_app/home/model/transaction_item.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key, this.category, this.categoryIcon});

  final String? category;
  final IconData? categoryIcon;

  @override
  Widget build(BuildContext context) {
    List<TransactionItem> transactions = [];

    if (category != null) {
      final random = Random();
      List<String> names = [];
      switch (category) {
        case "Internet":
          names = [
            'Comcast',
            'AT&T',
            'Verizon Fios',
            'Spectrum',
            'Cox Internet',
          ];
          break;
        case "Electricity":
          names = [
            'PG&E',
            'ConEdison',
            'Duke Energy',
            'National Card',
            'NextEra Energy',
          ];
          break;
        case "Mobile":
          names = [
            'T-Mobile',
            'AT&T',
            'Verizon',
            'Mint Mobile',
            'Cricket Wireless',
          ];
          break;
        case "Water Bill":
          names = [
            'American Water',
            'City Water',
            'Aqua America',
            'Water Utility',
            'Municipal Water',
          ];
          break;
        case "Gas Bill":
          names = [
            'SoCalGas',
            'Atmos Energy',
            'CenterPoint Energy',
            'Spire',
            'Southwest Gas',
          ];
          break;
        case "TV":
          names = ['Netflix', 'Disney+', 'Hulu', 'YouTube TV', 'HBO Max'];
          break;
        case "Merchant":
          names = ['Amazon', 'Walmart', 'Target', 'Starbucks', 'McDonald\'s'];
          break;
        default:
          names = [
            '$category Payment',
            '$category Bill',
            '$category Service',
            '$category Subscription',
          ];
          break;
      }

      final dates = [
        'Today, 10:00 AM',
        'Yesterday, 02:00 AM',
        'Last Week',
        '12 Oct, 09:00 AM',
        '01 Oct, 11:30 AM',
      ];

      transactions = List.generate(10, (index) {
        final name = names[random.nextInt(names.length)];
        final date = dates[random.nextInt(dates.length)];
        final amount = -(random.nextDouble() * 150 + 10);

        return TransactionItem(
          title: name,
          date: date,
          amount: amount,
          icon: categoryIcon ?? Icons.payment,
          type: 'payment',
        );
      });
    } else {
      transactions = [
        TransactionItem(
          title: "Netflix Subscription",
          date: "Today, 12:00 PM",
          amount: -80.25,
          icon: Icons.movie,
          type: 'payment',
        ),
        TransactionItem(
          title: "Apple Store",
          date: "Today, 06:00 AM",
          amount: -50.25,
          icon: Icons.apple,
          type: 'payment',
        ),
        TransactionItem(
          title: "Nike Shoes",
          date: "Today, 08:00 AM",
          amount: -20.12,
          icon: Icons.apple,
          type: 'payment',
        ),
        TransactionItem(
          title: "Starbucks Coffee",
          date: "Today, 09:00 AM",
          amount: -60.00,
          icon: Icons.local_cafe,
          type: 'payment',
        ),
        TransactionItem(
          title: "James Bond",
          date: "Yesterday, 09:00 AM",
          amount: 200.00,
          icon: Icons.person,
          type: 'send',
        ),
      ];
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CommonAppBar(
        title: category != null ? "$category" : "Transaction",
      ),
      body: Padding(
        padding: EdgeInsets.all(AppSpacing.md),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 56,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF9F9F9),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0xFFEEEEEE)),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: AppColors.textSecondary,
                          size: 22,
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Search transaction...",
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                fontFamily: "Inter",
                                fontSize: 15,
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ),
                        ),
                        Icon(
                          Icons.mic,
                          color: AppColors.textSecondary,
                          size: 22,
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(width: 12),
                Container(
                  height: 56,
                  width: 56,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEA5C4F),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(Icons.tune, color: Colors.white, size: 24),
                ),
              ],
            ),

            const SizedBox(height: AppSpacing.lg),
            Expanded(
              child: ListView.builder(
                itemCount: transactions.length,
                padding: const EdgeInsets.only(bottom: 20),
                itemBuilder: (context, index) {
                  final item = transactions[index];
                  return _transactionTile(item);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _transactionTile(TransactionItem item) {
    final isPositive = item.amount > 0;
    final badgeColor = item.type == "payment"
        ? const Color(0xFFFF6D6D)
        : Colors.blue;
    final badgeText = item.type == "payment" ? "Payment" : "Send Money";

    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFF5F5F5)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 52,
            width: 52,
            decoration: BoxDecoration(
              color: const Color(0xFFF5F0EB),
              shape: BoxShape.circle,
            ),
            child: Icon(item.icon, color: const Color(0xFF7A5C4F), size: 26),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  item.date,
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 13,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${isPositive ? "+" : "-"}\$${item.amount.abs().toStringAsFixed(2)}',
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                decoration: BoxDecoration(
                  color: badgeColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Text(
                  badgeText,
                  style: TextStyle(
                    fontSize: 11,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w600,
                    color: badgeColor
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
