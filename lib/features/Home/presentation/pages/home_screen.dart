import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/features/Home/presentation/pages/profile_screen.dart';
import 'package:exam_app/features/Home/presentation/pages/result_screen.dart';


import 'package:flutter/material.dart';

import 'explore_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'Home Screen';

   HomeScreen({super.key});
  int selectedIndex = 0;
  List<Widget> tabs = [
    ExploreScreen(),
    ResultScreen(),
    ProfileScreen(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Survey',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: AppColors.blue,
            fontWeight: FontWeight.bold, // optional
          ),
        ),
        centerTitle: false, // aligns to left
        backgroundColor: AppColors.white, // optional, depends on your theme
        elevation: 0, // optional, removes shadow
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.white,
          onTap: (index){
            selectedIndex = index;
          },
          currentIndex: selectedIndex,
          items:[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Result',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ]
      ),
      body: tabs[selectedIndex],
    );
  }
}