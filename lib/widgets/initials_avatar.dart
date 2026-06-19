import 'package:flutter/material.dart';

class InitialsAvatar extends StatelessWidget {
  final String name;
  final Color color;
  final double size;
  final Color? ringColor;

  const InitialsAvatar({
    super.key,
    required this.name,
    required this.color,
    this.size = 36,
    this.ringColor,
  });

  String get _initials {
    final clean = name.replaceAll('@', '').trim();
    if (clean.isEmpty) return '?';
    final parts = clean.split(RegExp(r'[ _]+'));
    if (parts.length == 1) {
      return parts.first.substring(0, 1).toUpperCase();
    }
    return (parts[0].substring(0, 1) + parts[1].substring(0, 1)).toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [color, color.withValues(alpha: 0.65)],
        ),
        border: ringColor != null ? Border.all(color: ringColor!, width: 2) : null,
      ),
      alignment: Alignment.center,
      child: Text(
        _initials,
        style: TextStyle(
          color: Colors.white,
          fontSize: size * 0.36,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
