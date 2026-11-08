import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/services/storage_service.dart';
import '../../core/theme/app_theme.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _index = 0;

  final List<_OnboardPage> _pages = const [
    _OnboardPage(
      emoji: '🐣',
      title: 'Chào mừng đến với Con Chim Non',
      body: 'Ứng dụng đồng hành cùng bạn mỗi ngày: giao tiếp, cảm xúc, lịch trình và kỹ năng xã hội.',
    ),
    _OnboardPage(
      emoji: '💬',
      title: 'Nói bằng hình ảnh',
      body: 'Ghép các thẻ hình ảnh để tạo câu. Nhấn nút Nói để app đọc to giúp bạn.',
    ),
    _OnboardPage(
      emoji: '💛',
      title: 'Cảm xúc & Tổ Ấm',
      body: 'Khi mệt hoặc lo lắng, hãy chọn cảm xúc của mình. Bạn luôn có thể vào Tổ Ấm để thở và nghỉ ngơi.',
    ),
    _OnboardPage(
      emoji: '📅',
      title: 'Lịch trình rõ ràng',
      body: 'Xem những việc cần làm trong ngày và đánh dấu khi hoàn thành. Mọi thứ đều theo nhịp của bạn.',
    ),
  ];

  Future<void> _finish() async {
    await StorageService().setSetting('onboarding_done', true);
    if (!mounted) return;
    context.go('/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: _finish,
                child: const Text('Bỏ qua'),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: _pages.length,
                onPageChanged: (i) => setState(() => _index = i),
                itemBuilder: (context, i) {
                  final page = _pages[i];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            color: AppTheme.primary.withOpacity(0.12),
                            borderRadius: BorderRadius.circular(32),
                          ),
                          child: Center(
                            child: Text(page.emoji, style: const TextStyle(fontSize: 56)),
                          ),
                        ),
                        const SizedBox(height: 36),
                        Text(
                          page.title,
                          style: Theme.of(context).textTheme.headlineMedium,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          page.body,
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: AppTheme.textSecondary,
                                height: 1.5,
                              ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Dots
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_pages.length, (i) {
                final active = i == _index;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: active ? 20 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: active ? AppTheme.primary : AppTheme.surfaceVariant,
                    borderRadius: BorderRadius.circular(4),
                  ),
                );
              }),
            ),
            const SizedBox(height: 28),

            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_index < _pages.length - 1) {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOut,
                      );
                    } else {
                      _finish();
                    }
                  },
                  child: Text(_index < _pages.length - 1 ? 'Tiếp tục' : 'Bắt đầu'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OnboardPage {
  final String emoji;
  final String title;
  final String body;

  const _OnboardPage({
    required this.emoji,
    required this.title,
    required this.body,
  });
}
