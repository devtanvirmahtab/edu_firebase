import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/widgets/class_lesson_card.dart';
import '../../../core/widgets/conroll_bottom_sheet.dart';
import '../../../core/widgets/custom_tab_view.dart';
import '../../../core/widgets/custom_video_player.dart';
import '../controllers/course_details_controller.dart';

class CourseDetailsView extends GetView<CourseDetailsController> {
  const CourseDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        primary: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Obx(() {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (controller.selectedClass.value?.classVideo != null)
                  Container(
                      constraints: const BoxConstraints(
                          maxWidth: double.infinity, maxHeight: 250),
                      child: CustomVideoPlayer(
                          videoLink:
                              controller.selectedClass.value?.classVideo ?? ""))
                else
                  const CircularProgressIndicator(
                    color: kDefaultIconDarkColor,
                  ),
                Text(
                  controller.selectedClass.value?.classTitle ?? "",
                  style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTabView(
                  index: controller.selectedTag.value,
                  changeTab: (index) {
                    controller.selectedTag.value = index;
                  },
                ),
                controller.selectedTag.value == 0
                    ? Obx(() {
                        return ListView.separated(
                          primary: false,
                          separatorBuilder: (_, __) {
                            return const SizedBox(
                              height: 20,
                            );
                          },
                          padding: const EdgeInsets.only(top: 20, bottom: 40),
                          shrinkWrap: true,
                          itemCount: controller.classList.length,
                          itemBuilder: (_, index) {
                            return ClassLessonCard(
                              classModel: controller.classList[index],
                              controller: controller,
                            );
                          },
                        );
                      })
                    : Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Text(controller.course.value?.courseTitle ?? ""),
                      ),
                const SizedBox(
                  height: 50,
                ),
              ],
            );
          }),
        ),
      ),
      bottomSheet: BottomSheet(
        onClosing: () {},
        backgroundColor: Colors.white,
        enableDrag: false,
        builder: (context) {
          return const SizedBox(
            height: 80,
            child: EnrollBottomSheet(),
          );
        },
      ),
    );
  }
}

class Description extends StatelessWidget {
  const Description({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: Text(
          "Build Flutter iOS and Android Apps with a Single Codebase: Learn Google's Flutter Mobile Development Framework & Dart"),
    );
  }
}
