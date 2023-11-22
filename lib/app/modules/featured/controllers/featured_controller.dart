import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../core/constants/firebase_constant.dart';

class FeaturedController extends GetxController {
  late final Stream<QuerySnapshot> usersStream;
  final String home = "Home";

  @override
  void onInit() {
    super.onInit();
    usersStream = fireStore.collection('courses').snapshots();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
