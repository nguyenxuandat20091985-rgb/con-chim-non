# Checklist phát triển – Con Chim Non

## Đã hoàn thành

- [x] Concept & tên app (Con Chim Non)
- [x] Design system ASD-friendly cho trẻ lớp 5+
- [x] Cấu trúc project Flutter
- [x] Theme (màu dịu, font Nunito, radius lớn)
- [x] Router + Bottom Navigation
- [x] Màn hình Trang chủ
- [x] Module Giao tiếp (AAC) + TTS
- [x] Module Cảm xúc + mức độ + gợi ý
- [x] Màn hình Tổ Ấm (Calm Space)
- [x] Module Lịch trình (Visual Schedule)
- [x] Module Kỹ năng xã hội (danh sách tình huống)
- [x] Chế độ Phụ huynh (UI cơ bản)
- [x] Models (EmotionEntry, ScheduleItem)
- [x] Constants
- [x] Tài liệu: Design System, User Flow, Accessibility
- [x] LICENSE + .gitignore + analysis_options

## Còn thiếu / Cần làm tiếp

### Ưu tiên cao
- [ ] Chạy `flutter create .` để sinh folder android/ ios/ (cần máy local)
- [ ] Thêm icon app thật (avatar chim non)
- [ ] Splash screen
- [ ] Lưu dữ liệu thật bằng Hive (cảm xúc, lịch trình, lịch sử giao tiếp)
- [ ] Social Stories chi tiết (từng bước cho mỗi tình huống)
- [ ] Semantics / accessibility labels cho TalkBack

### Ưu tiên trung bình
- [ ] Onboarding lần đầu mở app
- [ ] Cài đặt tùy chỉnh (cỡ chữ, reduce motion, tốc độ TTS)
- [ ] Xuất báo cáo PDF cho phụ huynh
- [ ] Cho phép phụ huynh thêm/sửa thẻ giao tiếp & lịch trình
- [ ] Dark mode hoàn chỉnh hơn

### Ưu tiên thấp / Tương lai
- [ ] Đồng bộ đám mây (tùy chọn)
- [ ] Nhiều giọng TTS tiếng Việt hơn
- [ ] Widget trên màn hình chính (Android)
- [ ] Phiên bản web (nếu cần)

## Ghi chú quan trọng

Repo hiện tại là **source code logic + UI**.  
Để chạy được trên máy thật, anh cần:

```bash
git clone https://github.com/nguyenxuandat20091985-rgb/con-chim-non.git
cd con-chim-non
flutter create .          # sinh android/ ios/ windows... 
flutter pub get
flutter run
```
