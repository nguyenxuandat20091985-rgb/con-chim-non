import 'package:flutter/material.dart';

import '../../core/services/schedule_storage.dart';
import '../../core/theme/app_theme.dart';
import '../../shared/models/schedule_item.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  List<ScheduleItem> _items = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    await ScheduleStorage().init();
    final saved = ScheduleStorage().loadItems();

    if (saved.isNotEmpty) {
      setState(() {
        _items = saved;
        _loading = false;
      });
    } else {
      final defaults = [
        const ScheduleItem(id: '1', title: 'Thức dậy & vệ sinh cá nhân', emoji: '🌅', order: 0),
        const ScheduleItem(id: '2', title: 'Ăn sáng', emoji: '🍳', order: 1),
        const ScheduleItem(id: '3', title: 'Đến trường / Học online', emoji: '📚', order: 2),
        const ScheduleItem(id: '4', title: 'Giờ ra chơi / Nghỉ giữa giờ', emoji: '⚽', order: 3),
        const ScheduleItem(id: '5', title: 'Ăn trưa', emoji: '🍱', order: 4),
        const ScheduleItem(id: '6', title: 'Làm bài tập', emoji: '✏️', order: 5),
        const ScheduleItem(id: '7', title: 'Thời gian tự do', emoji: '🎮', order: 6),
        const ScheduleItem(id: '8', title: 'Ăn tối & chuẩn bị đi ngủ', emoji: '🌙', order: 7),
      ];
      await ScheduleStorage().saveItems(defaults);
      setState(() {
        _items = defaults;
        _loading = false;
      });
    }
  }

  Future<void> _toggleDone(String id) async {
    final index = _items.indexWhere((e) => e.id == id);
    if (index == -1) return;

    final item = _items[index];
    final updated = item.copyWith(
      isDone: !item.isDone,
      completedAt: !item.isDone ? DateTime.now() : null,
    );

    setState(() {
      _items = List.from(_items)..[index] = updated;
    });

    await ScheduleStorage().saveItems(_items);
  }

  @override
  Widget build(BuildContext context) {
    final completed = _items.where((e) => e.isDone).length;
    final total = _items.length;

    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: const Text('Lịch trình hôm nay'),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
                    border: Border.all(color: AppTheme.surfaceVariant),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Tiến độ hôm nay', style: Theme.of(context).textTheme.titleMedium),
                          Text(
                            '$completed/$total',
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: AppTheme.primary,
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: LinearProgressIndicator(
                          value: total == 0 ? 0 : completed / total,
                          minHeight: 10,
                          backgroundColor: AppTheme.surfaceVariant,
                          valueColor: const AlwaysStoppedAnimation(AppTheme.secondary),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                    itemCount: _items.length,
                    itemBuilder: (context, index) {
                      final item = _items[index];
                      return _ScheduleTile(
                        item: item,
                        onToggle: () => _toggleDone(item.id),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}

class _ScheduleTile extends StatelessWidget {
  final ScheduleItem item;
  final VoidCallback onToggle;

  const _ScheduleTile({required this.item, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
        child: InkWell(
          onTap: onToggle,
          borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                Text(item.emoji, style: const TextStyle(fontSize: 28)),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    item.title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          decoration: item.isDone ? TextDecoration.lineThrough : null,
                          color: item.isDone ? AppTheme.textHint : AppTheme.textPrimary,
                        ),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: item.isDone ? AppTheme.secondary : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: item.isDone ? AppTheme.secondary : AppTheme.textHint,
                      width: 2,
                    ),
                  ),
                  child: item.isDone
                      ? const Icon(Icons.check_rounded, size: 18, color: Colors.white)
                      : null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
