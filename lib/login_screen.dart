import 'package:flutter/material.dart';
import 'package:flutter_finance_app/constant.dart';
import 'package:flutter_finance_app/create_account_screen.dart';
import 'package:flutter_finance_app/otp_verification_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.lg,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                style: IconButton.styleFrom(
                  backgroundColor: const Color(0xFFF5F5F5),
                  shape: const CircleBorder(),
                ),
                icon: Icon(Icons.arrow_back_ios_new),
              ),
              const SizedBox(height: AppSpacing.lg),
              const Text(
                "Welcome Back",
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              const Text(
                "Log in to securely access your account and manage your money to anytime.",
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 14,
                  height: 1.5,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: AppSpacing.xl),
              _label("Email or phone"),
              MyInputField(hint: "Enter email address"),
              const SizedBox(height: AppSpacing.md),
              _label("Password"),
              MyInputField(
                hint: "Enter password",
                obscureText: _obscurePassword,
                suffix: IconButton(
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                  icon: Icon(
                    _obscurePassword
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Biometric Login",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: "Inter",
                      color: AppColors.textSecondary,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Forgot Password",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryBrown,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.lg),
              MyPrimaryButton(
                title: "Login",
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OtpVerificationScreen(),
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              Row(
                children: const [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      "Or continue with",
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 13,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              const SizedBox(height: AppSpacing.lg),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _socialIcon("assets/icons/google.png"),
                  _socialIcon("assets/icons/communication.png"),
                  _socialIcon("assets/icons/telegram.png"),
                ],
              ),
              const SizedBox(height: AppSpacing.xl),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CreateAccountScreen()));
                  },
                  child: RichText(
                    text: const TextSpan(
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 14,
                          color: AppColors.textSecondary,
                        ),
                        children: [
                          TextSpan(text: "Don't have an account? "),
                          TextSpan(text: "Create Account", style: TextStyle(
                              fontFamily: "Inter",
                              color: AppColors.primaryBrown,
                              fontWeight: FontWeight.w600
                          ))
                        ]
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _socialIcon(String imagePath) {
    return Container(
      height: 52,
      width: 52,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: const [AppShadow.soft],
      ),
      child: Center(child: Image.asset(imagePath, height: 22)),
    );
  }

  Padding _label(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: "Inter",
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }
}

class MyPrimaryButton extends StatelessWidget {
  const MyPrimaryButton({super.key, this.title = "", this.onPressed});

  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryBrown,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.button),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontFamily: "Inter",
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
