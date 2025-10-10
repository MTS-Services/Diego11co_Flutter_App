import 'package:diego/app/core/constants/asset_path.dart';
import 'package:diego/app/modules/home/views/widget/course_progress_card.dart';
import 'package:diego/app/modules/home/views/widget/profile_card_widget.dart';
import 'package:diego/app/modules/video_player/views/video_player_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AssetPath.appLogoPng),
            SizedBox(height: 8.h),
            ProfileProgressCard(
              name: "Diego",
              message: "Ciao!",
              progress: 0.4,
              imageUrl: "https://i.pravatar.cc/150?img=3",
              onNotificationTap: () {
                print("Notification tapped!");
              },
            ),
            SizedBox(height: 10.h),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Home",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            GridView.builder(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5.w,
                mainAxisSpacing: 5.h,
                childAspectRatio: 0.70,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    Get.toNamed('/video-player');
                  },
                  child: CourseProgressCard(
                    imageUrl:
                    'https://images.pexels.com/photos/3852143/pexels-photo-3852143.jpeg',
                    status: 'In Corso',
                    title: 'Datore di lavoro (Nuovo)',
                    hours: '16 ore',
                    progress: 0.6,
                  ),
                );
              },
            ),
            SizedBox(height: 25.h),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.offNamed('/course-view');
                },
                child: Text('Riprendi la formazione'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
