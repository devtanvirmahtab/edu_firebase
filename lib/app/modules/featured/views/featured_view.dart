import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../screens/home_screen/home_screen.dart';
import '../../../core/widgets/course_item_card.dart';
import '../../home/views/components/my_app_bar.dart';
import '../controllers/featured_controller.dart';

class FeaturedView extends GetView<FeaturedController> {
  const FeaturedView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const MyAppBar(),
          ElevatedButton(onPressed: (){
            Get.to(const BaseScreen());
          }, child: const Text("next page"),),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: controller.usersStream,
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Text('Something went wrong');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text("Loading...");
                }

                return ListView(
                  children: snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                    return CourseItemCard(
                      author: data['course_author'],
                      title: data['course_title'],
                      image: data['course_image'],
                    );
                  }).toList(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
