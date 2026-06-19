import 'package:flutter/material.dart';
import '../theme/app_colors.dart';



class NavItem {
  final IconData icon;
  final String label;
  const NavItem(this.icon, this.label);
}

class ProjectItem {
  final String title;
  final String subtitle;
  final bool highlighted;
  const ProjectItem(this.title, this.subtitle, {this.highlighted = false});
}

class CreatorItem {
  final String name;
  final int artworks;
  final double rating;
  const CreatorItem(this.name, this.artworks, this.rating);
}

class EventPerson {
  final String name;
  final Color color;
  const EventPerson(this.name, this.color);
}

class DashboardData {
  DashboardData._();

  static const List<NavItem> menu = [
    NavItem(Icons.home_rounded, 'Home'),
    NavItem(Icons.groups_rounded, 'Employees'),
    NavItem(Icons.event_available_rounded, 'Attendance'),
    NavItem(Icons.calendar_month_rounded, 'Summary'),
    NavItem(Icons.info_outline_rounded, 'Information'),
  ];

  static const List<String> workspaces = ['Adstacks', 'Finance'];

  static const List<ProjectItem> projects = [
    ProjectItem('Technology behind the Blockchain', 'Project #1  •  See project details',
        highlighted: true),
    ProjectItem('Technology behind the Blockchain', 'Project #1  •  See project details'),
    ProjectItem('Technology behind the Blockchain', 'Project #1  •  See project details'),
  ];

  static const List<CreatorItem> creators = [
    CreatorItem('@maddison_c21', 9821, 0.55),
    CreatorItem('@karixell02', 7032, 0.40),
    CreatorItem('@maddison_c21', 9821, 0.70),
    CreatorItem('@maddison_c21', 9821, 0.50),
  ];

  static const List<EventPerson> birthdays = [
    EventPerson('Ava', AppColors.pink),
    EventPerson('Leo', AppColors.blue),
  ];

  static const List<EventPerson> anniversaries = [
    EventPerson('Mia', Color(0xFF8A4FE0)),
    EventPerson('Sam', Color(0xFF4FA6E0)),
    EventPerson('Eva', Color(0xFFE0A24F)),
  ];

  static const List<double> years = [2015, 2016, 2017, 2018, 2019, 2020];
  static const List<double> pendingDone = [18, 31, 12, 34, 16, 40];
  static const List<double> projectDone = [26, 20, 36, 22, 41, 28];
}
