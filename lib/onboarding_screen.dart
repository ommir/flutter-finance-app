import 'package:flutter/material.dart';
import 'package:flutter_finance_app/animated_illustration.dart';
import 'package:flutter_finance_app/constant.dart';
import 'package:flutter_finance_app/create_account_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  bool get isLastpage => _currentIndex == _pages.length - 1;

  final List<_OnboardingPageData> _pages = [
    _OnboardingPageData(
      highlightText: "Take control",
      normalText: " of your money\nlike never before!",
      subtitle: "Track expenses, make payments, and manage your money securly in one place",
      image: "assets/images/board_bg.png",
    ),
    _OnboardingPageData(
      highlightText: "Spend smarter",
      normalText: " every day with smarter tools in one app!",
      subtitle: "Monitor spending, pay securely, and stay in control of your money in one place",
      image: "assets/images/board.png",
    ),
    _OnboardingPageData(
      highlightText: "Pay for everything",
      normalText: " easily and\nconveniently!",
      subtitle:
      "Handle all your payments easily, anytime, from one secure app.",
      image: "assets/images/board_bg.png",
    ),
  ];

  void _next() {
    if (isLastpage) {
      _navigateToCreateAccount();
    } else {
      _controller.nextPage(
          duration: Duration(milliseconds: 400), curve: Curves.easeInOutCubic);
    }
  }

  void _navigateToCreateAccount() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => CreateAccountScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Color(0xFFFBFDFB), Color(0xFFF5F9F5)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.lg,
                  vertical: AppSpacing.sm,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: AppColors.primaryBrown,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.account_balance_wallet_rounded,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        ),

                        SizedBox(width: 8),
                        Text(
                          "FinePay",
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 0.5,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ],
                    ),

                    if (isLastpage)
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          foregroundColor: AppColors.textSecondary,
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(20),
                            side: BorderSide(
                              color: AppColors.border.withValues(alpha: 0.5),
                            ),
                          ),
                        ),
                        child: Text(
                          "Skip",
                          style: TextStyle(
                            fontSize: 13,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                  ],
                ),
              ),

              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  itemCount: _pages.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  itemBuilder: (_, index) {
                    final page = _pages[index];
                    return LayoutBuilder(
                      builder: (context, consraints) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppSpacing.lg,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: AppSpacing.md),
                              RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    fontFamily: "Inter",
                                    fontSize: 28,
                                    fontWeight: FontWeight.w800,
                                    height: 1.25,
                                    color: AppColors.textPrimary,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: page.highlightText,
                                      style: TextStyle(
                                        color: AppColors.primaryBrown,
                                      ),
                                    ),
                                    TextSpan(text: page.normalText),
                                  ],
                                ),
                              ),

                              SizedBox(height: AppSpacing.sm),
                              Text(
                                page.subtitle,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w400,
                                  height: 1.5,
                                  color: AppColors.textSecondary,
                                ),
                              ),

                              Spacer(),
                              Center(
                                child: AnimatedIllustration(
                                  child: _buildAnimatedIllustration(
                                    index,
                                    page.image,
                                    consraints.maxHeight * 0.45,
                                  ),
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),

              Padding(
                padding: EdgeInsets.all(AppSpacing.lg),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        _pages.length,
                            (i) => _IndicatorDot(isActive: i == _currentIndex),
                      ),
                    ),
                    SizedBox(height: AppSpacing.xl),
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: _next,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryBrown,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    AppRadius.button)
                            )
                        ),
                        child: AnimatedSwitcher(
                          duration: Duration(milliseconds: 200),
                          child: Text(
                            isLastpage ? "Get Started" : "Continue",
                            key: ValueKey(isLastpage),
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedIllustration(int index,
      String imagePath,
      double maxHeight,) =>
      SizedBox(
        height: maxHeight,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              child: Container(
                width: maxHeight * 0.8,
                height: maxHeight * 0.8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      AppColors.indicatorActive.withValues(alpha: 0.12),
                      AppColors.indicatorActive.withValues(alpha: 0.0),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 20,
              left: 40,
              child: Container(
                width: maxHeight * 0.4,
                height: maxHeight * 0.4,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      AppColors.primaryBrown.withValues(alpha: 0.08),
                      AppColors.primaryBrown.withValues(alpha: 0.0),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: maxHeight * 0.9,
              width: maxHeight * 0.47,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: Color(0xFF1A1A1A).withValues(alpha: 0.85),
                  width: 5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.12),
                    blurRadius: 24,
                    offset: Offset(0, 12),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(19),
                child: Image.asset(imagePath, fit: BoxFit.cover),
              ),
            ),
            if (index == 0) ...[
              Positioned(
                bottom: maxHeight * 0.12,
                right: maxHeight * 0.05,
                child: _buildFloatingCard(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Color(0xFFE7F4E5),
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          "assets/icons/wallet.png",
                          width: 20,
                          height: 20,
                        ),
                      ),
                      SizedBox(width: 8),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Total Balance",
                            style: TextStyle(
                              fontSize: 10,
                              fontFamily: "Inter",
                              color: AppColors.textSecondary,
                            ),
                          ),
                          Text(
                            "\$12,480.00",
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ] else
              if (index == 1) ...[
                Positioned(
                  top: maxHeight * 0.15,
                  left: maxHeight * 0.05,
                  child: Container(
                    width: maxHeight * 0.36,
                    height: maxHeight * 0.22,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.18),
                          blurRadius: 12,
                          offset: Offset(0, 6),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        "assets/icons/card_second.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ] else
                if (index == 2) ...[
                  Positioned(
                    top: maxHeight * 0.2,
                    right: maxHeight * 0.02,
                    child: _buildFloatingCard(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              color: Color(0xFFE7F4E5),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Icon(
                                Icons.check_circle_rounded,
                                color: AppColors.indicatorActive,
                                size: 20,
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Payment Sent",
                                style: TextStyle(
                                  fontSize: 9,
                                  color: AppColors.textSecondary,
                                  fontFamily: "Inter",
                                ),
                              ),
                              Text(
                                "Succesful",
                                style: TextStyle(
                                  fontFamily: "Inter",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w800,
                                  color: AppColors.indicatorActive,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
          ],
        ),
      );

  Widget _buildFloatingCard({required Widget child}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 16,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: child,
    );
  }
}

class _OnboardingPageData {
  final String highlightText;
  final String normalText;
  final String subtitle;
  final String image;

  _OnboardingPageData({
    required this.highlightText,
    required this.normalText,
    required this.subtitle,
    required this.image,
  });
}

class _IndicatorDot extends StatelessWidget {
  const _IndicatorDot({required this.isActive});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 4),
      height: 7,
      width: isActive ? 24 : 7,
      decoration: BoxDecoration(
        color: isActive
            ? AppColors.indicatorActive
            : AppColors.indicatorInactive,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
