import 'package:flutter/material.dart';

import '../../core/theme/app_theme.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  double _fontScale = 1.0;
  bool _reduceMotion = false;
  bool _highContrast = false;
  bool _soundEnabled = true;
  double _ttsSpeed = 0.45;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: const Text('Cài đặt'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _SectionHeader(title: 'Trợ năng'),
          _SettingsCard(
            children: [
              _SliderTile(
                title: 'Cỡ chữ',
                value: _fontScale,
                min: 0.85,
                max: 1.4,
                divisions: 11,
                label: '${(_fontScale * 100).round()}%',
                onChanged: (v) => setState(() => _fontScale = v),
              ),
              const Divider(height: 1),
              SwitchListTile(
                title: const Text('Giảm chuyển động'),
                subtitle: const Text('Tắt animation để giảm kích thích'),
                value: _reduceMotion,
                onChanged: (v) => setState(() => _reduceMotion = v),
                activeColor: AppTheme.primary,
              ),
              const Divider(height: 1),
              SwitchListTile(
                title: const Text('Độ tương phản cao'),
                subtitle: const Text('Làm chữ và nút rõ hơn'),
                value: _highContrast,
                onChanged: (v) => setState(() => _highContrast = v),
                activeColor: AppTheme.primary,
              ),
            ],
          ),

          const SizedBox(height: 20),
          _SectionHeader(title: 'Âm thanh'),
          _SettingsCard(
            children: [
              SwitchListTile(
                title: const Text('Bật âm thanh'),
                subtitle: const Text('Giọng đọc và tiếng phản hồi'),
                value: _soundEnabled,
                onChanged: (v) => setState(() => _soundEnabled = v),
                activeColor: AppTheme.primary,
              ),
              if (_soundEnabled) ...[
                const Divider(height: 1),
                _SliderTile(
                  title: 'Tốc độ giọng đọc',
                  value: _ttsSpeed,
                  min: 0.25,
                  max: 0.7,
                  divisions: 9,
                  label: _ttsSpeed <= 0.35
                      ? 'Chậm'
                      : _ttsSpeed >= 0.55
                          ? 'Nhanh'
                          : 'Vừa',
                  onChanged: (v) => setState(() => _ttsSpeed = v),
                ),
              ],
            ],
          ),

          const SizedBox(height: 20),
          _SectionHeader(title: 'Thông tin'),
          _SettingsCard(
            children: [
              ListTile(
                title: const Text('Phiên bản'),
                trailing: Text(
                  '1.0.0',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              const Divider(height: 1),
              ListTile(
                title: const Text('Con Chim Non'),
                subtitle: const Text('Ứng dụng hỗ trợ trẻ tự kỷ từ lớp 5 trở lên'),
                onTap: () {},
              ),
            ],
          ),

          const SizedBox(height: 24),
          Text(
            'Các tùy chọn này giúp app phù hợp hơn với nhu cầu cảm giác của từng trẻ.',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: AppTheme.textSecondary,
            ),
      ),
    );
  }
}

class _SettingsCard extends StatelessWidget {
  final List<Widget> children;
  const _SettingsCard({required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
        border: Border.all(color: AppTheme.surfaceVariant),
      ),
      child: Column(children: children),
    );
  }
}

class _SliderTile extends StatelessWidget {
  final String title;
  final double value;
  final double min;
  final double max;
  final int divisions;
  final String label;
  final ValueChanged<double> onChanged;

  const _SliderTile({
    required this.title,
    required this.value,
    required this.min,
    required this.max,
    required this.divisions,
    required this.label,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: Theme.of(context).textTheme.titleMedium),
              Text(label, style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
          Slider(
            value: value,
            min: min,
            max: max,
            divisions: divisions,
            activeColor: AppTheme.primary,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
