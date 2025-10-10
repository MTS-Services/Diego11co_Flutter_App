import 'package:diego/app/modules/home/views/home_view.dart';
import 'package:diego/app/modules/notification/views/notification_view.dart';
import 'package:diego/app/modules/profile/views/profile_view.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../course_view/views/course_view.dart';

class BottomNavigationController extends GetxController {
  final RxInt currentIndex = 0.obs;

  final List<Widget> pages = [
    HomeView(),
    CourseView(),
    NotificationView(),
    ProfileView()
  ];

  void changeTab(int index) {
    currentIndex.value = index;
  }
}
