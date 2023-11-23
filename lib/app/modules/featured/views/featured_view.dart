import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/featured_controller.dart';

class FeaturedView extends GetView<FeaturedController> {
  const FeaturedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfileView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Featured is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
