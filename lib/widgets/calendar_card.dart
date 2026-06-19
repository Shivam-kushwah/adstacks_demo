import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class CalendarCard extends StatefulWidget {
  final DateTime initialMonth;
  final int? initialSelectedDay;

  const CalendarCard({
    super.key,
    required this.initialMonth,
    this.initialSelectedDay,
  });

  @override
  State<CalendarCard> createState() => _CalendarCardState();
}

class _CalendarCardState extends State<CalendarCard> {
  late DateTime _month;
  DateTime? _selected;


  static final DateTime _designToday = DateTime(2025, 10, 27);

  @override
  void initState() {
    super.initState();
    _month = DateTime(widget.initialMonth.year, widget.initialMonth.month);
    if (widget.initialSelectedDay != null) {
      _selected = DateTime(_month.year, _month.month, widget.initialSelectedDay!);
    }
  }

  void _changeMonth(int delta) {
    setState(() => _month = DateTime(_month.year, _month.month + delta));
  }

  void _setMonth(int month) {
    setState(() => _month = DateTime(_month.year, month));
  }

  void _setYear(int year) {
    setState(() => _month = DateTime(year, _month.month));
  }

  bool _sameDay(DateTime? a, DateTime b) =>
      a != null && a.year == b.year && a.month == b.month && a.day == b.day;

  List<DateTime> _grid() {
    final first = DateTime(_month.year, _month.month, 1);
    final leading = first.weekday - 1; // Monday-first
    final start = first.subtract(Duration(days: leading));
    return List.generate(42, (i) => start.add(Duration(days: i)));
  }

  @override
  Widget build(BuildContext context) {
    const weekdays = ['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su'];
    final days = _grid();

    return Container(
      decoration: BoxDecoration(
        color: AppColors.darkPanelCard,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              'GENERAL 10:00 AM TO 7:00 PM',
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.85),
                fontSize: 11,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.3,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                _MonthDropdown(month: _month.month, onSelected: _setMonth),
                const SizedBox(width: 8),
                _YearDropdown(year: _month.year, onSelected: _setYear),
                const Spacer(),
                _NavArrow(
                  icon: Icons.chevron_left_rounded,
                  onTap: () => _changeMonth(-1),
                ),
                const SizedBox(width: 6),
                _NavArrow(
                  icon: Icons.chevron_right_rounded,
                  onTap: () => _changeMonth(1),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),

          Container(
            margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Row(
                  children: weekdays
                      .map((d) => Expanded(
                    child: Center(
                      child: Text(
                        d,
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textGrey,
                        ),
                      ),
                    ),
                  ))
                      .toList(),
                ),
                const SizedBox(height: 6),
                GridView.count(
                  crossAxisCount: 7,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio: 1.1,
                  children: days.map((d) {
                    final inMonth = d.month == _month.month;
                    return _DayCell(
                      day: d,
                      inMonth: inMonth,
                      isToday: inMonth && _sameDay(_designToday, d),
                      isSelected: inMonth && _sameDay(_selected, d),
                      onTap: inMonth ? () => setState(() => _selected = d) : null,
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Pill extends StatelessWidget {
  final String label;
  const _Pill({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label,
              style: const TextStyle(color: Colors.white, fontSize: 11)),
          const SizedBox(width: 6),
          const Icon(Icons.keyboard_arrow_down_rounded,
              size: 14, color: Colors.white),
        ],
      ),
    );
  }
}

class _MonthDropdown extends StatelessWidget {
  final int month; // 1..12
  final ValueChanged<int> onSelected;
  const _MonthDropdown({required this.month, required this.onSelected});

  static const _abbr = [
    'JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN',
    'JUL', 'AUG', 'SEP', 'OCT', 'NOV', 'DEC'
  ];
  static const _full = [
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December'
  ];

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      tooltip: 'Select month',
      initialValue: month,
      offset: const Offset(0, 40),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      onSelected: onSelected,
      itemBuilder: (_) => [
        for (var m = 1; m <= 12; m++)
          PopupMenuItem<int>(value: m, child: Text(_full[m - 1])),
      ],
      child: _Pill(label: _abbr[month - 1]),
    );
  }
}

class _YearDropdown extends StatelessWidget {
  final int year;
  final ValueChanged<int> onSelected;
  const _YearDropdown({required this.year, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    final years = [for (var y = 2020; y <= 2035; y++) y];
    return PopupMenuButton<int>(
      tooltip: 'Select year',
      initialValue: years.contains(year) ? year : null,
      offset: const Offset(0, 40),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      onSelected: onSelected,
      itemBuilder: (_) => [
        for (final y in years) PopupMenuItem<int>(value: y, child: Text('$y')),
      ],
      child: _Pill(label: '$year'),
    );
  }
}

class _NavArrow extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _NavArrow({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white.withValues(alpha: 0.12),
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        hoverColor: Colors.white.withValues(alpha: 0.18),
        child: SizedBox(
          width: 26,
          height: 26,
          child: Icon(icon, size: 18, color: Colors.white),
        ),
      ),
    );
  }
}

class _DayCell extends StatelessWidget {
  final DateTime day;
  final bool inMonth;
  final bool isToday;
  final bool isSelected;
  final VoidCallback? onTap;

  const _DayCell({
    required this.day,
    required this.inMonth,
    required this.isToday,
    required this.isSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color? bg;
    Color textColor = inMonth ? AppColors.textDark : AppColors.textMuted;

    if (isSelected) {
      bg = AppColors.purple;
      textColor = Colors.white;
    } else if (isToday) {
      bg = AppColors.lavenderActive;
      textColor = AppColors.purple;
    }

    return Center(
      child: Material(
        color: bg ?? Colors.transparent,
        shape: const CircleBorder(),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          hoverColor: inMonth && !isSelected
              ? AppColors.lavenderActive
              : Colors.transparent,
          child: SizedBox(
            width: 24,
            height: 24,
            child: Center(
              child: Text(
                '${day.day}',
                style: TextStyle(
                  fontSize: 11,
                  color: textColor,
                  fontWeight: (isToday || isSelected)
                      ? FontWeight.w600
                      : FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}