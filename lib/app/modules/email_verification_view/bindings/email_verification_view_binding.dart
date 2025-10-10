import 'package:get/get.dart';

import '../controllers/email_verification_view_controller.dart';

class EmailVerificationViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmailVerificationViewController>(
      () => EmailVerificationViewController(),
    );
  }
}
