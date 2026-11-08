# Accessibility Guidelines – Con Chim Non

App được thiết kế đặc biệt cho trẻ tự kỷ từ 10 tuổi trở lên. Dưới đây là các nguyên tắc và checklist.

## Nguyên tắc chính

### 1. Giảm tải giác quan
- Màu sắc dịu, tránh đỏ/vàng chói và neon
- Hạn chế animation và chuyển động
- Có tùy chọn **Reduce Motion**
- Âm thanh có thể tắt hoàn toàn

### 2. Dự đoán được & nhất quán
- Vị trí nút và navigation không thay đổi
- Cùng một hành động luôn cho cùng một kết quả
- Không có popup bất ngờ hoặc tự động chuyển trang

### 3. Rõ ràng & đơn giản
- Ngôn ngữ đơn giản, tránh ẩn dụ và từ chuyên môn
- Mỗi màn hình tập trung vào một mục tiêu chính
- Phản hồi ngay lập tức sau mọi thao tác

### 4. Tùy chỉnh cao
- Cỡ chữ
- Độ tương phản
- Tốc độ giọng đọc TTS
- Tắt/bật âm thanh
- Giảm chuyển động

### 5. Tôn trọng sự tự chủ
- Không ép buộc hoàn thành nhiệm vụ
- Trẻ luôn có thể thoát khỏi màn hình (đặc biệt Tổ Ấm)
- Không có hình phạt hay điểm số tiêu cực

## Checklist kỹ thuật

- [x] Touch target ≥ 48dp
- [x] Tương phản màu đủ tốt
- [x] Hỗ trợ TalkBack / VoiceOver (Semantic labels cần bổ sung)
- [ ] Dynamic Type / scale font hệ thống
- [ ] Reduce Motion setting
- [ ] High Contrast mode
- [ ] Không phụ thuộc hoàn toàn vào màu sắc để truyền thông tin
- [ ] Timeout do người dùng kiểm soát (không tự động)

## Gợi ý khi phát triển tiếp

- Thêm `Semantics` widget cho các nút quan trọng
- Hỗ trợ `MediaQuery.disableAnimations`
- Cho phép phụ huynh khóa một số tính năng nếu cần
- Kiểm thử với người dùng thực tế (trẻ tự kỷ + phụ huynh)
