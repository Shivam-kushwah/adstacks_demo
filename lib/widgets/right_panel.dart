import 'package:flutter/material.dart';
import '../data/dashboard_data.dart';
import '../theme/app_colors.dart';
import 'calendar_card.dart';
import 'event_card.dart';

class RightPanel extends StatelessWidget {

  final bool framed;

  const RightPanel({super.key, this.framed = true});

  @override
  Widget build(BuildContext context) {
    final content = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CalendarCard(
          initialMonth: DateTime(2025, 10),
          initialSelectedDay: 30,
        ),
        const SizedBox(height: 16),
        const EventCard(
          title: 'Today Birthday',
          people: DashboardData.birthdays,
          total: 2,
          buttonLabel: 'Birthday Wishing',
          buttonIcon: Icons.cake_outlined,
        ),
        const SizedBox(height: 16),
        const EventCard(
          title: 'Anniversary',
          people: DashboardData.anniversaries,
          total: 3,
          buttonLabel: 'Anniversary Wishing',
          buttonIcon: Icons.send_rounded,
        ),
      ],
    );

    if (!framed) return content;

    return Container(
      width: 300,
      decoration: const BoxDecoration(
        color: AppColors.darkPanel,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          bottomLeft: Radius.circular(24),
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(child: content),
    );
  }
}
