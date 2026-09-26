import 'package:flutter/material.dart';
import 'package:flutter_finance_app/common/common_appbar.dart';
import 'package:flutter_finance_app/constant.dart';
import 'package:flutter_finance_app/transfer/transfer_success_dialog.dart';

class ReviewTransferView extends StatelessWidget {
  const ReviewTransferView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CommonAppBar(title: "Review"),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppSpacing.md),
          child: Column(
            children: [
              const Text(
                "Confirm To Transfer Money",
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 24),
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

              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  children: [
                    _DetailRow(
                      label: "Transaction ID",
                      value: "TXN 3012155",
                      boldValue: true,
                      avatar: false,
                    ),
                    _Divider(),
                    _DetailRow(
                      label: "Recipient",
                      value: "Umar",
                      boldValue: false,
                      avatar: true,
                    ),
                    _Divider(),
                    _DetailRow(
                      label: "Amount",
                      value: "\$220.99",
                      boldValue: false,
                      avatar: true,
                    ),
                    _Divider(),
                    _DetailRow(
                      label: "Fees",
                      value: "\$0.00",
                      boldValue: false,
                      avatar: false,
                    ),
                    _Divider(),
                    _DetailRow(
                      label: "Total Amount",
                      value: "\$220.99",
                      boldValue: true,
                      avatar: false,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),
              Column(
                children: [
                  const Text(
                    "Reference",
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Tap to add a note",
                            style: TextStyle(
                              fontFamily: "Inter",
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ),
                        Text(
                          "0/50",
                          style: TextStyle(
                            fontFamily: "Inter",
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const Spacer(),
              GestureDetector(
                onTap: () {
                  showDialog(context: context, builder: (_) => const TransferSuccessDialog());
                },
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
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: const Text(
                    "Confirm & Transfer",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontFamily: "Inter",
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
}

class UserMini extends StatelessWidget {
  const UserMini({super.key, required this.name, required this.image});

  final String name, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(backgroundImage: NetworkImage(image), radius: 22),
        const SizedBox(height: 6),
        Text(name, style: TextStyle(fontFamily: "Inter", fontSize: 14)),
      ],
    );
  }
}

class _DetailRow extends StatelessWidget {
  const _DetailRow({
    super.key,
    required this.label,
    required this.value,
    required this.boldValue,
    required this.avatar,
  });

  final String label;
  final String value;
  final bool boldValue;
  final bool avatar;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(fontFamily: "Inter", color: AppColors.textSecondary),
        ),
        const Spacer(),
        if (avatar)
          CircleAvatar(
            radius: 10,
            backgroundImage: NetworkImage("https://i.pravatar.cc/400?img=2"),
          ),
        if (avatar) const SizedBox(width: 6),
        Text(
          value,
          style: TextStyle(
            fontFamily: "Inter",
            fontWeight: boldValue ? FontWeight.w600 : FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Divider(color: AppColors.divider, height: 1),
    );
  }
}
