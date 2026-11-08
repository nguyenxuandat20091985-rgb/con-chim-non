import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/app_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header với avatar chim non
              Row(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: AppTheme.primary.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Center(
                      child: Text('🐣', style: TextStyle(fontSize: 32)),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Xin chào!', style: Theme.of(context).textTheme.bodyMedium),
                        Text('Con Chim Non', style: Theme.of(context).textTheme.headlineMedium),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () => context.push('/parent'),
                    icon: const Icon(Icons.settings_rounded),
                    color: AppTheme.textSecondary,
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Câu chào
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppTheme.primary.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
                ),
                child: Text(
                  'Hôm nay bạn muốn làm gì nào?',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: AppTheme.primaryDark,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 28),

              Text('Các chức năng', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 16),

              // Grid chức năng
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 1.05,
                children: [
                  _FeatureCard(
                    emoji: '💬',
                    title: 'Giao tiếp',
                    subtitle: 'Nói bằng hình ảnh',
                    color: const Color(0xFF5B8DEF),
                    onTap: () => context.go('/communication'),
                  ),
                  _FeatureCard(
                    emoji: '💛',
                    title: 'Cảm xúc',
                    subtitle: 'Tôi đang cảm thấy…',
                    color: const Color(0xFFFFB74D),
                    onTap: () => context.go('/emotion'),
                  ),
                  _FeatureCard(
                    emoji: '📅',
                    title: 'Lịch trình',
                    subtitle: 'Hôm nay làm gì?',
                    color: const Color(0xFF7BC67E),
                    onTap: () => context.go('/schedule'),
                  ),
                  _FeatureCard(
                    emoji: '🤝',
                    title: 'Kỹ năng xã hội',
                    subtitle: 'Học cách ứng xử',
                    color: const Color(0xFFAB47BC),
                    onTap: () => context.go('/social'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final String emoji;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;

  const _FeatureCard({
    required this.emoji,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
            border: Border.all(color: AppTheme.surfaceVariant),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Center(child: Text(emoji, style: const TextStyle(fontSize: 24))),
              ),
              const Spacer(),
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const SizedBox(height: 4),
              Text(subtitle, style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
        ),
      ),
    );
  }
}
