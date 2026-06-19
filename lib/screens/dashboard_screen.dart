import 'package:flutter/material.dart';
import '../data/dashboard_data.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../widgets/content_area.dart';
import '../widgets/placeholder_page.dart';
import '../widgets/right_panel.dart';
import '../widgets/side_menu.dart';
import '../widgets/top_bar.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedNav = 0;

  void _onSelect(int i) {
    setState(() => _selectedNav = i);
    if (!Responsive.isDesktop(context)) Navigator.of(context).maybePop();
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);
    final isMobile = Responsive.isMobile(context);

    final sideMenu = SideMenu(selectedIndex: _selectedNav, onSelect: _onSelect);

    final Widget mainRegion = _selectedNav == 0
        ? Row(
            children: [
              const Expanded(child: ContentArea()),
              if (!isMobile) const RightPanel(),
            ],
          )
        : PlaceholderPage(
            title: DashboardData.menu[_selectedNav].label,
            icon: DashboardData.menu[_selectedNav].icon,
          );

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.scaffold,
      drawer: isDesktop ? null : Drawer(child: sideMenu),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Row(
              children: [
                if (isDesktop) sideMenu,
                Expanded(
                  child: Container(
                    color: AppColors.contentBg,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(24, 18, 24, 6),
                          child: TopBar(
                            onMenuTap: isDesktop
                                ? null
                                : () => _scaffoldKey.currentState?.openDrawer(),
                          ),
                        ),
                        Expanded(child: mainRegion),
                      ],
                    ),
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
