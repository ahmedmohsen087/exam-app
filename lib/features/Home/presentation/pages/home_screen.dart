import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/features/Home/presentation/pages/profile_screen.dart';
import 'package:exam_app/features/Home/presentation/pages/result_screen.dart';
import 'package:exam_app/features/Home/presentation/view_model/states/toggle_home_screen_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/values/images.dart';
import '../view_model/cubit/toggle_home_screen.dart';
import 'explore_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'Home Screen';

  HomeScreen({super.key});

  List<Widget> tabs = [
    ExploreScreen(),
    ResultScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ToggleHomeScreen(),
      child: BlocBuilder<ToggleHomeScreen, ToggleHomeScreenState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Survey',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: false,
              backgroundColor: AppColors.white,
              elevation: 0,
            ),

            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: AppColors.white,

              currentIndex: state.currentIndex,

              onTap: (index) {
                context.read<ToggleHomeScreen>().changeIndex(index);
              },

              items: [
                BottomNavigationBarItem(
                  icon: Image.asset(AppImages.exploreIcon),
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
              ],
            ),

            body: tabs[state.currentIndex],
          );
        },
      ),
    );
  }
}