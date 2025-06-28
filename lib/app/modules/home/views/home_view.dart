import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pioneer_alpha_task/common/app_color/app_colors.dart';
import 'package:pioneer_alpha_task/common/size_box/custom_sizebox.dart';
import '../../../../common/app_text_style/styles.dart';
import '../../../../common/helper/repo_container.dart';
import '../controllers/home_controller.dart';
import '../controllers/theme_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeController homeController = Get.put(HomeController());
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: themeController.isDarkMode.value
            ? Colors.black45
            : AppColors.background,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: themeController.isDarkMode.value
              ? Colors.black12
              : AppColors.mainColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Repository List',
                style: appBarStyle.copyWith(
                  color: themeController.isDarkMode.value
                      ? AppColors.white
                      : AppColors.black,
                ),
              ),
              Obx(
                () => GestureDetector(
                  onTap: themeController.toggleTheme,
                  child: Icon(
                    themeController.isDarkMode.value
                        ? Icons.wb_sunny
                        : CupertinoIcons.moon_fill,
                    color: themeController.isDarkMode.value
                        ? AppColors.white
                        : AppColors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sh12,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text('Sort By:',
                      style: h4.copyWith(
                        color: themeController.isDarkMode.value
                            ? AppColors.white
                            : AppColors.black,
                      )),
                  sw5,
                  Obx(
                    () => Container(
                      height: 30,
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: themeController.isDarkMode.value
                            ? AppColors.white
                            : AppColors.greyLight,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          dropdownColor: AppColors.white,
                          value: homeController.selectedValue.value.isEmpty
                              ? null
                              : homeController.selectedValue.value,
                          hint: Text(
                            'Select',
                            style: h5,
                          ),
                          borderRadius: BorderRadius.circular(12),
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: AppColors.black,
                          ),
                          style: h5,
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              homeController.updateValue(newValue);
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
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      homeController.toggleSortOrder();
                    },
                    child: Icon(
                      CupertinoIcons.arrow_up_arrow_down,
                      color: themeController.isDarkMode.value
                          ? AppColors.white
                          : AppColors.black,
                    ),
                  ),
                ],
              ),
            ),
            sh12,
            Expanded(
              child: RefreshIndicator(
                onRefresh: homeController.loadRepositories,
                color: themeController.isDarkMode.value
                    ? AppColors.white
                    : AppColors.black,
                child: Obx(() {
                  if (homeController.isLoading.value) {
                    return Center(
                        child: CircularProgressIndicator(
                      color: themeController.isDarkMode.value
                          ? AppColors.white
                          : AppColors.black,
                    ));
                  }
                  if (homeController.repoList.isEmpty) {
                    return Center(
                        child: Text(
                      'No repositories found',
                      style: h5,
                    ));
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: homeController.repoList.length,
                    itemBuilder: (context, index) {
                      final repo = homeController.repoList[index];
                      return Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: RepoContainer(
                          imageUrl: repo.owner.avatarUrl,
                          name: repo.name,
                          owner: 'Owner: ${repo.owner.login}',
                          rating: repo.stargazersCount.toString(),
                          timestamp: DateFormat('MM-dd-yyyy HH:mm')
                              .format(repo.updatedAt),
                          onTap: () {
                            homeController.navigateToDetails(repo);
                          },
                        ),
                      );
                    },
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
