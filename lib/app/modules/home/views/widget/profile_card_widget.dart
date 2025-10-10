import 'package:diego/app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ProfileProgressCard extends StatelessWidget {
  final String name;
  final String message;
  final double progress;
  final String imageUrl;
  final VoidCallback? onNotificationTap;

  const ProfileProgressCard({
    super.key,
    required this.name,
    required this.message,
    required this.progress,
    required this.imageUrl,
    this.onNotificationTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 1,
      color: AppColors.textFieldColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundImage: NetworkImage(imageUrl),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        message,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 16,
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
                      color: AppColors.secondary,
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(6),
                    child: const Icon(Icons.notifications_none, size: 20),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              "Avanzamento",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                      value: progress,
                      minHeight: 8,
                      backgroundColor: AppColors.secondary,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        AppColors.primary
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Text("${(progress * 100).toInt()}%"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
