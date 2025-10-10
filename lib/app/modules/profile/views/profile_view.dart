import 'package:diego/app/core/constants/app_colors.dart';
import 'package:diego/app/core/constants/asset_path.dart';
import 'package:diego/app/modules/cirtificate_download/views/cirtificate_download_view.dart';
import 'package:diego/app/modules/edit_personal_info/bindings/edit_personal_info_binding.dart';
import 'package:diego/app/modules/edit_personal_info/views/edit_personal_info_view.dart';
import 'package:diego/app/modules/profile/views/widget/custom_tile.dart';
import 'package:diego/app/modules/profile/views/widget/profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(AssetPath.appLogoPng),
                const SizedBox(height: 30),
                ProfileWidget(
                  imageUrl: 'https://example.com/profile.jpg',
                  message: 'Ciao!',
                  name: 'Diego',
                  notificationIconBgColor: AppColors.cirColor,
                  onNotificationTap: () {
                    print('Notification tapped');
                  },
                ),
                SizedBox(height: 20),
                CustomTile(
                  leadingIcon: Icons.home_outlined,
                  title: "Home",
                  backgroundColor: AppColors.textFieldColor,
                  onTap: () {
                    print("Home tapped!");
                  },
                ),
                SizedBox(height: 15,),
                CustomTile(
                  leadingIcon: Icons.settings,
                  title: "Impostazioni",
                  backgroundColor: AppColors.textFieldColor,
                  onTap: () {
                    Get.to(()=>EditPersonalInfoView());
                  },
                ),
                SizedBox(height: 15,),
                CustomTile(
                  leadingIcon: Icons.file_download_outlined,
                  title: "Scarica i tuoi attestati",
                  backgroundColor: AppColors.textFieldColor,
                  onTap: () {
                    Get.to(()=>CirtificateDownloadView());
                  },
                ),
                SizedBox(height: 15,),
                CustomTile(
                  leadingIcon: Icons.login,
                  title: "Esci",
                  titleColor: AppColors.logOutColor,
                  backgroundColor: AppColors.textFieldColor,
                  iconColor: AppColors.logOutColor,
                  onTap: () {
                    print("Home tapped!");
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


}
