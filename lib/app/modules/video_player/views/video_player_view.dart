import 'package:diego/app/core/constants/app_colors.dart';
import 'package:diego/app/core/constants/asset_path.dart';
import 'package:diego/app/modules/video_player/views/widget/custom_text.dart';
import 'package:diego/app/modules/video_player/views/widget/class_item.dart';
import 'package:diego/app/modules/video_player/views/widget/modul_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import '../controllers/video_player_controller.dart';

class VideoPlayerView extends GetView<VideoPlayerControllerX> {
  const VideoPlayerView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<VideoPlayerControllerX>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                children: [
                  InkWell(
                    onTap: Get.back,
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black.withOpacity(0.05),
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        size: 18,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w,),
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(AssetPath.appLogoPng),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            _buildVideo(controller),

            const SizedBox(height: 20),

            // 📝 Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Datore di lavoro (Nuovo) 16 ore",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 8),

            // 📄 Description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Accordo, ai sensi dell’articolo 37, comma 2, del decreto legislativo 9 aprile 2008, n. 81, tra il Governo, le regioni e le Province autonome di Trento e di Bolzano...",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 13,
                  color: Colors.grey.shade600,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            const SizedBox(height: 24),

            // 🎵 Playlist Title
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Playlist',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2D2D2D),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  decoration: BoxDecoration(color: AppColors.secondary),
                  child: Column(
                    children: [
                      CourseModuleHeader(),
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: 50,
                          itemBuilder: (context, index) {
                            return ClassItem(
                              classNumber: index + 1,
                              progress: 0.40,
                              status: ClassStatus.completed,
                              duration: '30 minuti',
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVideo(VideoPlayerControllerX controller) {
    return Obx(() {
      if (!controller.isInitialized.value) {
        return const Center(child: CircularProgressIndicator());
      }

      return Stack(
        alignment: Alignment.center,
        children: [
          AspectRatio(
            aspectRatio: controller.videoController.value.aspectRatio,
            child: VideoPlayer(controller.videoController),
          ),
          IconButton(
            icon: Icon(
              controller.isPlaying.value
                  ? Icons.pause_circle_filled
                  : Icons.play_circle_filled,
              size: 64,
              color: Colors.white,
            ),
            onPressed: controller.togglePlayPause,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
                ),
              ),
              child: Row(
                children: [
                  const CustomText(
                    text: '00:10',
                    fontSize: 12,
                    color: Colors.white,
                  ),
                  Expanded(
                    child: Slider(
                      value: 0.1,
                      onChanged: (value) {},
                      activeColor: const Color(0xFF6BBFA3),
                      inactiveColor: Colors.white30,
                    ),
                  ),
                  const CustomText(
                    text: '01:40',
                    fontSize: 12,
                    color: Colors.white,
                  ),
                  IconButton(
                    icon: const Icon(Icons.fullscreen, color: Colors.white),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}
