import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import 'initials_avatar.dart';

class TopBar extends StatelessWidget {
  final VoidCallback? onMenuTap;
  const TopBar({super.key, this.onMenuTap});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, c) {
        final showSearch = c.maxWidth > 560;
        return Row(
          children: [
            if (onMenuTap != null)
              IconButton(
                onPressed: onMenuTap,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: const Icon(Icons.menu_rounded, color: AppColors.textDark),
              ),
            if (onMenuTap != null) const SizedBox(width: 12),
            const Flexible(
              child: Text(
                'Home',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textGrey,
                ),
              ),
            ),
            const Spacer(),
            if (showSearch) ...[
              Flexible(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 280),
                  child: _SearchBox(),
                ),
              ),
              const SizedBox(width: 16),
            ],
            const _RoundIcon(icon: Icons.chat_bubble_outline_rounded),
            const SizedBox(width: 10),
            const _RoundIcon(icon: Icons.notifications_none_rounded, dot: true),
            const SizedBox(width: 10),
            const _RoundIcon(icon: Icons.power_settings_new_rounded),
            const SizedBox(width: 14),
            const InitialsAvatar(name: 'Pooja Mishra', color: AppColors.purple, size: 38),
          ],
        );
      },
    );
  }
}

class _SearchBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.darkCard,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Row(
        children: [
          Expanded(
            child: TextField(
              style: TextStyle(color: Colors.white, fontSize: 13),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                isDense: true,
                border: InputBorder.none,
                hintText: 'Search',
                hintStyle: TextStyle(color: AppColors.onDarkMuted, fontSize: 13),
              ),
            ),
          ),
         Icon(Icons.search, color: AppColors.onDarkMuted, size: 20),
        ],
      ),
    );
  }
}

class _RoundIcon extends StatelessWidget {
  final IconData icon;
  final bool dot;
  const _RoundIcon({required this.icon, this.dot = false});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Material(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: AppColors.divider),
          ),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () {},
            hoverColor: AppColors.lavenderActive,
            child: SizedBox(
              width: 40,
              height: 40,
              child: Icon(icon, size: 18, color: AppColors.textDark),
            ),
          ),
        ),
        if (dot)
          Positioned(
            right: 9,
            top: 9,
            child: Container(
              width: 7,
              height: 7,
              decoration: const BoxDecoration(
                color: AppColors.pink,
                shape: BoxShape.circle,
              ),
            ),
          ),
      ],
    );
  }
}
