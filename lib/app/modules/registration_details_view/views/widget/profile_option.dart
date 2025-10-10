import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileOption extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const ProfileOption({
    Key? key,
    required this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: onTap,
          icon: Icon(
            Icons.arrow_back,
            size: 24.r,
          ),
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(),
          splashRadius: 20.r,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
