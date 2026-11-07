import 'package:flutter/material.dart';

import '../../core/theme/app_theme.dart';

class SocialScreen extends StatelessWidget {
  const SocialScreen({super.key});

  final List<_SocialScenario> _scenarios = const [
    _SocialScenario(
      id: '1',
      title: 'Cách xin lỗi',
      emoji: '🙏',
      description: 'Khi bạn làm ai đó buồn hoặc sai sót',
    ),
    _SocialScenario(
      id: '2',
      title: 'Cách cảm ơn',
      emoji: '😊',
      description: 'Khi ai đó giúp đỡ hoặc cho bạn thứ gì',
    ),
    _SocialScenario(
      id: '3',
      title: 'Từ chối lịch sự',
      emoji: '🙅',
      description: 'Khi bạn không muốn làm điều gì đó',
    ),
    _SocialScenario(
      id: '4',
      title: 'Bắt đầu trò chuyện',
      emoji: '💬',
      description: 'Cách mở lời với bạn bè hoặc người mới',
    ),
    _SocialScenario(
      id: '5',
      title: 'Khi bị hiểu lầm',
      emoji: '🤔',
      description: 'Cách giải thích khi người khác hiểu sai',
    ),
    _SocialScenario(
      id: '6',
      title: 'Xin giúp đỡ',
      emoji: '🙋',
      description: 'Khi bạn cần sự hỗ trợ từ người khác',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: const Text('Kỹ năng xã hội'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppTheme.primary.withOpacity(0.08),
              borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
            ),
            child: Text(
              'Chọn một tình huống để luyện tập. Mỗi tình huống đều có gợi ý từng bước.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          const SizedBox(height: 20),
          ..._scenarios.map((scenario) => _ScenarioCard(scenario: scenario)),
        ],
      ),
    );
  }
}

class _SocialScenario {
  final String id;
  final String title;
  final String emoji;
  final String description;

  const _SocialScenario({
    required this.id,
    required this.title,
    required this.emoji,
    required this.description,
  });
}

class _ScenarioCard extends StatelessWidget {
  final _SocialScenario scenario;

  const _ScenarioCard({required this.scenario});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
        child: InkWell(
          onTap: () {
            // TODO: Mở chi tiết social story
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Sắp mở: ${scenario.title}')),
            );
          },
          borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: AppTheme.primary.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Center(
                    child: Text(scenario.emoji, style: const TextStyle(fontSize: 26)),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        scenario.title,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        scenario.description,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.chevron_right_rounded, color: AppTheme.textHint),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
