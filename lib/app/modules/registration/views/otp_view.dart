import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/asset_path.dart';
import '../controllers/registration_controller.dart';

class OtpView extends GetView<RegistrationController> {
  OtpView({super.key});


  final TextEditingController otpTeController  = TextEditingController();

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
                      Image.asset(AssetPath.otpPng),
                      SizedBox(height: 20.h),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(5.w),
                        decoration: BoxDecoration(color: AppColors.secondary),
                        child: Column(
                          children: [
                            SizedBox(height: 10.h),
                            Text(
                              "Verifica la tua e-mail",
                              style: Theme.of(
                                context,
                              ).textTheme.bodyMedium!.copyWith(fontSize: 16.sp),
                            ),
                            SizedBox(height: 8.h,),
                            Text(
                              "Ti arriverà il codice OTP all'indirizzo e-mail fornito",
                              style: Theme.of(
                                context,
                              ).textTheme.bodyMedium!.copyWith(fontSize: 11.sp , fontWeight: FontWeight.normal),
                            ),
                            SizedBox(height: 10.h,),
                            Text(
                              "Inserisci il codice di 4 cifre ricevuto",
                              style: Theme.of(
                                context,
                              ).textTheme.bodyMedium!.copyWith(fontSize: 16.sp , ),
                            ),
                            SizedBox(height: 15.h),
                            OtpTextField(
                              numberOfFields: 4,
                              borderColor: Colors.transparent,
                              enabledBorderColor: Colors.transparent,
                              focusedBorderColor: Colors.transparent,
                              showFieldAsBox: true,
                              fieldWidth: 60,
                              filled: true,
                              fillColor: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              onCodeChanged: (String code) {
                                otpTeController.text = code;
                              },
                              onSubmit: (String verificationCode) {
                                otpTeController.text = verificationCode;
                                print("OTP: $verificationCode");
                              },
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

  Widget _buildSizedBoxButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Get.offNamed('/registration-details-view');
        },
        child: Text("Procedi", style: TextStyle(fontSize: 16.sp)),
      ),
    );
  }
}
