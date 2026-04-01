import 'package:exam_app/features/Home/presentation/view_model/cubit/home_screen_view_model.dart';
import 'package:exam_app/features/Home/presentation/widget/subject_card.dart';
import 'package:flutter/material.dart';

import '../../../../config/di/di.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../Home/presentation/widget/explore_search_bar.dart';

class ExploreScreen extends StatelessWidget {
   ExploreScreen({super.key});
HomeScreenViewModel homeScreenViewModel = getIt<HomeScreenViewModel>();

  @override
  Widget build(BuildContext context) {
    homeScreenViewModel.getAllSubjects();
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
          hintText: 'Search',
          prefixIcon: Icon(
            Icons.search,
          ),
        ),
      ),
            Text('Browse by subject',

              style: AppTheme.lightTheme.textTheme.labelMedium,
            ),
            SubjectCard(
              title: 'Mathematics',
              image: 'https://cdn-icons-png.flaticon.com/512/906/906175.png',
            ),
            SubjectCard(
              title: 'Mathematics',
              image: 'https://cdn-icons-png.flaticon.com/512/906/906175.png',
            ),
            SubjectCard(
              title: 'Mathematics',
              image: 'https://cdn-icons-png.flaticon.com/512/906/906175.png',
            ),


          ]

        ),
      ),
    );
  }
}
