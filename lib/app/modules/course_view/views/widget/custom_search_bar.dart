import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearchBar extends StatelessWidget {
  final String hintText;
  final VoidCallback? onBack;
  final VoidCallback? onMenu;
  final VoidCallback? onMic;
  final ValueChanged<String>? onChanged;

  const CustomSearchBar({
    super.key,
    this.hintText = 'Ricerca',
    this.onBack,
    this.onMenu,
    this.onMic,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: onBack,
            icon: const Icon(Icons.arrow_back_ios),
            splashRadius: 24,
          ),
          Expanded(
            child: Container(
              width: 400.w,
              height: 35.h ,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: Colors.green,
                  width: 1.5,
                ),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  const Icon(Icons.search, color: Colors.grey),
                  const SizedBox(width: 5),
                  Expanded(
                    child: TextField(
                      onChanged: onChanged,
                      decoration: InputDecoration(
                        hintText: hintText,
                        hintStyle: const TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: onMic,
                    icon: const Icon(Icons.mic, color: Colors.grey),
                    splashRadius: 20,
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            onPressed: onMenu,
            icon: const Icon(Icons.menu),
            splashRadius: 24,
          ),
        ],
      ),
    );
  }
}
