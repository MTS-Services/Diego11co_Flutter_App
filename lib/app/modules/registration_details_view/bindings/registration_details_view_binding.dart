import 'package:get/get.dart';

import '../controllers/registration_details_view_controller.dart';

class RegistrationDetailsViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegistrationDetailsViewController>(
      () => RegistrationDetailsViewController(),
    );
  }
}
