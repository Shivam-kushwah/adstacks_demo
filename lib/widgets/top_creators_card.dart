import 'package:flutter/material.dart';
import '../data/dashboard_data.dart';
import '../theme/app_colors.dart';
import 'initials_avatar.dart';

class TopCreatorsCard extends StatelessWidget {
  const TopCreatorsCard({super.key});

  static const List<Color> _avatarColors = [
    AppColors.pink,
    AppColors.blue,
    Color(0xFF8A4FE0),
    Color(0xFF4FA6E0),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.darkCard,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Top Creators',
            style: TextStyle(
              color: AppColors.onDark,
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 16),
          const _HeaderRow(),
          const SizedBox(height: 8),
          ...List.generate(DashboardData.creators.length, (i) {
            return _CreatorRow(
              creator: DashboardData.creators[i],
              color: _avatarColors[i % _avatarColors.length],
            );
          }),
        ],
      ),
    );
  }
}

class _HeaderRow extends StatelessWidget {
  const _HeaderRow();

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(color: AppColors.onDarkMuted, fontSize: 11);
    return const Row(
      children: [
        Expanded(flex: 4, child: Text('Name', style: style)),
        Expanded(flex: 2, child: Text('Artworks', style: style)),
        Expanded(flex: 3, child: Text('Rating', style: style)),
      ],
    );
  }
}

class _CreatorRow extends StatelessWidget {
  final CreatorItem creator;
  final Color color;
  const _CreatorRow({required this.creator, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Row(
              children: [
                InitialsAvatar(name: creator.name, color: color, size: 28),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    creator.name,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: AppColors.onDark, fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              '${creator.artworks}',
              style: const TextStyle(color: AppColors.onDark, fontSize: 12),
            ),
          ),
          Expanded(
            flex: 3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: LinearProgressIndicator(
                value: creator.rating,
                minHeight: 6,
                backgroundColor: Colors.white.withValues(alpha: 0.12),
                valueColor: const AlwaysStoppedAnimation(AppColors.purpleSoft),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
