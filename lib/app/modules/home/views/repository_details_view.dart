import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pioneer_alpha_task/common/app_images/app_images.dart';
import 'package:pioneer_alpha_task/common/size_box/custom_sizebox.dart';

import '../../../../common/app_color/app_colors.dart';
import '../../../../common/app_text_style/styles.dart';

class RepositoryDetailsView extends GetView {
  const RepositoryDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.mainColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        title: const Text('Repository Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: const NetworkImage(AppImages
                      .profileImage), // Replace with actual owner image URL
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Solido',
                      style: h3.copyWith(fontSize: 18),
                    ),
                     Text(
                      'Repository Owner',
                      style: h4.copyWith(color: AppColors.black100),
                    ),
                  ],
                ),
              ],
            ),
            sh16,
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                  border: Border.all(color: AppColors.greyLight)
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.grey.withOpacity(0.2),
                  //     spreadRadius: 2,
                  //     blurRadius: 5,
                  //     offset: const Offset(0, 3),
                  //   ),
                  // ],
                  ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Repository',style: h5.copyWith(color: AppColors.blue),),
                  Text(
                    'awesome-flutter',
                    style: h3,
                  ),
                  sh8,
                  Text('Description',style: h5.copyWith(color: AppColors.blue),),
                  Text(
                    'No description',
                    style: h5.copyWith(color: AppColors.black100),
                  ),
                  sh16,
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 12,vertical: 14),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: AppColors.orangeLight,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Image.asset(AppImages.star,scale: 4,),
                                  sw5,
                                  Text('Stars',style: h4.copyWith(color: AppColors.chocolateColor),),
                                ],
                              ),
                              Text(
                                '56,282',
                                style: h2.copyWith(color: AppColors.chocolateColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                      sw8,
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: AppColors.greenLight,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Image.asset(AppImages.clock,scale: 4,),
                                sw5,
                                  Text('Updated',style: h4.copyWith(color: AppColors.green),),
                                ],
                              ),
                               Text(
                                '06-27-2025 12:18',
                                style: h4.copyWith(color: AppColors.greenDark),
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
    );
  }
}
