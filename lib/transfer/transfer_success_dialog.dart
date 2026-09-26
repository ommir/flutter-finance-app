import 'package:flutter/material.dart';
import 'package:flutter_finance_app/constant.dart';
import 'package:flutter_finance_app/dashboard_screen.dart';
import 'package:flutter_finance_app/login_screen.dart';
import 'package:flutter_finance_app/transfer/review_transfer_view.dart';

class TransferSuccessDialog extends StatelessWidget {
  const TransferSuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.bgOverlay,
      child: Center(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 20),
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(22),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 72,
                width: 72,
                decoration: BoxDecoration(
                  color: const Color(0xFFE7E4E5),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.check, color: AppColors.primaryBrown),
              ),
              const SizedBox(height: 16),
              const Text(
                "Transfer Success",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Inter",
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                "Below is your withdraw summary",
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 14,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 16),
              const Divider(color: AppColors.divider, thickness: 1),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Transfer Destination",
                  style: TextStyle(
                    fontFamily: "Inter",
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  UserMini(
                    name: "Mimir",
                    image: "https://i.pravatar.cc/400?img=1",
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      "To",
                      style: TextStyle(
                        fontFamily: "Inter",
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                  UserMini(
                    name: "Umar",
                    image: "https://i.pravatar.cc/400?img=2",
                  ),
                ],
              ),

              const SizedBox(height: 24),
              const Text(
                "Total Amount",
                style: TextStyle(
                  fontFamily: "Inter",
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                "\$220.99",
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 24),
              MyPrimaryButton(
                title: "Return to Home",
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardScreen()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
