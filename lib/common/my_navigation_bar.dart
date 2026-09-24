import 'package:flutter/material.dart';
import 'package:flutter_finance_app/common/nav_item.dart';

class MyNavigationBar extends StatelessWidget {
  const MyNavigationBar({super.key, required this.currentIndex, required this.onNavTap});

  final int currentIndex;
  final void Function(int) onNavTap;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      color: Colors.white,
      elevation: 4,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NavItem(
              icon: Icons.home,
              label: "Home",
              active: currentIndex == 0,
              onTap: () => onNavTap(0),
            ),
            NavItem(
              icon: Icons.bar_chart,
              label: "Static",
              active: currentIndex == 1,
              onTap: () => onNavTap(1),
            ),
            SizedBox(width: 40),
            NavItem(
              icon: Icons.credit_card,
              label: "My Cards",
              active: currentIndex == 3,
              onTap: () => onNavTap(3),
            ),
            NavItem(
              icon: Icons.person,
              label: "Profile",
              active: currentIndex == 4,
              onTap: () => onNavTap(4),
            ),
          ],
        ),
      ),
    );
  }
}
