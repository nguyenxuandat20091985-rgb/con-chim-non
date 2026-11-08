import 'package:flutter/material.dart';

import '../../core/theme/app_theme.dart';

class EmotionScreen extends StatefulWidget {
  const EmotionScreen({super.key});

  @override
  State<EmotionScreen> createState() => _EmotionScreenState();
}

class _EmotionScreenState extends State<EmotionScreen> {
  String? _selectedEmotion;
  int _intensity = 3;

  final List<_Emotion> _emotions = [
    _Emotion(id: 'happy', label: 'Vui', emoji: '😊', color: Color(0xFFFFB74D)),
    _Emotion(id: 'calm', label: 'Bình yên', emoji: '😌', color: Color(0xFF81D4FA)),
    _Emotion(id: 'sad', label: 'Buồn', emoji: '😢', color: Color(0xFF64B5F6)),
    _Emotion(id: 'angry', label: 'Giận', emoji: '😠', color: Color(0xFFE57373)),
    _Emotion(id: 'anxious', label: 'Lo lắng', emoji: '😰', color: Color(0xFFBA68C8)),
    _Emotion(id: 'tired', label: 'Mệt', emoji: '😩', color: Color(0xFF90A4AE)),
    _Emotion(id: 'excited', label: 'Hào hứng', emoji: '🤩', color: Color(0xFFFF8A65)),
    _Emotion(id: 'confused', label: 'Bối rối', emoji: '😕', color: Color(0xFFA1887F)),
  ];

  final Map<String, List<String>> _strategies = {
    'happy': ['Chia sẻ niềm vui với người thân', 'Ghi lại điều khiến bạn vui', 'Tiếp tục làm điều mình thích'],
    'calm': ['Giữ sự yên tĩnh này', 'Hít thở sâu vài lần', 'Thưởng thức khoảnh khắc'],
    'sad': ['Nói với người tin tưởng', 'Nghe nhạc nhẹ', 'Viết ra cảm xúc', 'Ôm gối hoặc thú bông'],
    'angry': ['Rời khỏi tình huống nếu có thể', 'Đếm từ 1 đến 10', 'Hít thở sâu', 'Vẽ hoặc viết ra giấy'],
    'anxious': ['Vào "Tổ Ấm"', 'Hít thở 4-7-8', 'Nhìn vào vật quen thuộc', 'Nhắc nhở bản thân: "Mình an toàn"'],
    'tired': ['Nghỉ ngơi một chút', 'Uống nước', 'Giảm ánh sáng', 'Nằm xuống 10 phút'],
    'excited': ['Chia sẻ niềm vui', 'Ghi lại khoảnh khắc', 'Thở đều để giữ bình tĩnh'],
    'confused': ['Hỏi người lớn để làm rõ', 'Viết ra những gì đang thắc mắc', 'Tạm dừng và quan sát'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: const Text('Cảm xúc của tôi'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hôm nay bạn đang cảm thấy thế nào?',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.85,
              ),
              itemCount: _emotions.length,
              itemBuilder: (context, index) {
                final emotion = _emotions[index];
                final isSelected = _selectedEmotion == emotion.id;
                return GestureDetector(
                  onTap: () => setState(() => _selectedEmotion = emotion.id),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    decoration: BoxDecoration(
                      color: isSelected ? emotion.color.withOpacity(0.2) : Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: isSelected ? emotion.color : AppTheme.surfaceVariant,
                        width: isSelected ? 2.5 : 1,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(emotion.emoji, style: const TextStyle(fontSize: 28)),
                        const SizedBox(height: 6),
                        Text(
                          emotion.label,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                            color: AppTheme.textPrimary,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

            if (_selectedEmotion != null) ...[
              const SizedBox(height: 28),
              Text('Mức độ cảm xúc', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 12),
              Row(
                children: List.generate(5, (index) {
                  final level = index + 1;
                  final isActive = level <= _intensity;
                  return Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => _intensity = level),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        height: 12,
                        decoration: BoxDecoration(
                          color: isActive
                              ? _emotions.firstWhere((e) => e.id == _selectedEmotion).color
                              : AppTheme.surfaceVariant,
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Nhẹ', style: Theme.of(context).textTheme.bodyMedium),
                  Text('Mạnh', style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),

              const SizedBox(height: 28),
              Text('Gợi ý giúp bạn', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 12),
              ...(_strategies[_selectedEmotion] ?? []).map(
                (tip) => Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: AppTheme.surfaceVariant),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.lightbulb_outline_rounded, color: AppTheme.accent, size: 22),
                      const SizedBox(width: 12),
                      Expanded(child: Text(tip)),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Đã ghi nhận cảm xúc của bạn')),
                    );
                  },
                  icon: const Icon(Icons.check_rounded),
                  label: const Text('Ghi nhận cảm xúc'),
                ),
              ),

              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.spa_rounded),
                  label: const Text('Vào Tổ Ấm (Không gian yên tĩnh)'),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _Emotion {
  final String id;
  final String label;
  final String emoji;
  final Color color;

  const _Emotion({
    required this.id,
    required this.label,
    required this.emoji,
    required this.color,
  });
}
