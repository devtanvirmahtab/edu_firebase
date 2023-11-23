import 'package:get/get.dart';

import '../../../core/constants/app_constant.dart';
import '../../../core/constants/firebase_constant.dart';
import '../../../data/models/course_model.dart';

class MyCourseController extends GetxController {
  final courseList = <CourseModel>[].obs;
  final String home = "Home";

  @override
  void onInit() {
    super.onInit();
    getCourseData();
  }

  Future<void> getCourseData() async {
    try {
      final snapshot = await fireStore.collection('courses').get();
      final List<CourseModel> courseItem = snapshot.docs
          .map((data) => CourseModel.fromJson(data.data()))
          .toList();
      courseList.value = courseItem;
    } catch (e) {
      logger.e('Error retrieving users: $e');
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
