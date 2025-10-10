import 'package:diego/app/core/constants/asset_path.dart';
import 'package:diego/app/modules/course_view/views/widget/custom_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../home/views/widget/course_progress_card.dart';
import '../controllers/course_view_controller.dart';

class CourseView extends GetView<CourseViewController> {
  const CourseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 30),
                Image.asset(AssetPath.appLogoPng),
                SizedBox(height: 20),
                CustomSearchBar(
                  hintText: 'Search here...',
                  onBack: () {
                    Navigator.pop(context);
                  },
                  onMenu: () {},
                  onChanged: (value) {
                    print('Searching: $value');
                  },
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "I tuoi corsi",
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium!.copyWith(fontSize: 18),
                  ),
                ),
                SizedBox(height: 10),
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
                    return CourseProgressCard(
                      imageUrl:
                          'https://images.pexels.com/photos/3852143/pexels-photo-3852143.jpeg',
                      status: 'In Corso',
                      title: 'Datore di lavoro (Nuovo)',
                      hours: '16 ore',
                      progress: 0.6,
                      showProgress: false,
                    );
                  },
                ),
                SizedBox(height: 30,),
                SizedBox( 
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.offNamed("/notification");
                    },
                    child: Text("Riprendi la formazione"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
