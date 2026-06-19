import 'package:flutter/material.dart';
import '../data/dashboard_data.dart';
import '../theme/app_colors.dart';
import 'initials_avatar.dart';

class EventCard extends StatelessWidget {
  final String title;
  final List<EventPerson> people;
  final int total;
  final String buttonLabel;
  final IconData buttonIcon;

  const EventCard({
    super.key,
    required this.title,
    required this.people,
    required this.total,
    required this.buttonLabel,
    required this.buttonIcon,
  });

  void _sendWish(BuildContext context) {
    final messenger = ScaffoldMessenger.of(context);
    messenger.hideCurrentSnackBar();
    messenger.showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppColors.purple,
        duration: const Duration(seconds: 2),
        content: Row(
          children: [
            Icon(buttonIcon, color: Colors.white, size: 18),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                '$buttonLabel sent to $total ${total == 1 ? 'person' : 'people'}',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.darkPanelCard,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.auto_awesome, size: 16, color: Color(0xFFE0C24F)),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  color: AppColors.onDark,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Overlapping avatars
          SizedBox(
            height: 44,
            child: Stack(
              children: [
                for (var i = 0; i < people.length; i++)
                  Positioned(
                    left: i * 30.0,
                    child: InitialsAvatar(
                      name: people[i].name,
                      color: people[i].color,
                      size: 44,
                      ringColor: AppColors.darkPanelCard,
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const Text(
                'Total',
                style: TextStyle(color: AppColors.onDarkMuted, fontSize: 12),
              ),
              const SizedBox(width: 12),
              Container(
                width: 1,
                height: 16,
                color: Colors.white.withValues(alpha: 0.15),
              ),
              const SizedBox(width: 12),
              Text(
                '$total',
                style: const TextStyle(
                  color: AppColors.onDark,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () => _sendWish(context),
              icon: Icon(buttonIcon, size: 15),
              label: Text(buttonLabel, style: const TextStyle(fontSize: 12)),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.purple,
                foregroundColor: Colors.white,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 11),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}