import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pioneer_alpha_task/common/app_images/app_images.dart';
import 'package:pioneer_alpha_task/common/size_box/custom_sizebox.dart';
import '../../../../common/app_color/app_colors.dart';
import '../../../../common/app_text_style/styles.dart';
import '../controllers/theme_controller.dart';
import '../model/repository.dart';

class RepositoryDetailsView extends GetView {
  const RepositoryDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final Repository repository = Get.arguments as Repository;
    final ThemeController themeController = Get.find();

    return Scaffold(
      backgroundColor: themeController.isDarkMode.value
          ? Colors.black45
          : AppColors.background,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: themeController.isDarkMode.value
            ? Colors.black12
            : AppColors.mainColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: themeController.isDarkMode.value
                ? AppColors.white
                : AppColors.black,
          ),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Repository Details',
          style: appBarStyle.copyWith(
            color: themeController.isDarkMode.value
                ? AppColors.white
                : AppColors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: repository.owner.avatarUrl,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  sw12,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        repository.owner.login,
                        style: h3.copyWith(
                          fontSize: 20,
                          color: themeController.isDarkMode.value
                              ? AppColors.white
                              : AppColors.black,
                        ),
                      ),
                      Text(
                        'Repository Owner',
                        style: h5.copyWith(
                          color: themeController.isDarkMode.value
                              ? AppColors.white
                              : AppColors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              sh16,
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: themeController.isDarkMode.value
                      ? AppColors.greyDark
                      : AppColors.white,
                  border: Border.all(
                    color: themeController.isDarkMode.value
                        ? AppColors.transparent
                        : AppColors.greyLight,
                  ),
                ),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Repository',
                        style: h5.copyWith(
                          color: themeController.isDarkMode.value
                              ? AppColors.white
                              : AppColors.blue,
                        )),
                    Text(
                      repository.name,
                      style: h3.copyWith(
                        color: themeController.isDarkMode.value
                            ? AppColors.white
                            : AppColors.black,
                      ),
                    ),
                    sh8,
                    Text('Description',
                        style: h5.copyWith(
                          color: themeController.isDarkMode.value
                              ? AppColors.white
                              : AppColors.blue,
                        )),
                    Text(
                      repository.description,
                      style: h5.copyWith(
                          color: themeController.isDarkMode.value
                              ? AppColors.white
                              : AppColors.black100),
                    ),
                    sh16,
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 100,
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: AppColors.orangeLight,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(AppImages.star, scale: 4),
                                    sw5,
                                    Text(
                                      'Stars',
                                      style: h4.copyWith(
                                        color: AppColors.chocolateColor,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  repository.stargazersCount.toString(),
                                  style: h2.copyWith(
                                    color: AppColors.chocolateColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        sw8,
                        Expanded(
                          child: Container(
                            height: 100,
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: AppColors.greenLight,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(AppImages.clock, scale: 4),
                                    sw5,
                                    Text(
                                      'Updated',
                                      style: h4.copyWith(
                                        color: AppColors.green,
                                      ),
                                    ),
                                  ],
                                ),
                                sh5,
                                Text(
                                  DateFormat('MM-dd-yyyy HH:mm')
                                      .format(repository.updatedAt),
                                  style:
                                      h4.copyWith(color: AppColors.greenDark),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
