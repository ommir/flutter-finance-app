import 'package:flutter/material.dart';
import 'package:flutter_finance_app/constant.dart';
import 'package:flutter_finance_app/notification/widget/notification_tile.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back_ios_new),
                    style: IconButton.styleFrom(
                      backgroundColor: const Color(0xFFF2F2F2),
                      shape: const CircleBorder(),
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    "Notification",
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      height: 52,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.search, color: AppColors.textSecondary),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              "Search Notification",
                              style: TextStyle(
                                fontFamily: "Inter",
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ),
                          Icon(Icons.mic, color: AppColors.textSecondary),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),
                  Container(
                    height: 52,
                    width: 52,
                    decoration: BoxDecoration(
                      color: AppColors.primaryBrown,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.tune, color: Colors.white),
                  ),
                ],
              ),

              const SizedBox(height: 24),
              const Text(
                "Today",
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),

              NotificationTile(
                icon: Icons.attach_money,
                title: "Cash Back Earned!",
                subTitle: "Your earned \$50 cashback!",
                time: "15:00",
              ),
              NotificationTile(
                icon: Icons.schedule,
                title: "Scheduled Payment Reminder",
                subTitle: "Payment processing today",
                time: "13:00",
              ),
              NotificationTile(
                icon: Icons.person,
                title: 'Profile Updated!',
                subTitle: 'Profile updated successfully',
                time: '12:00',
              ),
              NotificationTile(
                icon: Icons.call_received,
                title: 'Payment Request Received!',
                subTitle: 'You have a payment request',
                time: '07:00',
              ),

              const SizedBox(height: 20),
              const Text(
                "Yesterday",
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              NotificationTile(
                icon: Icons.credit_card,
                title: 'Card Linked Successfully!',
                subTitle: 'Card added successfully',
                time: '13:00',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
