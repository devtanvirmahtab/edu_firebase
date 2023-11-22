import 'package:edu_firebase/app/modules/featured/views/featured_view.dart';
import 'package:edu_firebase/app/modules/my_course/views/my_course_view.dart';
import 'package:edu_firebase/app/modules/profile/views/profile_view.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final selectedIndex = 0.obs;

  final pageList = [
    FeaturedView(),
    MyCourseView(),
    ProfileView(),
  ];

  @override
  void onInit() {
    super.onInit();

  }

  @override
  void onClose() {
    super.onClose();
  }
}
