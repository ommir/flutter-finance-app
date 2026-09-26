import 'package:flutter/material.dart';
import 'package:flutter_finance_app/common/common_appbar.dart';
import 'package:flutter_finance_app/constant.dart';
import 'package:flutter_finance_app/stats/info_card.dart';
import 'package:flutter_finance_app/stats/model/monthly_spending.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  final data = [
    MonthlySpending("Aug", 32000, 22000),
    MonthlySpending("Oct", 35000, 26000),
    MonthlySpending("Nov", 26000, 38000),
    MonthlySpending("Dec", 30000, 18000),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CommonAppBar(title: "Statics"),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(AppSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Total Spending",
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 14,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$35,000",
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "Monthly",
                        style: TextStyle(fontFamily: "Inter", fontSize: 14),
                      ),
                      SizedBox(height: 4),
                      Icon(Icons.expand_more),
                    ],
                  ),
                ],
              ),

              _barChat(data),

              const SizedBox(height: 24),

              Row(
                children: [
                  Expanded(
                    child: InfoCard(
                      icon: Icons.account_balance_wallet,
                      label: "Income",
                      amount: "\$20,000",
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: InfoCard(
                      icon: Icons.credit_card,
                      label: "Expenses",
                      amount: "\$10,000",
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),
              const Text(
                "Recent Transaction",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              _recentTransaction(
                title: "Netflix Subscription",
                date: "Today, 12:00 PM",
                amount: "-\$80.25",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _recentTransaction({
    required String title,
    required date,
    required String amount,
  }) {
    return Container(
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [AppShadow.soft],
      ),
      child: Row(
        children: [
          Container(
            height: 44,
            width: 44,
            decoration: BoxDecoration(
              color: AppColors.primaryBrown.withValues(alpha: 0.12),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.movie, color: AppColors.primaryBrown),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  date,
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 13,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),

          Text(
            amount,
            style: TextStyle(
              fontFamily: "Inter",
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _barChat(List<MonthlySpending> data) {
    const maxValue = 40000.0;
    return SizedBox(
      height: 220,
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(width: 30),
              Expanded(child: Divider()),
            ],
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(width: 30),
                ...data.map((item) {
                  return Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            _bar(
                              height: 160 * (item.previous / maxValue),
                              color: Colors.grey.shade200,
                            ),

                            _bar(
                              height: 160 * (item.value / maxValue),
                              color: AppColors.primaryBrown,
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          item.month,
                          style: TextStyle(fontFamily: "Inter", fontSize: 13),
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _bar({required double height, required Color color}) {
    return Container(
      width: 22,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
