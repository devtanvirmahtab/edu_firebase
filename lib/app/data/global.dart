import 'package:edu_firebase/app/data/models/user_model.dart';
import 'package:get/get.dart';

class _GlobalState {
  final authUser = Rx<UserModel?>(null);
  final isAuthLoaded = Rx<bool>(false);

}

final globalState = _GlobalState();