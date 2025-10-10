import 'package:get/get.dart';

import '../controllers/cirtificate_download_controller.dart';

class CirtificateDownloadBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CirtificateDownloadController>(
      () => CirtificateDownloadController(),
    );
  }
}
