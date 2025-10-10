import 'package:diego/app/core/constants/app_colors.dart';
import 'package:diego/app/modules/login/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/choose_language_controller.dart';

class ChooseLanguageView extends GetView<ChooseLanguageController> {
  ChooseLanguageView({super.key});

  // Reactive selected language
  final RxString selectedLanguage = ''.obs;

  final List<Map<String, String>> languages = [
    {'name': 'English', 'flag': '🇬🇧'},
    {'name': 'Italiano', 'flag': '🇮🇹'},
    {'name': 'Arabic', 'flag': '🇸🇦'},
    {'name': 'China', 'flag': '🇨🇳'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Choose a preferred language",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                // Reactive List
                 ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: languages.length,
                    itemBuilder: (context, index) {
                      final language = languages[index];
                      final isSelected =
                          selectedLanguage.value == (language['name'] ?? '');

                      return GestureDetector(
                        onTap: () {
                          selectedLanguage.value = language['name'] ?? '';
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          padding: EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 20,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? Colors.green[100]
                                : Colors.white,
                            border: Border.all(
                              color: isSelected ? Colors.green : Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: AppColors.secondary,
                                radius: 25,
                                child: Text(
                                  language['flag'] ?? '',
                                  style: TextStyle(fontSize: 24),
                                ),
                              ),
                              SizedBox(width: 15),
                              Text(
                                language['name'] ?? '',
                                style: TextStyle(fontSize: 18),
                              ),
                              Spacer(),
                              if (isSelected)
                                Icon(Icons.check_circle, color: Colors.green),
                            ],
                          ),
                        ),
                      );
                    },
                  ),

                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(()=>LoginView());
                    },
                    child: Text("Go ahead"),
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
