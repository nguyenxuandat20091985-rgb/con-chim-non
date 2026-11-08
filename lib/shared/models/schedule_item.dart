class ScheduleItem {
  final String id;
  final String title;
  final String emoji;
  final bool isDone;
  final int order;
  final DateTime? completedAt;

  const ScheduleItem({
    required this.id,
    required this.title,
    required this.emoji,
    this.isDone = false,
    required this.order,
    this.completedAt,
  });

  ScheduleItem copyWith({
    String? title,
    String? emoji,
    bool? isDone,
    int? order,
    DateTime? completedAt,
  }) {
    return ScheduleItem(
      id: id,
      title: title ?? this.title,
      emoji: emoji ?? this.emoji,
      isDone: isDone ?? this.isDone,
      order: order ?? this.order,
      completedAt: completedAt ?? this.completedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'emoji': emoji,
      'isDone': isDone,
      'order': order,
      'completedAt': completedAt?.toIso8601String(),
    };
  }

  factory ScheduleItem.fromMap(Map<String, dynamic> map) {
    return ScheduleItem(
      id: map['id'] as String,
      title: map['title'] as String,
      emoji: map['emoji'] as String,
      isDone: map['isDone'] as bool? ?? false,
      order: map['order'] as int,
      completedAt: map['completedAt'] != null
          ? DateTime.parse(map['completedAt'] as String)
          : null,
    );
  }
}
