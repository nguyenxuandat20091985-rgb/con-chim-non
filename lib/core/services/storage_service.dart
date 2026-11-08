import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../constants/app_constants.dart';
import '../../shared/models/emotion_entry.dart';

/// Service lưu trữ cục bộ.
/// Hiện dùng Hive. Có thể mở rộng thêm sau.
class StorageService {
  static final StorageService _instance = StorageService._();
  factory StorageService() => _instance;
  StorageService._();

  Box? _settingsBox;
  Box? _emotionsBox;

  Future<void> init() async {
    try {
      _settingsBox = await Hive.openBox(AppConstants.keySettings);
      _emotionsBox = await Hive.openBox(AppConstants.keyEmotions);
    } catch (e) {
      debugPrint('StorageService init error: $e');
    }
  }

  // ---------- Settings ----------
  T? getSetting<T>(String key, {T? defaultValue}) {
    return _settingsBox?.get(key, defaultValue: defaultValue) as T?;
  }

  Future<void> setSetting(String key, dynamic value) async {
    await _settingsBox?.put(key, value);
  }

  // ---------- Emotions ----------
  Future<void> saveEmotion(EmotionEntry entry) async {
    await _emotionsBox?.put(entry.id, entry.toMap());
  }

  List<EmotionEntry> getEmotions({int limit = 50}) {
    final box = _emotionsBox;
    if (box == null) return [];

    final list = box.values
        .map((e) => EmotionEntry.fromMap(Map<String, dynamic>.from(e as Map)))
        .toList()
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));

    return list.take(limit).toList();
  }

  Future<void> clearEmotions() async {
    await _emotionsBox?.clear();
  }
}
