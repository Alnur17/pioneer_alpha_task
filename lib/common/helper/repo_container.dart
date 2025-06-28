import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pioneer_alpha_task/common/app_color/app_colors.dart';
import 'package:pioneer_alpha_task/common/size_box/custom_sizebox.dart';

import '../../app/modules/home/controllers/theme_controller.dart';
import '../app_images/app_images.dart';
import '../app_text_style/styles.dart';

class RepoContainer extends StatelessWidget {
  final String? imageUrl;
  final String name;
  final String owner;
  final String rating;
  final String timestamp;
  final VoidCallback onTap;

  const RepoContainer({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.owner,
    required this.rating,
    required this.timestamp,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: themeController.isDarkMode.value
                ? AppColors.greyDark
                : AppColors.white,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: themeController.isDarkMode.value
                  ? AppColors.transparent
                  : AppColors.greyLight,
            )

            ),
        child: Row(
          children: [
            ClipOval(
              child: CachedNetworkImage(
                imageUrl: imageUrl ?? AppImages.placeHolderImage,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            sw10,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: h3.copyWith(fontSize: 18,color: themeController.isDarkMode.value
                        ? AppColors.white
                        : AppColors.black,),
                  ),
                  Text(
                    owner,
                    style: h5.copyWith(color: themeController.isDarkMode.value
                        ? AppColors.white
                        : AppColors.black,),
                  ),
                  sh5,
                  Row(
                    children: [
                      Image.asset(
                        AppImages.star,
                        scale: 4,
                      ),
                      sw5,
                      Text(
                        rating,
                        style: h5.copyWith(color: themeController.isDarkMode.value
                            ? AppColors.white
                            : AppColors.black,),
                      ),
                      sw12,
                      Image.asset(
                        AppImages.clock,
                        scale: 4,
                      ),
                      sw5,
                      Text(
                        timestamp,
                        style: h5.copyWith(color: themeController.isDarkMode.value
                            ? AppColors.white
                            : AppColors.black,),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
