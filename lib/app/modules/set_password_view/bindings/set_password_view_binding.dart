import 'package:get/get.dart';

import '../controllers/set_password_view_controller.dart';

class SetPasswordViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SetPasswordViewController>(
      () => SetPasswordViewController(),
    );
  }
}
