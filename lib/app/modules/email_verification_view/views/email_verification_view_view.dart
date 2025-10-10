import 'package:diego/app/core/constants/app_colors.dart';
import 'package:diego/app/core/constants/asset_path.dart';
import 'package:diego/app/modules/email_verification_view/views/otp_verification_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/email_verification_view_controller.dart';


class EmailVerificationViewView extends GetView<EmailVerificationViewController> {
  EmailVerificationViewView({super.key});
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
                SizedBox(height:150.h,),
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(onPressed: (){
                    Get.back();
                  }, icon: Icon(Icons.arrow_back)),
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
                            SizedBox(height: 10,)
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
          Get.to(()=>OtpVerificationView());
        },
        child: Text("Procedi", style: TextStyle(fontSize: 16.sp)),
      ),
    );
  }
}
