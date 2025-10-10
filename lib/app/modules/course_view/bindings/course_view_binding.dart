import 'package:get/get.dart';

import '../controllers/course_view_controller.dart';

class CourseViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CourseViewController>(
      () => CourseViewController(),
    );
  }
}
