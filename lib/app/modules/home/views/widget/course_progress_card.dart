import 'package:diego/app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseProgressCard extends StatelessWidget {
  final String imageUrl;
  final String status;
  final String title;
  final String hours;
  final double progress;
  final Color statusColor;
  final bool showProgress;

  const CourseProgressCard({
    super.key,
    required this.imageUrl,
    required this.status,
    required this.title,
    required this.hours,
    required this.progress,
    this.statusColor = AppColors.statusColor,
    this.showProgress = true,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.textFieldColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      elevation: 3,
      margin: EdgeInsets.all(8.w),
      child: Padding(
        padding: EdgeInsets.all(8.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image.network(
                imageUrl,
                height: 100.h,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 8.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: statusColor.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Text(
                status.toUpperCase(),
                style: TextStyle(
                  color: Colors.orange.shade700,
                  fontWeight: FontWeight.w600,
                  fontSize: 11.sp,
                ),
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              title,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 3.h),
            Text(
              hours,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 12.sp,
              ),
            ),

            if (showProgress) ...[
              SizedBox(height: 6.h),
              ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: LinearProgressIndicator(
                  value: progress,
                  minHeight: 6.h,
                  backgroundColor: Colors.grey.shade200,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.green.shade300,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
