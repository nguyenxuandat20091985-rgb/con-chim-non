import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

import '../../core/theme/app_theme.dart';

class CommunicationScreen extends StatefulWidget {
  const CommunicationScreen({super.key});

  @override
  State<CommunicationScreen> createState() => _CommunicationScreenState();
}

class _CommunicationScreenState extends State<CommunicationScreen> {
  final FlutterTts _tts = FlutterTts();
  final List<_CardItem> _sentence = [];

  // Bộ thẻ mẫu dành cho trẻ lớn hơn (không quá đơn giản)
  final List<_CardItem> _availableCards = [
    _CardItem(id: '1', label: 'Tôi muốn', emoji: '🙋', category: 'subject'),
    _CardItem(id: '2', label: 'Tôi cần', emoji: '🙏', category: 'subject'),
    _CardItem(id: '3', label: 'Tôi cảm thấy', emoji: '💭', category: 'subject'),
    _CardItem(id: '4', label: 'ăn', emoji: '🍚', category: 'action'),
    _CardItem(id: '5', label: 'uống', emoji: '🥤', category: 'action'),
    _CardItem(id: '6', label: 'nghỉ ngơi', emoji: '😌', category: 'action'),
    _CardItem(id: '7', label: 'đi vệ sinh', emoji: '🚽', category: 'action'),
    _CardItem(id: '8', label: 'nói chuyện', emoji: '🗣️', category: 'action'),
    _CardItem(id: '9', label: 'chơi game', emoji: '🎮', category: 'action'),
    _CardItem(id: '10', label: 'đọc sách', emoji: '📖', category: 'action'),
    _CardItem(id: '11', label: 'nghe nhạc', emoji: '🎧', category: 'action'),
    _CardItem(id: '12', label: 'ra ngoài', emoji: '🚪', category: 'action'),
    _CardItem(id: '13', label: 'nước', emoji: '💧', category: 'object'),
    _CardItem(id: '14', label: 'thức ăn', emoji: '🍱', category: 'object'),
    _CardItem(id: '15', label: 'giúp đỡ', emoji: '🤝', category: 'object'),
    _CardItem(id: '16', label: 'yên tĩnh', emoji: '🤫', category: 'object'),
    _CardItem(id: '17', label: 'bây giờ', emoji: '⏰', category: 'time'),
    _CardItem(id: '18', label: 'sau một chút', emoji: '⏳', category: 'time'),
    _CardItem(id: '19', label: 'vui', emoji: '😊', category: 'emotion'),
    _CardItem(id: '20', label: 'buồn', emoji: '😢', category: 'emotion'),
    _CardItem(id: '21', label: 'mệt', emoji: '😩', category: 'emotion'),
    _CardItem(id: '22', label: 'lo lắng', emoji: '😰', category: 'emotion'),
    _CardItem(id: '23', label: 'giận', emoji: '😠', category: 'emotion'),
  ];

  @override
  void initState() {
    super.initState();
    _initTts();
  }

  Future<void> _initTts() async {
    await _tts.setLanguage('vi-VN');
    await _tts.setSpeechRate(0.45); // Chậm vừa phải, dễ nghe
    await _tts.setVolume(1.0);
    await _tts.setPitch(1.0);
  }

  void _addToSentence(_CardItem card) {
    setState(() {
      _sentence.add(card);
    });
  }

  void _removeLast() {
    if (_sentence.isNotEmpty) {
      setState(() {
        _sentence.removeLast();
      });
    }
  }

  void _clearSentence() {
    setState(() {
      _sentence.clear();
    });
  }

  Future<void> _speak() async {
    if (_sentence.isEmpty) return;
    final text = _sentence.map((e) => e.label).join(' ');
    await _tts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: const Text('Giao tiếp'),
        actions: [
          IconButton(
            onPressed: _clearSentence,
            icon: const Icon(Icons.delete_outline_rounded),
            tooltip: 'Xóa câu',
          ),
        ],
      ),
      body: Column(
        children: [
          // Khu vực câu đang ghép
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            constraints: const BoxConstraints(minHeight: 100),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
              border: Border.all(color: AppTheme.primary.withOpacity(0.3), width: 2),
            ),
            child: _sentence.isEmpty
                ? Center(
                    child: Text(
                      'Chạm vào thẻ bên dưới để tạo câu',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppTheme.textHint,
                          ),
                    ),
                  )
                : Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: _sentence
                        .map((card) => Chip(
                              avatar: Text(card.emoji),
                              label: Text(card.label),
                              backgroundColor: AppTheme.primary.withOpacity(0.1),
                            ))
                        .toList(),
                  ),
          ),

          // Nút nói & xóa
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _sentence.isEmpty ? null : _speak,
                    icon: const Icon(Icons.volume_up_rounded),
                    label: const Text('Nói'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primary,
                      minimumSize: const Size.fromHeight(52),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                IconButton.filled(
                  onPressed: _sentence.isEmpty ? null : _removeLast,
                  icon: const Icon(Icons.backspace_outlined),
                  style: IconButton.styleFrom(
                    backgroundColor: AppTheme.surfaceVariant,
                    foregroundColor: AppTheme.textSecondary,
                    minimumSize: const Size(52, 52),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Danh sách thẻ
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.95,
              ),
              itemCount: _availableCards.length,
              itemBuilder: (context, index) {
                final card = _availableCards[index];
                return _CardTile(
                  card: card,
                  onTap: () => _addToSentence(card),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tts.stop();
    super.dispose();
  }
}

class _CardItem {
  final String id;
  final String label;
  final String emoji;
  final String category;

  const _CardItem({
    required this.id,
    required this.label,
    required this.emoji,
    required this.category,
  });
}

class _CardTile extends StatelessWidget {
  final _CardItem card;
  final VoidCallback onTap;

  const _CardTile({required this.card, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
            border: Border.all(color: AppTheme.surfaceVariant),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(card.emoji, style: const TextStyle(fontSize: 32)),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Text(
                  card.label,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontSize: 13,
                      ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
