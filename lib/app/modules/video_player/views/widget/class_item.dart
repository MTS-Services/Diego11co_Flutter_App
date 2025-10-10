import 'package:diego/app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

enum ClassStatus { completed, inProgress, locked }

class ClassItem extends StatelessWidget {
  final int classNumber;
  final ClassStatus status;
  final double? progress;
  final String duration;

  const ClassItem({
    super.key,
    required this.classNumber,
    required this.status,
    this.progress,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(8),
        border: status == ClassStatus.inProgress
            ? Border.all(color: const Color(0xFF7FC8A9), width: 2)
            : null,
      ),
      child: Row(
        children: [
          _buildStatusIcon(),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🎯 Class Title
                Text(
                  'Class-$classNumber',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF2D2D2D),
                  ),
                ),

                // 🟩 Progress Bar (completed & inProgress)
                if (status != ClassStatus.locked) ...[
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: LinearProgressIndicator(
                            value: status == ClassStatus.completed
                                ? 1
                                : (progress ?? 0),
                            minHeight: 6,
                            backgroundColor: const Color(0xFFE0E0E0),
                            valueColor: AlwaysStoppedAnimation<Color>(
                              status == ClassStatus.completed
                                  ? const Color(0xFF7FC8A9)
                                  : const Color(0xFFF5A623),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        status == ClassStatus.completed
                            ? '100% Completato'
                            : '${((progress ?? 0) * 100).toInt()}% Completamento',
                        style: TextStyle(
                          fontSize: 12,
                          color: status == ClassStatus.completed
                              ? const Color(0xFF7FC8A9)
                              : const Color(0xFFF5A623),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: 16),
          // ⏱ Duration Text
          Text(
            duration,
            style: TextStyle(
              fontSize: 14,
              color: status == ClassStatus.completed
                  ? const Color(0xFF7FC8A9)
                  : status == ClassStatus.inProgress
                  ? const Color(0xFFF5A623)
                  : const Color(0xFF757575),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusIcon() {
    switch (status) {
      case ClassStatus.completed:
        return Container(
          width: 32,
          height: 32,
          decoration: const BoxDecoration(
            color: Color(0xFF7FC8A9),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.check,
            color: Colors.white,
            size: 20,
          ),
        );
      case ClassStatus.inProgress:
        return Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: const Color(0xFF7FC8A9).withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.play_arrow,
            color: Color(0xFF7FC8A9),
            size: 20,
          ),
        );
      case ClassStatus.locked:
        return Container(
          width: 32,
          height: 32,
          decoration: const BoxDecoration(
            color: Color(0xFF9E9E9E),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.lock,
            color: Colors.white,
            size: 18,
          ),
        );
    }
  }
}
