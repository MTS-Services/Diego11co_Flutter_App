import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerControllerX extends GetxController {
  late VideoPlayerController videoController;
  var isInitialized = false.obs;
  var isPlaying = false.obs;
  final currentProgress = 0.28.obs;

  final modules = <Map<String, dynamic>>[
    {'title': 'Class-1', 'duration': 'Last Left', 'progress': 1.0, 'completed': true},
    {'title': 'Class-2', 'duration': 'Last Left', 'progress': 1.0, 'completed': true},
    {'title': 'Class-3', 'duration': '8 minuti', 'progress': 0.6, 'completed': false},
    {'title': 'Class-4', 'duration': '30 minuti', 'progress': 0.0, 'completed': false},
    {'title': 'Class-5', 'duration': '30 minuti', 'progress': 0.0, 'completed': false},
    {'title': 'Class-6', 'duration': '29.59 minuti', 'progress': 0.0, 'completed': false},
    {'title': 'Class-7', 'duration': '31 minuti', 'progress': 0.0, 'completed': false},
    {'title': 'Class-8', 'duration': '28.59 minuti', 'progress': 0.0, 'completed': false},
  ].obs;


  @override
  void onInit() {
    super.onInit();
    videoController = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    )..initialize().then((_) {
      isInitialized.value = true;
    });
  }

  void togglePlayPause() {
    if (videoController.value.isPlaying) {
      videoController.pause();
      isPlaying.value = false;
    } else {
      videoController.play();
      isPlaying.value = true;
    }
  }

  @override
  void onClose() {
    videoController.dispose();
    super.onClose();
  }
}
