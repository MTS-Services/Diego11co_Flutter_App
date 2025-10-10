import 'package:flutter/material.dart';

class CustomTile extends StatelessWidget {
  final IconData leadingIcon;
  final String title;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? iconColor;
  final Color? titleColor;
  final double borderRadius;

  const CustomTile({
    super.key,
    required this.leadingIcon,
    required this.title,
    this.onTap,
    this.backgroundColor,
    this.iconColor,
    this.titleColor,
    this.borderRadius = 50,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.grey.shade200,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(leadingIcon, color: iconColor ?? Colors.black),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: titleColor ?? Colors.black,
                  ),
                ),
              ],
            ),
            IconButton(
              onPressed: onTap,
              icon: const Icon(Icons.arrow_forward_ios_outlined, size: 18),
            ),
          ],
        ),
      ),
    );
  }
}
