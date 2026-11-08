import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../core/services/storage_service.dart';
import '../../core/theme/app_theme.dart';
import '../../shared/models/emotion_entry.dart';

class EmotionReportScreen extends StatefulWidget {
  const EmotionReportScreen({super.key});

  @override
  State<EmotionReportScreen> createState() => _EmotionReportScreenState();
}

class _EmotionReportScreenState extends State<EmotionReportScreen> {
  List<EmotionEntry> _entries = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  void _load() {
    final list = StorageService().getEmotions(limit: 100);
    setState(() {
      _entries = list;
      _loading = false;
    });
  }

  Map<String, int> get _counts {
    final map = <String, int>{};
    for (final e in _entries) {
      map[e.emotionLabel] = (map[e.emotionLabel] ?? 0) + 1;
    }
    return map;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: const Text('Nhật ký cảm xúc'),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _entries.isEmpty
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('💛', style: TextStyle(fontSize: 48)),
                        const SizedBox(height: 16),
                        Text(
                          'Chưa có dữ liệu cảm xúc',
                          style: Theme.of(context).textTheme.titleLarge,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Khi trẻ ghi nhận cảm xúc trong app, dữ liệu sẽ hiện ở đây.',
                          style: Theme.of(context).textTheme.bodyMedium,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                )
              : ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    // Tổng quan
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
                        border: Border.all(color: AppTheme.surfaceVariant),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tổng quan (${_entries.length} lần ghi nhận)',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 16),
                          ..._counts.entries.map(
                            (e) => Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Row(
                                children: [
                                  Expanded(child: Text(e.key)),
                                  Text(
                                    '${e.value}',
                                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                          color: AppTheme.primary,
                                          fontWeight: FontWeight.w700,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text('Chi tiết gần đây', style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 12),
                    ..._entries.map((entry) {
                      final time = DateFormat('dd/MM HH:mm').format(entry.createdAt);
                      return Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
                          border: Border.all(color: AppTheme.surfaceVariant),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    entry.emotionLabel,
                                    style: Theme.of(context).textTheme.titleMedium,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Mức độ: ${entry.intensity}/5  •  $time',
                                    style: Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
    );
  }
}
