import 'package:diego/app/core/constants/app_colors.dart';
import 'package:diego/app/core/constants/asset_path.dart';
import 'package:diego/app/modules/registration/views/otp_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/registration_controller.dart';

class RegistrationView extends GetView<RegistrationController> {
  RegistrationView({super.key});
  final TextEditingController emailTeController  = TextEditingController();
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
                SizedBox(height:80.h,),
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.arrow_back, color: Colors.black),
                  ),
                ),
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
                      Image.asset(AssetPath.emailPng),
                      SizedBox(height: 20.h),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(5.w),
                        decoration: BoxDecoration(color: AppColors.secondary),
                        child: Column(
                          children: [
                            SizedBox(height: 10.h),
                            Text(
                              "Scrivi la tua e-mail",
                              style: Theme.of(
                                context,
                              ).textTheme.bodyMedium!.copyWith(fontSize: 16.sp),
                            ),
                            SizedBox(height: 10.h),
                            _buildAlignRichText(context),
                            SizedBox(height: 15.h),
                            TextFormField(
                              controller: emailTeController,
                              decoration: InputDecoration(
                                hintText: "esempio@esempio.com",
                              ),
                            ),
                            SizedBox(height: 25.h),
                            _buildSizedBoxButton(),
                            TextButton(
                              onPressed: () {
                                Get.offNamed("/login");
                              },
                              child: Text('have an account'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Align _buildAlignRichText(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "E-mail",
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
          Get.to(()=>OtpView());
        },
        child: Text("Procedi", style: TextStyle(fontSize: 16.sp)),
      ),
    );
  }
}
