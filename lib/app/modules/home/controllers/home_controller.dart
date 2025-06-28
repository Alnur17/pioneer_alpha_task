import 'package:get/get.dart';
import 'package:pioneer_alpha_task/app/data/api.dart';
import 'package:pioneer_alpha_task/app/data/base_client.dart';
import '../../../../common/helper/local_store.dart';
import '../model/repository.dart';
import '../views/repository_details_view.dart';

class HomeController extends GetxController {
  final repoList = <Repository>[].obs;
  final isLoading = false.obs;
  final selectedValue = ''.obs;
  final isAscending = false.obs;

  @override
  void onInit() {
    super.onInit();
    selectedValue.value = LocalStorage.getData(key: 'sortBy') ?? 'Stars';
    isAscending.value = LocalStorage.getData(key: 'isAscending') ?? false;
    loadRepositories();
  }

  /// Loads repositories from the GitHub API or cache
  Future<void> loadRepositories() async {
    isLoading.value = true;
    try {
      final response = await BaseClient.getRequest(
        api: Api.getRepoList,
        headers: {'Accept': 'application/vnd.github.v3+json'},
      );

      final data = await BaseClient.handleResponse(response);
      final List<dynamic> items = data['items'];
      repoList.value = items.map((item) => Repository.fromJson(item)).toList();

      await LocalStorage.saveData(
        key: 'repos',
        data: repoList.map((repo) => repo.toJson()).toList(),
      );
    } catch (e) {
      final cachedRepos = LocalStorage.getData(key: 'repos');
      if (cachedRepos != null) {
        repoList.value = (cachedRepos as List)
            .map((item) => Repository.fromJson(item))
            .toList();
        if (repoList.isEmpty) {
          Get.snackbar('Error', 'No internet connection. Showing cached data.');
        }
      } else {
        Get.snackbar('Error', e.toString());
      }
    } finally {
      isLoading.value = false;
      sortRepositories();
    }
  }

  /// Sorts repositories based on selected criteria (Stars or Last Updated)
  void sortRepositories() {
    repoList.sort((a, b) {
      if (selectedValue.value == 'Stars') {
        return isAscending.value
            ? a.stargazersCount.compareTo(b.stargazersCount)
            : b.stargazersCount.compareTo(a.stargazersCount);
      } else {
        return isAscending.value
            ? a.updatedAt.compareTo(b.updatedAt)
            : b.updatedAt.compareTo(a.updatedAt);
      }
    });

    // Save sorting preferences to local storage
    LocalStorage.saveData(key: 'sortBy', data: selectedValue.value);
    LocalStorage.saveData(key: 'isAscending', data: isAscending.value);
    update();
  }

  /// Updates the sorting criteria and triggers re-sorting
  void updateValue(String newValue) {
    selectedValue.value = newValue;
    sortRepositories();
  }

  /// Toggles the sort order (ascending/descending) and re-sorts
  void toggleSortOrder() {
    isAscending.value = !isAscending.value;
    sortRepositories();
  }

  void navigateToDetails(Repository repository) {
    Get.to(() => const RepositoryDetailsView(), arguments: repository);
  }
}