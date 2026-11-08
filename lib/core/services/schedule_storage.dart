import 'package:hive_flutter/hive_flutter.dart';

import '../constants/app_constants.dart';
import '../../shared/models/schedule_item.dart';

class ScheduleStorage {
  static final ScheduleStorage _instance = ScheduleStorage._();
  factory ScheduleStorage() => _instance;
  ScheduleStorage._();

  Box? _box;

  Future<void> init() async {
    _box ??= await Hive.openBox(AppConstants.keySchedule);
  }

  Future<void> saveItems(List<ScheduleItem> items) async {
    await init();
    final maps = items.map((e) => e.toMap()).toList();
    await _box?.put('today_items', maps);
    await _box?.put('updated_at', DateTime.now().toIso8601String());
  }

  List<ScheduleItem> loadItems() {
    final raw = _box?.get('today_items');
    if (raw == null || raw is! List) return [];

    return raw
        .map((e) => ScheduleItem.fromMap(Map<String, dynamic>.from(e as Map)))
        .toList()
      ..sort((a, b) => a.order.compareTo(b.order));
  }

  bool get hasData => _box?.get('today_items') != null;
}
