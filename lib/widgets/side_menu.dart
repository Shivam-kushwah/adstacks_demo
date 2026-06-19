import 'package:flutter/material.dart';
import '../data/dashboard_data.dart';
import '../theme/app_colors.dart';
import 'initials_avatar.dart';

class SideMenu extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onSelect;

  const SideMenu({
    super.key,
    required this.selectedIndex,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: AppColors.sidebar,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _Logo(),
            const SizedBox(height: 22),
            const Divider(height: 1, color: AppColors.divider),
            const SizedBox(height: 22),
            const _ProfileBlock(),
            const SizedBox(height: 26),
            ...List.generate(DashboardData.menu.length, (i) {
              final item = DashboardData.menu[i];
              return _NavTile(
                icon: item.icon,
                label: item.label,
                selected: selectedIndex == i,
                onTap: () => onSelect(i),
              );
            }),
            const SizedBox(height: 18),
            _WorkspaceHeader(),
            const SizedBox(height: 6),
            ...DashboardData.workspaces.map((w) => _WorkspaceTile(label: w)),
            const SizedBox(height: 28),
            const Divider(height: 1, color: AppColors.divider),
            const SizedBox(height: 12),
            const _NavTile(
              icon: Icons.settings_outlined,
              label: 'Setting',
              selected: false,
            ),
            const _NavTile(
              icon: Icons.logout_rounded,
              label: 'Logout',
              selected: false,
            ),
          ],
        ),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.pink, AppColors.purple],
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: const Text(
              'AS',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(width: 10),
          RichText(
            text: const TextSpan(
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              children: [
                TextSpan(text: 'Ad', style: TextStyle(color: AppColors.pink)),
                TextSpan(text: 'stacks', style: TextStyle(color: AppColors.purple)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileBlock extends StatelessWidget {
  const _ProfileBlock();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const InitialsAvatar(
            name: 'Pooja Mishra',
            color: AppColors.purple,
            size: 72,
            ringColor: AppColors.lavenderActive,
          ),
          const SizedBox(height: 12),
          const Text(
            'Pooja Mishra',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          ),
          const SizedBox(height: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.divider),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'Admin',
              style: TextStyle(fontSize: 12, color: AppColors.textGrey),
            ),
          ),
        ],
      ),
    );
  }
}

class _NavTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback? onTap;

  const _NavTile({
    required this.icon,
    required this.label,
    required this.selected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = selected ? AppColors.purple : AppColors.textGrey;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
      child: Material(
        color: selected ? AppColors.lavenderActive : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          hoverColor: AppColors.lavenderActive.withValues(alpha: 0.6),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            child: Row(
              children: [
                Icon(icon, size: 20, color: color),
                const SizedBox(width: 14),
                Text(
                  label,
                  style: TextStyle(
                    color: selected ? AppColors.textDark : AppColors.textGrey,
                    fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _WorkspaceHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 0, 24, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'WORKSPACES',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 12,
              letterSpacing: 0.5,
              color: AppColors.textDark,
            ),
          ),
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: AppColors.lavenderActive,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.add, size: 16, color: AppColors.purple),
          ),
        ],
      ),
    );
  }
}

class _WorkspaceTile extends StatelessWidget {
  final String label;
  const _WorkspaceTile({required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 4, 24, 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(color: AppColors.textGrey, fontSize: 13),
          ),
          const Icon(Icons.keyboard_arrow_down_rounded,
              size: 18, color: AppColors.textGrey),
        ],
      ),
    );
  }
}
