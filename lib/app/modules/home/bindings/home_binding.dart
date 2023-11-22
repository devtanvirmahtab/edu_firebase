import 'package:edu_firebase/app/modules/featured/controllers/featured_controller.dart';
import 'package:edu_firebase/app/modules/my_course/controllers/my_course_controller.dart';
import 'package:edu_firebase/app/modules/profile/controllers/profile_controller.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<FeaturedController>(
          () => FeaturedController(),
    );
    Get.lazyPut<MyCourseController>(
          () => MyCourseController(),
    );
    Get.lazyPut<ProfileController>(
          () => ProfileController(),
    );
  }
}
