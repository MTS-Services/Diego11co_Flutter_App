import 'package:diego/app/core/constants/app_colors.dart';
import 'package:diego/app/core/constants/asset_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';


class PasswordView extends GetView<LoginController> {
  PasswordView({super.key});

  bool isChecked = false;
final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 80,),
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.arrow_back, color: Colors.black),
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(color: AppColors.secondary, width: 2.w),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 8.h),
                      Image.asset(AssetPath.appLogoPng),
                      SizedBox(height: 15.h),
                      Image.asset(AssetPath.passwordPng),
                      SizedBox(height: 20.h),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(5.w),
                        decoration: BoxDecoration(color: AppColors.secondary),
                        child: Column(
                          children: [
                            SizedBox(height: 10.h),
                            Text(
                              "Scrivi la tua password",
                              style: Theme.of(
                                context,
                              ).textTheme.bodyMedium!.copyWith(fontSize: 16.sp),
                            ),
                            SizedBox(height: 10.h),
                            _buildAlignRichText(context),
                            SizedBox(height: 15.h),
                            TextFormField(
                              controller: passwordController,
                              decoration: InputDecoration(
                                hintText: "Password",
                              ),
                            ),
                            SizedBox(height: 25.h),
                            _buildSizedBoxButton(),
                            SizedBox(height: 8.h),
                            TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.red,
                              ),
                              onPressed: () {
                                Get.offNamed("/email-verification-view");
                              },
                              child: Text('Password dimenticata?'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                buildRowCheckboxTextButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildRowCheckboxTextButton(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          onChanged: (bool? value) {},
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          side: const BorderSide(color: Colors.grey, width: 1),
          activeColor: Colors.blue,
        ),
        Text(
          'Acconsento al trattamento dei miei dati personali',
          style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 15),
        ),
      ],
    );
  }

  Align _buildAlignRichText(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "Password",
              style: Theme.of(
                context,
              ).textTheme.bodyMedium!.copyWith(fontSize: 14.sp),
            ),
            TextSpan(
              text: "*",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Colors.red,
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSizedBoxButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Get.offNamed("/bottom-navigation");
        },
        child: Text("Procedi", style: TextStyle(fontSize: 16.sp)),
      ),
    );
  }
}
