import 'package:exam_app/features/Home/presentation/view_model/cubit/home_screen_view_model.dart';
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            ExploreSearchBar(),
            Text('Browse by subject',

              style: AppTheme.lightTheme.textTheme.labelMedium,
            ),

          ]

        ),
      ),
    );
  }
}
