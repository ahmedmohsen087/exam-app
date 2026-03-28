import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';


class ExploreSearchBar extends StatelessWidget {
  const ExploreSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
          color: AppColors.black,
          fontSize: 16,
          fontWeight: FontWeight.bold),
      cursorColor: AppColors.red,
      decoration: InputDecoration(
        hintText: 'Search',
        hintStyle: TextStyle(
            color: AppColors.green,
            fontSize: 16,
            fontWeight: FontWeight.bold),
        prefixIcon: Icon(
          Icons.search,
          color: AppColors.red,
        ),


        fillColor: AppColors.green.withValues(alpha: .5),
        filled: true,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: AppColors.red)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: AppColors.green)),
      ),
    );


  }
}
