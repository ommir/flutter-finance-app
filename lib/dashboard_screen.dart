import 'package:flutter/material.dart';
import 'package:flutter_finance_app/card/my_card_screen.dart';
import 'package:flutter_finance_app/common/my_navigation_bar.dart';
import 'package:flutter_finance_app/constant.dart';
import 'package:flutter_finance_app/home/home_screen.dart';
import 'package:flutter_finance_app/profile/profile_screen.dart';
import 'package:flutter_finance_app/stats/statistics_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int currentIndex = 0;

  List<Widget> screens = [
    HomeScreen(),
    StatisticsScreen(),
    SizedBox(),
    MyCardScreen(),
    ProfileScreen()
  ];

  void onBottomNavigationTap(int index) {
    currentIndex = index;
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: currentIndex, children: screens,),
      bottomNavigationBar: MyNavigationBar(
        currentIndex: currentIndex,
        onNavTap: (index) => onBottomNavigationTap(index),
      ),
      floatingActionButton: _fab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _fab() {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: AppColors.primaryBrown,
      child: Icon(Icons.fingerprint, color: Colors.white),
    );
  }
}
