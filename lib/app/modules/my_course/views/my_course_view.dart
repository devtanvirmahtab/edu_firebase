import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/my_course_controller.dart';

class MyCourseView extends GetView<MyCourseController> {
  const MyCourseView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyCourseView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MyCourseView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
