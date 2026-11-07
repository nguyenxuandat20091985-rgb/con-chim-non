import 'package:flutter/material.dart';

import '../../core/theme/app_theme.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  final List<_ScheduleItem> _items = [
    _ScheduleItem(id: '1', title: 'Thức dậy & vệ sinh cá nhân', emoji: '🌅', isDone: true),
    _ScheduleItem(id: '2', title: 'Ăn sáng', emoji: '🍳', isDone: true),
    _ScheduleItem(id: '3', title: 'Đến trường / Học online', emoji: '📚', isDone: false),
    _ScheduleItem(id: '4', title: 'Giờ ra chơi / Nghỉ giữa giờ', emoji: '⚽', isDone: false),
    _ScheduleItem(id: '5', title: 'Ăn trưa', emoji: '🍱', isDone: false),
    _ScheduleItem(id: '6', title: 'Làm bài tập', emoji: '✏️', isDone: false),
    _ScheduleItem(id: '7', title: 'Thời gian tự do', emoji: '🎮', isDone: false),
    _ScheduleItem(id: '8', title: 'Ăn tối & chuẩn bị đi ngủ', emoji: '🌙', isDone: false),
  ];

  void _toggleDone(String id) {
    setState(() {
      final index = _items.indexWhere((e) => e.id == id);
      if (index != -1) {
        _items[index] = _items[index].copyWith(isDone: !_items[index].isDone);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final completed = _items.where((e) => e.isDone).length;
    final total = _items.length;

    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: const Text('Lịch trình hôm nay'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add_rounded),
            tooltip: 'Thêm hoạt động',
          ),
        ],
      ),
      body: Column(
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
                    Text(
                      'Tiến độ hôm nay',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
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

class _ScheduleItem {
  final String id;
  final String title;
  final String emoji;
  final bool isDone;

  const _ScheduleItem({
    required this.id,
    required this.title,
    required this.emoji,
    required this.isDone,
  });

  _ScheduleItem copyWith({bool? isDone}) {
    return _ScheduleItem(
      id: id,
      title: title,
      emoji: emoji,
      isDone: isDone ?? this.isDone,
    );
  }
}

class _ScheduleTile extends StatelessWidget {
  final _ScheduleItem item;
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
