import 'package:get/get.dart';

import '../modules/bottom_navigation/bindings/bottom_navigation_binding.dart';
import '../modules/bottom_navigation/views/bottom_navigation_view.dart';
import '../modules/choose_language/bindings/choose_language_binding.dart';
import '../modules/choose_language/views/choose_language_view.dart';
import '../modules/cirtificate_download/bindings/cirtificate_download_binding.dart';
import '../modules/cirtificate_download/views/cirtificate_download_view.dart';
import '../modules/course_view/bindings/course_view_binding.dart';
import '../modules/course_view/views/course_view.dart';
import '../modules/edit_personal_info/bindings/edit_personal_info_binding.dart';
import '../modules/edit_personal_info/views/edit_personal_info_view.dart';
import '../modules/email_verification_view/bindings/email_verification_view_binding.dart';
import '../modules/email_verification_view/views/email_verification_view_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/notification/bindings/notification_binding.dart';
import '../modules/notification/views/notification_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/registration/bindings/registration_binding.dart';
import '../modules/registration/views/registration_view.dart';
import '../modules/registration_details_view/bindings/registration_details_view_binding.dart';
import '../modules/registration_details_view/views/registration_details_view_view.dart';
import '../modules/set_password_view/bindings/set_password_view_binding.dart';
import '../modules/set_password_view/views/set_password_view_view.dart';
import '../modules/video_player/bindings/video_player_binding.dart';
import '../modules/video_player/views/video_player_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.CHOOSE_LANGUAGE;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTRATION,
      page: () => RegistrationView(),
      binding: RegistrationBinding(),
    ),
    GetPage(
      name: _Paths.REGISTRATION_DETAILS_VIEW,
      page: () => const RegistrationDetailsViewView(),
      binding: RegistrationDetailsViewBinding(),
    ),
    GetPage(
      name: _Paths.SET_PASSWORD_VIEW,
      page: () => SetPasswordViewView(),
      binding: SetPasswordViewBinding(),
    ),
    GetPage(
      name: _Paths.EMAIL_VERIFICATION_VIEW,
      page: () => EmailVerificationViewView(),
      binding: EmailVerificationViewBinding(),
    ),
    GetPage(
      name: _Paths.CHOOSE_LANGUAGE,
      page: () => ChooseLanguageView(),
      binding: ChooseLanguageBinding(),
    ),
    GetPage(
      name: _Paths.COURSE_VIEW,
      page: () => const CourseView(),
      binding: CourseViewBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOM_NAVIGATION,
      page: () => const BottomNavigationView(),
      binding: BottomNavigationBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.VIDEO_PLAYER,
      page: () => const VideoPlayerView(),
      binding: VideoPlayerBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PERSONAL_INFO,
      page: () => const EditPersonalInfoView(),
      binding: EditPersonalInfoBinding(),
    ),
    GetPage(
      name: _Paths.CIRTIFICATE_DOWNLOAD,
      page: () => const CirtificateDownloadView(),
      binding: CirtificateDownloadBinding(),
    ),
  ];
}
