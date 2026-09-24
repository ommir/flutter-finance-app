import 'package:flutter/material.dart';
import 'package:flutter_finance_app/constant.dart';
import 'package:flutter_finance_app/login_screen.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Container(
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x22000000),
                    blurRadius: 20,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 72,
                    width: 72,
                    decoration: BoxDecoration(
                      color: AppColors.primaryBrown.withValues(alpha: 0.12),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.verified,
                      size: 36,
                      color: AppColors.primaryBrown,
                    ),
                  ),
                  SizedBox(height: 20),
                  const Text(
                    "Enter Verification Code!",
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Enter the 4-digit verification code sent to your email address.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 14,
                      height: 1.5,
                      color: AppColors.textSecondary,
                    ),
                  ),

                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(4, (_) => OtpBox()),
                  ),
                  const SizedBox(height: 20),
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 14,
                        color: AppColors.textSecondary,
                      ),
                      children: [
                        TextSpan(text: "Didn't get the code "),
                        TextSpan(
                          text: "Resend it",
                          style: TextStyle(
                            color: AppColors.primaryBrown,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),
                  MyPrimaryButton(title: "Verify", onPressed: () {},)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class OtpBox extends StatelessWidget {
  const OtpBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppOtp.boxSize,
      width: AppOtp.boxSize,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppOtp.radius),
        boxShadow: [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: const Center(
        child: TextField(
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counterText: "",
            border: InputBorder.none,
          ),
          style: TextStyle(
            fontFamily: "Inter",
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
