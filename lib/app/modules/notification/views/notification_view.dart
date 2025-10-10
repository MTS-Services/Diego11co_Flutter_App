import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:diego/app/core/constants/asset_path.dart';
import '../controllers/notification_controller.dart';
import 'custom_header_har.dart';
import 'notification_card.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff9f9f9),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            children: [
              Image.asset(
                AssetPath.appLogoPng,
                height: 60,
              ),

              const SizedBox(height: 20),

              CustomHeaderBar(
                text: 'Segna tutti come già letti',
                onBack: () => Get.back(),
                onTapText: () {

                  print('Mark all as read tapped');
                },
              ),

              const SizedBox(height: 10),


              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return NotificationCard(
                      title: "Hai un nuovo corso da frequentare",
                      message:
                      "Inizia il tuo corso di formazione! Il team UnoSicurezza",
                      time: "9 min ago",
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
