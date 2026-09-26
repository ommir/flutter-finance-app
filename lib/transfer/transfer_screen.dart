import 'package:flutter/material.dart';
import 'package:flutter_finance_app/common/common_appbar.dart';
import 'package:flutter_finance_app/constant.dart';
import 'package:flutter_finance_app/transfer/review_transfer_view.dart';

class TransferScreen extends StatelessWidget {
  const TransferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CommonAppBar(title: "Transfer"),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Column(
            children: [
              SizedBox(
                height: 60,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _addUser(),
                    _userAvatar("https://i.pravatar.cc/400?img=12"),
                    _userAvatar("https://i.pravatar.cc/400?img=13"),
                    _userAvatar(
                      "https://i.pravatar.cc/400?img=14",
                      selected: true,
                    ),
                    _userAvatar("https://i.pravatar.cc/400?img=15"),
                    _userAvatar(
                      "https://i.pravatar.cc/400?img=16",
                      faded: true,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: NetworkImage(
                        "https://i.pravatar.cc/400?img=2",
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Miraz Dwi Noviansyah",
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "**** 8123",
                          style: TextStyle(
                            fontFamily: "Inter",
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primaryBrown.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "Change",
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryBrown,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontFamily: "Inter",
                    fontSize: 44,
                    fontWeight: FontWeight.w700,
                  ),
                  children: [
                    const TextSpan(
                      text: "\$",
                      style: TextStyle(color: AppColors.primaryBrown),
                    ),
                    TextSpan(
                      text: "400",
                      style: TextStyle(color: AppColors.textPrimary),
                    ),
                    const TextSpan(
                      text: "|",
                      style: TextStyle(
                        color: AppColors.primaryBrown,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 8),
              const Text(
                "Your Balance \$ 60,123 (Available)",
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 14,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 24),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReviewTransferView()),
                ),
                child: Container(
                  height: 56,
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.primaryBrown,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primaryBrown.withValues(alpha: 0.4),
                        blurRadius: 20,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  child: const Text(
                    "Continue",
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Expanded(child: _keyPad()),
            ],
          ),
        ),
      ),
    );
  }

  Container _addUser() {
    return Container(
      height: 60,
      width: 60,
      margin: EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: AppColors.primaryBrown,
        shape: BoxShape.circle,
      ),
      child: const Icon(Icons.add, color: Colors.white),
    );
  }

  Widget _keyPad() {
    final keys = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "*", "0", "del"];

    return GridView.builder(
      itemCount: keys.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        mainAxisExtent: 75,
      ),
      itemBuilder: (context, i) {
        if (keys[i] == "del") {
          return _keyButton(icon: Icons.backspace_outlined);
        } else {
          return _keyButton(text: keys[i]);
        }
      },
    );
  }

  Widget _keyButton({String? text, IconData? icon}) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF1F3F2),
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: icon != null
          ? Icon(icon)
          : Text(
              text!,
              style: TextStyle(
                fontFamily: "Inter",
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
    );
  }

  Widget _userAvatar(
    String image, {
    bool selected = false,
    bool faded = false,
  }) {
    return Container(
      margin: EdgeInsets.only(right: 12),
      padding: selected ? EdgeInsets.all(3) : EdgeInsets.zero,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: selected ? Border.all(color: AppColors.primaryBrown) : null,
      ),
      child: Opacity(
        opacity: faded ? 0.3 : 1,
        child: CircleAvatar(backgroundImage: NetworkImage(image), radius: 26),
      ),
    );
  }
}
