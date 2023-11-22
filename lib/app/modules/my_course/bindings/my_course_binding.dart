import 'package:get/get.dart';

import '../controllers/my_course_controller.dart';

class MyCourseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyCourseController>(
      () => MyCourseController(),
    );
  }
}
