import 'package:get/get.dart';
import 'package:pioneer_alpha_task/common/app_images/app_images.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  var repoList = <Map<String, dynamic>>[].obs;
  var selectedValue = ''.obs;

  void updateValue(String value) {
    selectedValue.value = value;
    _sortRepoList(value);
  }

  @override
  void onInit() {
    super.onInit();
    _loadData();
  }

  void _loadData() {
    repoList.assignAll([
      {
        'imageUrl': AppImages.profileImage,
        'name': 'flutter',
        'owner': 'flutter',
        'rating': '11171',
        'timestamp': '06-26-2025 15:38',
      },
      {
        'imageUrl': AppImages.profileImage,
        'name': 'rustdesk',
        'owner': 'flutter',
        'rating': '17171',
        'timestamp': '06-27-2025 14:38',
      },
      {
        'imageUrl': AppImages.profileImage,
        'name': 'immich-app',
        'owner': 'flutter',
        'rating': '71171',
        'timestamp': '06-25-2025 16:38',
      },
      {
        'imageUrl': AppImages.profileImage,
        'name': 'AppFlowy',
        'owner': 'flutter',
        'rating': '17171',
        'timestamp': '05-27-2025 12:38',
      },
      {
        'imageUrl': AppImages.profileImage,
        'name': 'localend',
        'owner': 'flutter',
        'rating': '171171',
        'timestamp': '06-27-2025 14:40',
      },
    ]);
  }

  void _sortRepoList(String sortBy) {
    if (sortBy == 'Stars') {
      repoList.sort((a, b) {
        int aRating = int.tryParse(a['rating'] ?? '0') ?? 0;
        int bRating = int.tryParse(b['rating'] ?? '0') ?? 0;
        return bRating.compareTo(aRating); // Descending order
      });
    } else if (sortBy == 'Last Updated') {
      repoList.sort((a, b) {
        DateTime aTime = _parseDate(a['timestamp'] ?? '');
        DateTime bTime = _parseDate(b['timestamp'] ?? '');
        return bTime.compareTo(aTime); // Descending order
      });
    }
    repoList.refresh();
  }

  DateTime _parseDate(String dateStr) {
    try {
      return DateFormat('MM-dd-yyyy HH:mm').parse(dateStr);
    } catch (e) {
      return DateTime(1970);
    }
  }
}