import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class PlaceholderPage extends StatelessWidget {
  final String title;
  final IconData icon;

  const PlaceholderPage({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 88,
            height: 88,
            decoration: BoxDecoration(
              color: AppColors.lavenderActive,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Icon(icon, size: 40, color: AppColors.purple),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: AppColors.textDark,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'This section is coming soon.',
            style: TextStyle(fontSize: 14, color: AppColors.textGrey),
          ),
        ],
      ),
    );
  }
}
