import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_images.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage(AppImages.profileImage,

          ),
        ),
        GestureDetector(
          onTap: () {
          },
          child: Container(
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
              color: AppColors.blue,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.camera_alt,
              size: 18,
              color: AppColors.white,
            ),
          ),
        ),
      ],
    );
  }
}