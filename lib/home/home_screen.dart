import 'package:flutter/material.dart';
import 'package:flutter_finance_app/constant.dart';
import 'package:flutter_finance_app/home/model/payment_item_model.dart';
import 'package:flutter_finance_app/home/model/transaction_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBrown,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(color: AppColors.primaryBrown),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _headerTop(context),
                  SizedBox(height: 24),
                  Text(
                    "Money Spend",
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 6),
                  const Text(
                    "\$22,128,22",
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 24),
                  _quickActions(context),
                ],
              ),
            ),

            Positioned(
              top: 260,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(DashboardSizes.headerRadius),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      paymentListGrid(context),
                      SizedBox(height: 24),
                      promoCard(),
                      SizedBox(height: 24),
                      recentTransaction(context),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget recentTransaction(BuildContext context) {
    final items = [
      TransactionItem(
        title: "Netflix Subscription",
        date: "Today, 12:00 PM",
        amount: -80.25,
        type: 'payment',
        icon: Icons.movie,
      ),
      TransactionItem(
        title: "Apple Store",
        date: "Today, 6:00 AM",
        amount: -180.25,
        type: 'payment',
        icon: Icons.apple,
      ),
    ];

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Recent Transaction",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                fontFamily: "Inter",
                color: AppColors.primaryBrown,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Column(
          children: items.map((item) {
            final isPositive = item.amount > 0;
            final badgeColor = item.type == "payment"
                ? Colors.red
                : Colors.blue;
            final badgeText = item.type == "payment" ? "Payment" : "Send Money";

            return GestureDetector(
              child: Container(
                margin: EdgeInsets.only(bottom: 12),
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
                        color: AppColors.primaryBrown.withValues(alpha: 0.22),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(item.icon, color: AppColors.primaryBrown),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.title,
                            style: const TextStyle(
                              fontFamily: "Inter",
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            item.date,
                            style: TextStyle(
                              fontSize: 13,
                              fontFamily: "Inter",
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "${isPositive ? "+" : "-"}\$${item.amount.abs().toStringAsFixed(2)}",
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: badgeColor.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            badgeText,
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 12,
                              color: badgeColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget promoCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Promo & Discount",
          style: TextStyle(
            fontSize: 18,
            fontFamily: "Inter",
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          height: 120,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.primaryBrown.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Today's Promo",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Inter",
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "Get discount for every top-up, \ntransfer and payment",
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 13,
                      height: 1.4,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
              const Text(
                "40%",
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryBrown,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget paymentListGrid(BuildContext context) {
    final items = [
      PaymentItem('Internet', Icons.wifi, Color(0xFFF6E7CE)),
      PaymentItem('Electricity', Icons.bolt, Color(0xFFF9DFD8)),
      PaymentItem('Mobile', Icons.phone_android, Color(0xFFE2F1D6)),
      PaymentItem('Water Bill', Icons.water_drop, Color(0xFFF4DCDC)),
      PaymentItem('Gas Bill', Icons.local_gas_station, Color(0xFFE4F2D8)),
      PaymentItem('TV', Icons.tv, Color(0xFFDCE7F6)),
      PaymentItem('Merchant', Icons.shopping_cart, Color(0xFFE0F4F1)),
      PaymentItem('More', Icons.apps, Color(0xFFE8DDF5)),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Payment List",
          style: TextStyle(
            fontFamily: "Inter",
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 0.9,
          ),
          itemBuilder: (context, index) {
            final item = items[index];
            return GestureDetector(
              child: Column(
                children: [
                  Container(
                    height: 56,
                    width: 56,
                    decoration: BoxDecoration(
                      color: item.color,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(item.icon, color: Colors.black54),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item.title,
                    style: const TextStyle(fontFamily: "Inter", fontSize: 12),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _quickActions(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _quickIcon(Icons.account_balance_wallet, () => {}),
        _quickIcon(Icons.swap_horiz, () => {}),
        _quickIcon(Icons.credit_card, () => {}),
        _quickIcon(Icons.savings, () => {}),
      ],
    );
  }

  Widget _quickIcon(IconData icon, Function()? onPressed) {
    return Container(
      height: DashboardSizes.iconCircle,
      width: DashboardSizes.iconCircle,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.2),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, color: Colors.white),
      ),
    );
  }

  Widget _headerTop(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Good Morning",
              style: TextStyle(
                fontFamily: "Inter",
                fontSize: 14,
                color: Colors.white70,
              ),
            ),
            SizedBox(height: 4),
            Text(
              "Hello, Miraz",
              style: TextStyle(
                fontFamily: "Inter",
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ],
        ),
        Row(
          children: [
            GestureDetector(child: _circleIcon(Icons.notifications_none)),
            SizedBox(width: 10),
            GestureDetector(child: _circleIcon(Icons.fingerprint)),
          ],
        ),
      ],
    );
  }

  Container _circleIcon(IconData icon) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.2),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.white),
    );
  }
}
