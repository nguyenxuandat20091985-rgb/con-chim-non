import 'package:flutter/material.dart';

import '../../core/theme/app_theme.dart';
import '../../shared/models/social_story.dart';

class SocialDetailScreen extends StatefulWidget {
  final SocialStory story;

  const SocialDetailScreen({super.key, required this.story});

  @override
  State<SocialDetailScreen> createState() => _SocialDetailScreenState();
}

class _SocialDetailScreenState extends State<SocialDetailScreen> {
  int _currentStep = 0;

  void _next() {
    if (_currentStep < widget.story.steps.length - 1) {
      setState(() => _currentStep++);
    }
  }

  void _previous() {
    if (_currentStep > 0) {
      setState(() => _currentStep--);
    }
  }

  @override
  Widget build(BuildContext context) {
    final story = widget.story;
    final step = story.steps[_currentStep];
    final isLast = _currentStep == story.steps.length - 1;

    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: Text(story.title),
      ),
      body: Column(
        children: [
          // Progress
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
            child: Row(
              children: List.generate(story.steps.length, (index) {
                final isActive = index <= _currentStep;
                return Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    height: 6,
                    decoration: BoxDecoration(
                      color: isActive ? AppTheme.primary : AppTheme.surfaceVariant,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                );
              }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Bước ${_currentStep + 1}/${story.steps.length}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  // Emoji lớn
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: AppTheme.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Center(
                      child: Text(
                        step.emoji ?? story.emoji,
                        style: const TextStyle(fontSize: 48),
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),

                  // Nội dung bước
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
                      border: Border.all(color: AppTheme.surfaceVariant),
                    ),
                    child: Text(
                      step.text,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            height: 1.5,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  if (step.tip != null) ...[
                    const SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppTheme.accent.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.lightbulb_outline_rounded, color: AppTheme.accent, size: 22),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              step.tip!,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],

                  // Câu mẫu hữu ích
                  if (isLast && story.keyPhrases.isNotEmpty) ...[
                    const SizedBox(height: 28),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Câu bạn có thể dùng:',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ...story.keyPhrases.map(
                      (phrase) => Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(bottom: 8),
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                        decoration: BoxDecoration(
                          color: AppTheme.primary.withOpacity(0.08),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          '"$phrase"',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppTheme.primaryDark,
                              ),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),

          // Nút điều hướng
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
              child: Row(
                children: [
                  if (_currentStep > 0)
                    Expanded(
                      child: OutlinedButton(
                        onPressed: _previous,
                        child: const Text('Quay lại'),
                      ),
                    ),
                  if (_currentStep > 0) const SizedBox(width: 12),
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                      onPressed: isLast
                          ? () => Navigator.of(context).pop()
                          : _next,
                      child: Text(isLast ? 'Hoàn thành' : 'Tiếp tục'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
