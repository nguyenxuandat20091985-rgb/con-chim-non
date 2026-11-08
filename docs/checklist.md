# Checklist phát triển – Con Chim Non

## Đã hoàn thành

- [x] Concept & tên app (Con Chim Non)
- [x] Design system ASD-friendly cho trẻ lớp 5+
- [x] Cấu trúc project Flutter
- [x] Theme (màu dịu, font, radius lớn)
- [x] Router + Bottom Navigation
- [x] Splash screen
- [x] Màn hình Trang chủ
- [x] Module Giao tiếp (AAC) + TTS
- [x] Module Cảm xúc + mức độ + gợi ý
- [x] Màn hình Tổ Ấm (Calm Space)
- [x] Module Lịch trình (Visual Schedule)
- [x] Module Kỹ năng xã hội + **Social Stories chi tiết từng bước**
- [x] Chế độ Phụ huynh
- [x] Màn hình Cài đặt (Trợ năng)
- [x] Models (EmotionEntry, ScheduleItem, SocialStory)
- [x] StorageService (Hive-ready)
- [x] Constants
- [x] Tài liệu: Design System, User Flow, Accessibility, Checklist
- [x] LICENSE + .gitignore + analysis_options

## Còn lại (cần máy local / giai đoạn sau)

### Cần chạy trên máy anh
- [ ] `flutter create .` để sinh folder `android/` và `ios/`
- [ ] Thêm icon app thật (avatar chim non)
- [ ] `flutter pub get` + `flutter run`

### Tính năng nâng cao (có thể làm tiếp)
- [ ] Lưu cảm xúc thật vào Hive khi nhấn "Ghi nhận"
- [ ] Lưu trạng thái lịch trình vào Hive
- [ ] Báo cáo cảm xúc / tiến độ cho phụ huynh
- [ ] Cho phụ huynh thêm/sửa thẻ giao tiếp & lịch trình
- [ ] Xuất báo cáo PDF
- [ ] Onboarding lần đầu mở app
- [ ] Semantics labels đầy đủ cho TalkBack

## Cách chạy

```bash
git clone https://github.com/nguyenxuandat20091985-rgb/con-chim-non.git
cd con-chim-non
flutter create .
flutter pub get
flutter run
```
