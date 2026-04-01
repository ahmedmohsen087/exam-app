import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/features/Home/presentation/pages/profile_screen.dart';
import 'package:exam_app/features/Home/presentation/pages/result_screen.dart';


import 'package:flutter/material.dart';

import '../../../../core/values/images.dart';
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

  bool  isSelected = true;

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
              icon: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.lightBlue : Colors.transparent,
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(16),
                    right: Radius.circular(16),

                  ),
                ),

                  child: Image.asset(AppImages.exploreIcon)),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(AppImages.resultIcon),
              label: 'Result',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(AppImages.profileIcon),
              label: 'Profile',
            ),
          ]
      ),
      body: tabs[selectedIndex],
    );
  }
}