import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class HeroBanner extends StatelessWidget {
  const HeroBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Container(
        constraints: const BoxConstraints(minHeight: 180),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [AppColors.heroStart, AppColors.heroMid, AppColors.heroEnd],
          ),
        ),
        child: Stack(
          children: [

            const Positioned(right: 30, top: 18, child: _Shape(56, Color(0x33FFFFFF), isRing: true)),
            const Positioned(right: 120, top: 60, child: _Shape(40, Color(0x22FFFFFF))),
            const Positioned(right: 70, bottom: -10, child: _Shape(70, Color(0x33C24FD6))),
            const Positioned(right: 180, bottom: 20, child: _Shape(26, Color(0x44FFFFFF))),

            Padding(
              padding: const EdgeInsets.all(28),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ETHEREUM 2.0',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.75),
                      fontSize: 11,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Top Rating\nProject',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      height: 1.1,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Trending project and high rating\nProject Created by team.',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.8),
                      fontSize: 12,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: AppColors.purple,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Learn More.',
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Shape extends StatelessWidget {
  final double size;
  final Color color;
  final bool isRing;
  const _Shape(this.size, this.color, {this.isRing = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isRing ? Colors.transparent : color,
        border: isRing ? Border.all(color: color, width: 10) : null,
      ),
    );
  }
}
