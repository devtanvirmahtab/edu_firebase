import 'dart:math';

import 'package:edu_firebase/app/core/constants/app_constant.dart';
import 'package:edu_firebase/app/data/models/class_model.dart';
import 'package:edu_firebase/app/data/models/course_model.dart';
import 'package:get/get.dart';

class CourseDetailsController extends GetxController {
  final selectedTag = 0.obs;
  final classList = <ClassModel>[].obs;
  final selectedClass = Rx<ClassModel?>(null);
  final course = Rx<CourseModel?>(null);

  @override
  void onInit() {
    final data = Get.arguments;
    course.value = data;
    for (final classLesson in course.value!.coursePlaylist) {
      final classData = ClassModel(
        classTitle: classLesson["class_title"],
        classVideo: classLesson["class_video"],
        classDescription: classLesson["class_description"],
      );
      classList.add(classData);
    }
    super.onInit();
    selectedClass.value = classList[0];
  }
}
