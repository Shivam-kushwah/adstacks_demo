import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../data/dashboard_data.dart';
import '../theme/app_colors.dart';

class PerformanceChart extends StatelessWidget {
  const PerformanceChart({super.key});

  List<FlSpot> _spots(List<double> values) =>
      [for (var i = 0; i < values.length; i++) FlSpot(i.toDouble(), values[i])];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 14),
      decoration: BoxDecoration(
        color: AppColors.contentBg,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.divider),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Wrap(
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            runSpacing: 8,
            spacing: 12,
            children: [
              Text(
                'Over  All Performance\nThe Years',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  height: 1.3,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _Legend(color: AppColors.pink, label: 'Pending\nDone'),
                  SizedBox(width: 16),
                  _Legend(color: AppColors.blue, label: 'Project\nDone'),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 200,
            child: Stack(
              children: [
                LineChart(_chartData()),

                Positioned(
                  left: 0,
                  right: 0,
                  top: 6,
                  child: Center(
                    child: Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: AppColors.purple,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        '2023\n• 55',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          height: 1.2,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  LineChartData _chartData() {
    return LineChartData(
      minX: 0,
      maxX: 5,
      minY: 0,
      maxY: 50,
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        horizontalInterval: 10,
        getDrawingHorizontalLine: (_) =>
            const FlLine(color: AppColors.divider, strokeWidth: 1),
      ),
      borderData: FlBorderData(show: false),
      titlesData: FlTitlesData(
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 10,
            reservedSize: 30,
            getTitlesWidget: (value, _) => Text(
              value.toInt().toString(),
              style: const TextStyle(color: AppColors.textMuted, fontSize: 10),
            ),
          ),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            reservedSize: 26,
            getTitlesWidget: (value, _) {
              final idx = value.toInt();
              if (idx < 0 || idx >= DashboardData.years.length) {
                return const SizedBox.shrink();
              }
              return Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  DashboardData.years[idx].toInt().toString(),
                  style: const TextStyle(color: AppColors.textMuted, fontSize: 10),
                ),
              );
            },
          ),
        ),
      ),
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          getTooltipColor: (_) => AppColors.darkCard,
        ),
      ),
      lineBarsData: [
        _bar(_spots(DashboardData.pendingDone), AppColors.pink, fill: false),
        _bar(_spots(DashboardData.projectDone), AppColors.blue, fill: true),
      ],
    );
  }

  LineChartBarData _bar(List<FlSpot> spots, Color color, {required bool fill}) {
    return LineChartBarData(
      spots: spots,
      isCurved: true,
      curveSmoothness: 0.35,
      color: color,
      barWidth: 3,
      isStrokeCapRound: true,
      dotData: const FlDotData(show: false),
      belowBarData: BarAreaData(
        show: fill,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [color.withValues(alpha: 0.18), color.withValues(alpha: 0.0)],
        ),
      ),
    );
  }
}

class _Legend extends StatelessWidget {
  final Color color;
  final String label;
  const _Legend({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: const TextStyle(
            fontSize: 10,
            height: 1.1,
            color: AppColors.textGrey,
          ),
        ),
      ],
    );
  }
}
