class EmotionEntry {
  final String id;
  final String emotionId;
  final String emotionLabel;
  final int intensity; // 1-5
  final DateTime createdAt;
  final String? note;

  const EmotionEntry({
    required this.id,
    required this.emotionId,
    required this.emotionLabel,
    required this.intensity,
    required this.createdAt,
    this.note,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'emotionId': emotionId,
      'emotionLabel': emotionLabel,
      'intensity': intensity,
      'createdAt': createdAt.toIso8601String(),
      'note': note,
    };
  }

  factory EmotionEntry.fromMap(Map<String, dynamic> map) {
    return EmotionEntry(
      id: map['id'] as String,
      emotionId: map['emotionId'] as String,
      emotionLabel: map['emotionLabel'] as String,
      intensity: map['intensity'] as int,
      createdAt: DateTime.parse(map['createdAt'] as String),
      note: map['note'] as String?,
    );
  }
}
