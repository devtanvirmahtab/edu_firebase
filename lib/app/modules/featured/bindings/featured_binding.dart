import 'package:get/get.dart';

import '../controllers/featured_controller.dart';

class FeaturedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FeaturedController>(
      () => FeaturedController(),
    );
  }
}
