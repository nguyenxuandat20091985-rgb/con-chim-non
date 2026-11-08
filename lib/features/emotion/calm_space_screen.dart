import 'package:flutter/material.dart';

import '../../core/theme/app_theme.dart';

/// Không gian yên tĩnh giúp trẻ tự kỷ tự điều hòa khi quá tải.
/// Thiết kế tối giản, màu dịu, không có yếu tố gây kích thích.
class CalmSpaceScreen extends StatefulWidget {
  const CalmSpaceScreen({super.key});

  @override
  State<CalmSpaceScreen> createState() => _CalmSpaceScreenState();
}

class _CalmSpaceScreenState extends State<CalmSpaceScreen> {
  int _breathCount = 0;
  bool _isBreathing = false;

  void _startBreathing() {
    setState(() {
      _isBreathing = true;
      _breathCount = 0;
    });
    _runBreathCycle();
  }

  Future<void> _runBreathCycle() async {
    // Chu kỳ thở đơn giản: hít 4s - giữ 2s - thở 4s
    for (int i = 0; i < 5; i++) {
      if (!mounted || !_isBreathing) return;
      setState(() => _breathCount = i + 1);
      await Future.delayed(const Duration(seconds: 10));
    }
    if (mounted) {
      setState(() => _isBreathing = false);
    }
  }

  void _stopBreathing() {
    setState(() => _isBreathing = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE3F2FD), // Xanh rất nhạt, dịu mắt
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: AppTheme.textPrimary,
        title: const Text('Tổ Ấm'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Text(
                'Đây là không gian an toàn của bạn',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: const Color(0xFF1565C0),
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'Hít thở chậm và đều. Bạn không cần làm gì cả.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppTheme.textSecondary,
                    ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),

              // Vòng tròn thở
              AnimatedContainer(
                duration: const Duration(milliseconds: 800),
                width: _isBreathing ? 180 : 140,
                height: _isBreathing ? 180 : 140,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppTheme.calm.withOpacity(0.4),
                  border: Border.all(
                    color: AppTheme.calm,
                    width: 3,
                  ),
                ),
                child: Center(
                  child: Text(
                    _isBreathing ? '$_breathCount / 5' : '🐣',
                    style: TextStyle(
                      fontSize: _isBreathing ? 28 : 48,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF1565C0),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 32),

              if (_isBreathing)
                Text(
                  'Hít vào... Giữ... Thở ra...',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: const Color(0xFF1565C0),
                      ),
                )
              else
                Text(
                  'Nhấn nút bên dưới để bắt đầu thở cùng chim non',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),

              const Spacer(),

              // Nút điều khiển
              if (!_isBreathing)
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: _startBreathing,
                    icon: const Icon(Icons.air_rounded),
                    label: const Text('Bắt đầu thở'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF42A5F5),
                      minimumSize: const Size.fromHeight(56),
                    ),
                  ),
                )
              else
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: _stopBreathing,
                    icon: const Icon(Icons.stop_rounded),
                    label: const Text('Dừng lại'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color(0xFF1565C0),
                      side: const BorderSide(color: Color(0xFF1565C0)),
                      minimumSize: const Size.fromHeight(56),
                    ),
                  ),
                ),

              const SizedBox(height: 16),

              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Tôi đã sẵn sàng trở lại'),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
