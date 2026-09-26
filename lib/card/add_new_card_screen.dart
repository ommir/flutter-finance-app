import 'package:flutter/material.dart';
import 'package:flutter_finance_app/common/common_appbar.dart';
import 'package:flutter_finance_app/constant.dart';

class AddNewCardScreen extends StatefulWidget {
  const AddNewCardScreen({super.key});

  @override
  State<AddNewCardScreen> createState() => _AddNewCardScreenState();
}

class _AddNewCardScreenState extends State<AddNewCardScreen> {
  // Controllers & state yang tadinya undefined
  final TextEditingController holderCtrl = TextEditingController();
  final TextEditingController numberCtrl = TextEditingController();
  final TextEditingController expiryCtrl = TextEditingController();
  final TextEditingController cvvCtrl = TextEditingController();
  String cardType = "Visa";

  @override
  void dispose() {
    holderCtrl.dispose();
    numberCtrl.dispose();
    expiryCtrl.dispose();
    cvvCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CommonAppBar(title: "Add New Card"),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(AppSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _cardPreview(),
              const SizedBox(height: 24),
              _label("Card Type"),
              const SizedBox(height: 5),
              _dropDown(),
              const SizedBox(height: 16),
              _label("Card Holder Name"),
              _input(
                controller: holderCtrl,
                hint: "Card Holder Name",
                onChanged: (_) => setState(() {}),
              ),
              const SizedBox(height: 16),
              _label("Card Number"),
              const SizedBox(height: 5),
              _input(
                controller: numberCtrl,
                hint: "Card Number",
                keyboard: TextInputType.number,
                onChanged: (_) => setState(() {}),
              ),
              const SizedBox(height: 16),
              // Row ini SEBELUMNYA berisi tombol Save di dalamnya (bug: button
              // width: double.infinity di dalam Row tanpa Expanded -> crash/overflow).
              // Sekarang Row hanya berisi Expire & CVV.
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _label("Expire"),
                        const SizedBox(height: 5),
                        _input(
                          controller: expiryCtrl,
                          hint: "mm/yy",
                          keyboard: TextInputType.number,
                          onChanged: (_) => setState(() {}),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      // sebelumnya tanpa crossAxisAlignment -> label & input
                      // jadi center, tidak sejajar dengan kolom Expire
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _label("CVV"),
                        const SizedBox(height: 5),
                        _input(
                          controller: cvvCtrl,
                          hint: "CVV",
                          keyboard: TextInputType.number,
                          obscure: true,
                          onChanged: (_) => setState(() {}),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              // Tombol dipindah ke luar Row, full width di bawah form
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: proses simpan kartu (holderCtrl.text, numberCtrl.text,
                    // expiryCtrl.text, cvvCtrl.text, cardType)
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryBrown,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    "Save New Card",
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
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

  Widget _input({
    required TextEditingController controller,
    required String hint,
    TextInputType keyboard = TextInputType.text,
    bool obscure = false,
    Function(String)? onChanged,
  }) {
    return Container(
      height: 52,
      padding: EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [AppShadow.soft],
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboard,
        obscureText: obscure,
        onChanged: onChanged,
        decoration: InputDecoration(hintText: hint, border: InputBorder.none),
      ),
    );
  }

  Container _dropDown() {
    return Container(
      height: 52,
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [AppShadow.soft],
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          // sebelumnya tidak ada 'value' -> dropdown selalu tampil kosong
          // walau cardType sudah berubah
          value: cardType,
          isExpanded: true,
          items: const [
            DropdownMenuItem(value: "Visa", child: Text("Visa")),
            DropdownMenuItem(value: "Master Card", child: Text("Master Card")),
          ],
          onChanged: (value) {
            setState(() {
              cardType = value!;
            });
          },
        ),
      ),
    );
  }

  Text _label(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        fontFamily: "Inter",
      ),
    );
  }

  Container _cardPreview() {
    return Container(
      height: 190,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primaryBrown,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Positioned(
            right: -40,
            bottom: -40,
            child: Container(
              height: 140,
              width: 140,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.08),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    cardType == "Master Card" ? "MASTERCARD" : "VISA",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontFamily: "Inter",
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  numberCtrl.text.isEmpty
                      ? "**** **** **** ****"
                      : numberCtrl.text,
                  style: TextStyle(
                    fontSize: 22,
                    letterSpacing: 2,
                    color: Colors.white,
                    fontFamily: "Inter",
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _previewColumn(
                      "Card Holder",
                      holderCtrl.text.isEmpty ? "-------" : holderCtrl.text,
                    ),
                    _previewColumn(
                      "Expire",
                      expiryCtrl.text.isEmpty ? "--/--" : expiryCtrl.text,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column _previewColumn(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontFamily: "Inter",
            color: Colors.white70,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            fontFamily: "Inter",
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}