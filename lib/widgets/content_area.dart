import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'all_projects_card.dart';
import 'hero_banner.dart';
import 'performance_chart.dart';
import 'right_panel.dart';
import 'top_creators_card.dart';

class ContentArea extends StatelessWidget {
  const ContentArea({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const HeroBanner(),
          const SizedBox(height: 20),
          LayoutBuilder(
            builder: (context, c) {
              if (c.maxWidth < 760) {
                return const Column(
                  children: [
                    AllProjectsCard(),
                    SizedBox(height: 20),
                    TopCreatorsCard(),
                  ],
                );
              }
              return const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: AllProjectsCard()),
                  SizedBox(width: 20),
                  Expanded(child: TopCreatorsCard()),
                ],
              );
            },
          ),
          const SizedBox(height: 20),
          const PerformanceChart(),
          if (isMobile) ...[
            const SizedBox(height: 20),
            const RightPanel(framed: false),
          ],
        ],
      ),
    );
  }
}
