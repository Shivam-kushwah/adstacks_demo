import 'package:flutter/material.dart';
import '../data/dashboard_data.dart';
import '../theme/app_colors.dart';

class AllProjectsCard extends StatefulWidget {
  const AllProjectsCard({super.key});

  @override
  State<AllProjectsCard> createState() => _AllProjectsCardState();
}

class _AllProjectsCardState extends State<AllProjectsCard> {
  late final List<ProjectItem> _projects = List.of(DashboardData.projects);

  Future<void> _editProject(int index) async {
    final item = _projects[index];
    final titleCtrl = TextEditingController(text: item.title);
    final subtitleCtrl = TextEditingController(text: item.subtitle);

    final saved = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('Edit Project'),
        content: SizedBox(
          width: 340,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleCtrl,
                autofocus: true,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 14),
              TextField(
                controller: subtitleCtrl,
                decoration: const InputDecoration(
                  labelText: 'Subtitle',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.purple,
              foregroundColor: Colors.white,
            ),
            child: const Text('Save'),
          ),
        ],
      ),
    );

    if (saved == true) {
      final newTitle = titleCtrl.text.trim();
      final newSubtitle = subtitleCtrl.text.trim();
      setState(() {
        _projects[index] = ProjectItem(
          newTitle.isEmpty ? item.title : newTitle,
          newSubtitle.isEmpty ? item.subtitle : newSubtitle,
          highlighted: item.highlighted,
        );
      });
    }

    titleCtrl.dispose();
    subtitleCtrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.darkCard,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'All Projects',
            style: TextStyle(
              color: AppColors.onDark,
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 16),
          ...List.generate(
            _projects.length,
                (i) => _ProjectTile(
              item: _projects[i],
              onEdit: () => _editProject(i),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProjectTile extends StatelessWidget {
  final ProjectItem item;
  final VoidCallback onEdit;
  const _ProjectTile({required this.item, required this.onEdit});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        gradient: item.highlighted
            ? const LinearGradient(
          colors: [AppColors.coralStart, AppColors.coralEnd],
        )
            : null,
        color: item.highlighted ? null : const Color(0xFF262953),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onEdit,
          hoverColor: Colors.white.withValues(alpha: 0.06),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: const TextStyle(
                          color: AppColors.onDark,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item.subtitle,
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.7),
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),

                Material(
                  color: Colors.white.withValues(alpha: item.highlighted ? 0.25 : 0.12),
                  borderRadius: BorderRadius.circular(8),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: onEdit,
                    hoverColor: Colors.white.withValues(alpha: 0.15),
                    child: const SizedBox(
                      width: 30,
                      height: 30,
                      child: Icon(Icons.edit_outlined, size: 15, color: Colors.white),
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