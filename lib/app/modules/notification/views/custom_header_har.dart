import 'package:diego/app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomHeaderBar extends StatelessWidget {
  final String text;
  final VoidCallback? onBack;
  final VoidCallback? onTapText;

  const CustomHeaderBar({
    super.key,
    required this.text,
    this.onBack,
    this.onTapText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          InkWell(
            onTap: onBack,
            borderRadius: BorderRadius.circular(50),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black.withOpacity(0.05),
              ),
              child: const Icon(
                Icons.arrow_back_ios_new,
                size: 18,
                color: Colors.black87,
              ),
            ),
          ),

          Flexible(
            child: GestureDetector(
              onTap: onTapText,
              child: Text(
                text,
                style: TextStyle(
                  color:AppColors.primary,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  overflow: TextOverflow.ellipsis
                ),
                maxLines: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
