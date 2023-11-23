import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/constants/color_constants.dart';
import '../../../core/widgets/course_item_card.dart';
import '../../home/views/components/my_app_bar.dart';
import '../controllers/my_course_controller.dart';

class MyCourseView extends GetView<MyCourseController> {
  const MyCourseView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return Column(
          children: [
            const MyAppBar(),
            if (controller.courseList.isEmpty)
              const SizedBox(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(
                  color: kPrimaryColor,
                ),
              )
            else
              Expanded(
                  child: ListView.builder(
                    itemCount: controller.courseList.length,
                    itemBuilder: (context, index) {
                      return CourseItemCard(
                        course: controller.courseList[index],
                      );
                    },
                  )
              ),
          ],
        );
      }),
    );
  }
}
