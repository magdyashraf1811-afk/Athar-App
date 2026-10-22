import 'package:athaar_app/home/tabs/home_tab/home_tab.dart';
import 'package:athaar_app/home/tabs/home_tab/horas_bottom_bar.dart';
import 'package:athaar_app/home/tabs/horus_tab/horus_tab.dart';
import 'package:athaar_app/home/tabs/profile_tab/profile_tab.dart';
import 'package:athaar_app/home/tabs/tickets_tab/tickets_tab.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;


  final List<Widget> tabsList = const [
    HomeTab(),
    TicketsTab(),
    HorusTab(),
    ProfileTab()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: tabsList[selectedIndex],
      bottomNavigationBar: HorusBottomNavBar(
        selectedIndex: selectedIndex,
        onItemSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}