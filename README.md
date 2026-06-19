# Adstacks Dashboard — Flutter (App & Web)

A responsive admin dashboard built with Flutter, recreating the provided Adstacks
design and running on both mobile and web from a single codebase.

> Built as the solution to the **Adstacks Media — Flutter Developer (App & Web)** test

---

## Features

- **Faithful UI** — sidebar, top bar, hero banner, project & creator cards, performance chart, and the right-rail calendar / birthday / anniversary widgets, matching the reference design.
- **Responsive (App + Web)** — adapts from a three-column desktop layout to a single-column mobile layout with a navigation drawer.
- **Sidebar navigation** — selecting a menu item swaps the main view; the active item stays highlighted.
- **Interactive calendar** — pick a month and year from dropdowns, step months with the arrows, and tap any day to select it.
- **Editable projects** — tap a project (or its pencil) to edit its title and subtitle in a dialog; changes apply immediately.
- **Action feedback** — the Birthday / Anniversary "Wishing" buttons confirm with a snackbar.
- **Web polish** — hover and pointer states on interactive elements.
- **Clean codebase** — modular widgets, a mock-data layer, and a passing `flutter analyze`.

---

## Tech stack

- **Flutter** (Material 3)
- **fl_chart** — the "Over All Performance" line chart
- **google_fonts** — Poppins typeface

---

## Getting started

Requires Flutter **3.13.0 or newer** (Dart 3.1+).

```bash
# 1. Clone
git clone <your-repo-url>
cd adstacks_dashboard

# 2. Install dependencies
flutter pub get

# 3. Run on web
flutter run -d chrome

#    ...or on a connected device / emulator
flutter run
```

To produce a release web build:

```bash
flutter build web
# output in build/web/
```

---

## Project structure

```
lib/
├── main.dart                     # App entry
├── theme/
│   ├── app_colors.dart           # Palette sampled from the design
│   └── app_theme.dart            # ThemeData + responsive breakpoints
├── data/
│   └── dashboard_data.dart       # Models + mock data (swap for an API layer)
├── screens/
│   └── dashboard_screen.dart     # Responsive scaffold (sidebar / content / right rail)
└── widgets/
    ├── side_menu.dart            # Left nav: logo, profile, menu, workspaces
    ├── top_bar.dart              # Search, action icons, avatar
    ├── content_area.dart         # Scrollable center column
    ├── hero_banner.dart          # "Top Rating Project" gradient banner
    ├── all_projects_card.dart    # Editable project list
    ├── top_creators_card.dart    # Creators with rating bars
    ├── performance_chart.dart    # fl_chart line chart
    ├── right_panel.dart          # Right rail container
    ├── calendar_card.dart        # Interactive month calendar
    ├── event_card.dart           # Reusable Birthday / Anniversary card
    ├── placeholder_page.dart     # Section view for non-Home nav items
    └── initials_avatar.dart      # Offline-safe avatar (initials)
```

---

## Responsiveness

| Breakpoint            | Layout                                                      |
|-----------------------|-------------------------------------------------------------|
| Desktop (>= 1180px)   | Fixed sidebar + content + fixed right rail (matches design) |
| Tablet (720-1180px)   | Sidebar in a drawer; content + right rail                   |
| Mobile (< 720px)      | Single column; right-rail cards flow below; drawer menu     |

---

## Author

Submitted as part of the Adstacks Media Flutter Developer test.
-- BY Shivam Kushwah
