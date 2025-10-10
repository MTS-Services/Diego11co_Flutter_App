import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileWidget extends StatelessWidget {
  final String imageUrl;
  final String message;
  final String name;
  final VoidCallback? onNotificationTap;
  final Color? notificationIconBgColor;

  const ProfileWidget({
    super.key,
    required this.imageUrl,
    required this.message,
    required this.name,
    this.onNotificationTap,
    this.notificationIconBgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 22.r,
          backgroundImage: NetworkImage(imageUrl),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                message,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.grey,
                ),
              ),
              Text(
                name,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        InkWell(
          onTap: onNotificationTap,
          child: Container(
            decoration: BoxDecoration(
              color: notificationIconBgColor ?? Colors.blue,
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.all(6.w),
            child: Icon(
              Icons.notifications_none,
              size: 20.sp,
            ),
          ),
        ),
      ],
    );
  }
}
