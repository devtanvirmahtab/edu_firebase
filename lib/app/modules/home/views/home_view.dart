import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edu_firebase/app/modules/home/views/components/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../screens/home_screen/home_screen.dart';
import '../../../core/constants/assets_constants.dart';
import '../../../core/constants/color_constants.dart';
import '../../../core/constants/size_constant.dart';
import '../../../core/widgets/course_item_card.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return controller.pageList.elementAt(controller.selectedIndex.value);
      }),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: kPrimaryColor,
            backgroundColor: Colors.white,
            elevation: 0,
            items: [
              BottomNavigationBarItem(
                activeIcon: Image.asset(
                  icFeatured,
                  height: kBottomNavigationBarItemSize,
                ),
                icon: Image.asset(
                  icFeaturedOutlined,
                  height: kBottomNavigationBarItemSize,
                ),
                label: "Featured",
              ),
              BottomNavigationBarItem(
                activeIcon: Image.asset(
                  icLearning,
                  height: kBottomNavigationBarItemSize,
                ),
                icon: Image.asset(
                  icLearningOutlined,
                  height: kBottomNavigationBarItemSize,
                ),
                label: "My Learning",
              ),
              BottomNavigationBarItem(
                activeIcon: Image.asset(
                  icSetting,
                  height: kBottomNavigationBarItemSize,
                ),
                icon: Image.asset(
                  icSettingOutlined,
                  height: kBottomNavigationBarItemSize,
                ),
                label: "Profile",
              ),
            ],
            currentIndex: controller.selectedIndex.value,
            onTap: (int index) {
              controller.selectedIndex.value = index;
            });
      }),
    );
  }
}
