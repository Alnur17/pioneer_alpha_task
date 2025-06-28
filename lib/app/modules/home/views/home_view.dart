import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pioneer_alpha_task/app/modules/home/views/repository_details_view.dart';
import 'package:pioneer_alpha_task/common/app_color/app_colors.dart';
import 'package:pioneer_alpha_task/common/size_box/custom_sizebox.dart';

import '../../../../common/app_text_style/styles.dart';
import '../../../../common/helper/repo_container.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.mainColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Repository List'),
            Icon(Icons.sunny),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sh12,
            Row(
              children: [
                Text('Sort By:', style: h4),
                sw5,
                Obx(
                  () => Container(
                    height: 30,
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: AppColors.greyLight,
                      //border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        dropdownColor: AppColors.white,
                        value: controller.selectedValue.value.isEmpty
                            ? null
                            : controller.selectedValue.value,
                        hint: Text(
                          'Select',
                          style: h5,
                        ),
                        borderRadius: BorderRadius.circular(12),
                        icon: Icon(Icons.arrow_drop_down),
                        style: h5.copyWith(color: AppColors.black),
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            controller.updateValue(newValue);
                          }
                        },
                        items: <String>['Stars', 'Last Updated']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value[0].toUpperCase() + value.substring(1),
                              style: h5,
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            sh8,
            Expanded(
              child: Obx(() {
                if (controller.repoList.isEmpty) {
                  return Center(child: CircularProgressIndicator());
                }
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.repoList.length,
                  itemBuilder: (context, index) {
                    final repo = controller.repoList[index];
                    return RepoContainer(
                      imageUrl: repo['imageUrl'] ?? '',
                      name: repo['name'] ?? 'Unknown',
                      owner: 'Owner: ${repo['owner'] ?? 'Unknown'}',
                      rating: repo['rating'] ?? '0',
                      timestamp: repo['timestamp'] ?? 'N/A',
                      onTap: () {
                        Get.to(() => RepositoryDetailsView());
                      },
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
