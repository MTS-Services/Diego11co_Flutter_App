import 'package:diego/app/core/constants/app_colors.dart';
import 'package:diego/app/core/constants/asset_path.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/cirtificate_download_controller.dart';

class CirtificateDownloadView extends GetView<CirtificateDownloadController> {
  const CirtificateDownloadView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Center(
            child: Column(
              children: [
                Image.asset(AssetPath.appLogoPng),
                SizedBox(height: 50),
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 2, color: AppColors.secondary),
                  ),
                  child: Column(
                    children: [
                      Image.asset(AssetPath.notFoundPng),
                      SizedBox(height: 20),
                      Text(
                        'Al momento non hai attestati.\nIscriviti a un corso oggi stesso!',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text("Catalgo corsi"),
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
}
