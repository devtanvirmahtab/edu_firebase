import 'package:edu_firebase/app/data/models/class_model.dart';
import 'package:edu_firebase/app/modules/course_details/controllers/course_details_controller.dart';
import 'package:flutter/material.dart';

import '../constants/assets_constants.dart';

class ClassLessonCard extends StatelessWidget {
  final ClassModel classModel;
  final bool isPlaying;
  final bool isCompleted;
  final CourseDetailsController controller;

  const ClassLessonCard({
    Key? key,
    required this.classModel,
    this.isPlaying = false,
    this.isCompleted = true, required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        controller.selectedClass.value = classModel;
      },
      child: Row(
        children: [
          isPlaying
              ? Image.asset(
                  icLearning,
                  height: 45,
                )
              : Image.asset(
                  icPlayNext,
                  height: 45,
                ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  classModel.classTitle,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  classModel.classDescription,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          isCompleted
              ? Image.asset(
                  icDone,
                  height: 30,
                )
              : Image.asset(
                  icLock,
                  height: 30,
                ),
        ],
      ),
    );
  }
}
