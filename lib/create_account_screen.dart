import 'package:flutter/material.dart';
import 'package:flutter_finance_app/constant.dart';
import 'package:flutter_finance_app/login_screen.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
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
              const Text(
                "Create An Account",
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              const Text(
                "Create an account to securely manage your money and access essential banking features",
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 14,
                  height: 1.5,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: AppSpacing.xl),
              _label("Full Name"),
              MyInputField(hint: "Full name"),
              const SizedBox(height: AppSpacing.md),
              _label("Email or Phone"),
              MyInputField(hint: "Enter email or phone number"),
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
              const Text(
                "By starting my application, I agree to Financer's Terms of service and Privacy Policy",
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 12,
                  height: 1.5,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryBrown,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppRadius.button),
                    ),
                  ),
                  child: Text(
                    "Create An Account",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 14,
                        color: AppColors.textSecondary,
                      ),
                      children: [
                        TextSpan(text: "Already have an account? "),
                        TextSpan(text: "Login", style: TextStyle(
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

class MyInputField extends StatelessWidget {
  const MyInputField({
    super.key,
    required this.hint,
    this.obscureText = false,
    this.suffix,
  });

  final String hint;
  final bool obscureText;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppInput.height,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppInput.radius),
        boxShadow: const [AppShadow.soft],
      ),
      child: Center(
        child: TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hint,
            border: InputBorder.none,
            hintStyle: const TextStyle(
              fontFamily: "Inter",
              color: AppColors.textSecondary,
            ),
            suffixIcon: suffix,
          ),
        ),
      ),
    );
  }
}
