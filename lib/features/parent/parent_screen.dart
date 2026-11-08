import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/app_theme.dart';

class ParentScreen extends StatelessWidget {
  const ParentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: const Text('Chế độ Phụ huynh'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _SectionTitle(title: 'Báo cáo'),
          _ParentTile(
            icon: Icons.favorite_rounded,
            title: 'Nhật ký cảm xúc',
            subtitle: 'Xem xu hướng cảm xúc 7/30 ngày gần nhất',
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Tính năng đang được hoàn thiện')),
              );
            },
          ),
          _ParentTile(
            icon: Icons.calendar_month_rounded,
            title: 'Tiến độ lịch trình',
            subtitle: 'Tỷ lệ hoàn thành nhiệm vụ hàng ngày',
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Tính năng đang được hoàn thiện')),
              );
            },
          ),
          _ParentTile(
            icon: Icons.chat_rounded,
            title: 'Lịch sử giao tiếp',
            subtitle: 'Các câu trẻ đã sử dụng gần đây',
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Tính năng đang được hoàn thiện')),
              );
            },
          ),

          const SizedBox(height: 24),
          _SectionTitle(title: 'Tùy chỉnh'),
          _ParentTile(
            icon: Icons.palette_rounded,
            title: 'Giao diện & Trợ năng',
            subtitle: 'Cỡ chữ, độ tương phản, giảm chuyển động, âm thanh',
            onTap: () => context.push('/settings'),
          ),
          _ParentTile(
            icon: Icons.edit_rounded,
            title: 'Quản lý thẻ giao tiếp',
            subtitle: 'Thêm / sửa / xóa bộ thẻ hình ảnh',
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Tính năng đang được hoàn thiện')),
              );
            },
          ),
          _ParentTile(
            icon: Icons.list_alt_rounded,
            title: 'Quản lý lịch trình mẫu',
            subtitle: 'Tạo lịch trình theo ngày trong tuần',
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Tính năng đang được hoàn thiện')),
              );
            },
          ),

          const SizedBox(height: 24),
          _SectionTitle(title: 'Khác'),
          _ParentTile(
            icon: Icons.picture_as_pdf_rounded,
            title: 'Xuất báo cáo PDF',
            subtitle: 'Gửi cho chuyên gia / giáo viên',
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Tính năng sắp có')),
              );
            },
          ),
          _ParentTile(
            icon: Icons.info_outline_rounded,
            title: 'Về ứng dụng',
            subtitle: 'Phiên bản 1.0.0 • Con Chim Non',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12, left: 4),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: AppTheme.textSecondary,
            ),
      ),
    );
  }
}

class _ParentTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _ParentTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: AppTheme.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: AppTheme.primary, size: 22),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(height: 2),
                      Text(subtitle, style: Theme.of(context).textTheme.bodyMedium),
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
