# Con Chim Non

**Ứng dụng hỗ trợ trẻ tự kỷ từ lớp 5 trở lên**

> "Mỗi đứa trẻ đều có thể bay xa nếu được nâng niu đúng cách."

## Giới thiệu

**Con Chim Non** là ứng dụng hỗ trợ toàn diện dành cho trẻ tự kỷ từ **10 tuổi trở lên** (lớp 5+).  
App tập trung vào việc giúp trẻ:

- Giao tiếp hiệu quả hơn
- Nhận diện và quản lý cảm xúc
- Xây dựng thói quen độc lập
- Luyện kỹ năng xã hội
- Tự điều hòa khi quá tải

Thiết kế dành riêng cho độ tuổi lớn hơn: giao diện sạch sẽ, có cấu trúc rõ ràng, không quá "trẻ con", tôn trọng sự trưởng thành của trẻ.

**Avatar app**: Con chim non dễ thương, biểu tượng của sự phát triển và tự do.

## Đối tượng sử dụng

| Đối tượng | Mô tả |
|-----------|-------|
| **Trẻ tự kỷ** | Từ lớp 5 trở lên (khoảng 10–16 tuổi) |
| **Phụ huynh** | Theo dõi tiến độ, tùy chỉnh nội dung |
| **Giáo viên / Chuyên gia** | Hỗ trợ can thiệp tại trường hoặc trung tâm |

## Tính năng chính

### 1. Giao tiếp (AAC nâng cao)
- Hệ thống thẻ hình ảnh + chữ viết
- Ghép câu phức tạp hơn (chủ ngữ + động từ + tân ngữ + trạng ngữ)
- Giọng đọc tự nhiên (TTS tiếng Việt)
- Cho phép trẻ tự tạo bộ thẻ theo sở thích
- Chế độ "Nói nhanh" cho các nhu cầu thường xuyên

### 2. Nhật ký Cảm xúc & Tự điều hòa
- Chọn cảm xúc hiện tại bằng hình ảnh + mức độ
- Gợi ý chiến lược tự điều hòa phù hợp với từng cảm xúc
- Không gian "Tổ Ấm" (Calm Space) với âm thanh, hình ảnh dịu nhẹ
- Theo dõi xu hướng cảm xúc theo ngày/tuần/tháng

### 3. Lịch trình & Nhiệm vụ
- Visual Schedule linh hoạt
- Chia nhỏ nhiệm vụ lớn thành các bước nhỏ
- Hệ thống phần thưởng "Lông vũ" (không gây áp lực)
- Nhắc nhở bằng hình ảnh + âm thanh nhẹ

### 4. Kỹ năng Xã hội
- Social Stories tương tác
- Tình huống mô phỏng (xin lỗi, cảm ơn, từ chối lịch sự, tham gia trò chuyện…)
- Luyện tập qua hình ảnh và lựa chọn

### 5. Chế độ Phụ huynh
- Xem báo cáo cảm xúc & hoạt động
- Tùy chỉnh nội dung, độ khó, màu sắc
- Xuất báo cáo PDF gửi chuyên gia

## Nguyên tắc thiết kế (ASD-friendly cho tuổi lớn)

- **Dự đoán được**: Layout nhất quán, vị trí nút không thay đổi
- **Giảm kích thích**: Màu dịu (xanh dương, xanh lá, be), hạn chế animation
- **Tùy chỉnh cao**: Cỡ chữ, độ tương phản, tắt âm thanh, giảm chuyển động
- **Phản hồi rõ ràng**: Mỗi hành động đều có feedback ngay lập tức
- **Không áp lực**: Không có điểm số cạnh tranh, không có countdown gây stress
- **Tôn trọng**: Giao diện không infantilization (không quá dễ thương kiểu trẻ mẫu giáo)

## Tech Stack

- **Framework**: Flutter 3.24+
- **State Management**: Riverpod
- **Local Database**: Hive / Isar
- **TTS**: flutter_tts + Google TTS tiếng Việt
- **Offline-first**: Hoạt động hoàn toàn không cần mạng
- **Platform**: Android + iOS

## Cấu trúc thư mục

```
con-chim-non/
├── assets/
│   ├── images/
│   │   ├── avatar_chim_non.png
│   │   └── icons/
│   ├── sounds/
│   └── lottie/
├── lib/
│   ├── main.dart
│   ├── app.dart
│   ├── core/
│   │   ├── theme/
│   │   ├── constants/
│   │   └── utils/
│   ├── features/
│   │   ├── communication/
│   │   ├── emotion/
│   │   ├── schedule/
│   │   ├── social/
│   │   └── parent/
│   ├── shared/
│   │   ├── widgets/
│   │   └── models/
│   └── router/
├── docs/
│   ├── design-system.md
│   ├── user-flow.md
│   └── accessibility.md
└── test/
```

## Cài đặt & Chạy

```bash
# Clone repo
git clone https://github.com/nguyenxuandat20091985-rgb/con-chim-non.git
cd con-chim-non

# Cài dependencies
flutter pub get

# Chạy app
flutter run
```

## Roadmap

- [x] Thiết kế concept & design system
- [x] Cấu trúc project Flutter
- [x] Màn hình chính + navigation
- [x] Module Giao tiếp (AAC)
- [x] Module Cảm xúc
- [ ] Module Lịch trình
- [ ] Module Kỹ năng xã hội
- [ ] Chế độ Phụ huynh
- [ ] Tích hợp TTS tiếng Việt chất lượng cao
- [ ] Xuất báo cáo PDF
- [ ] Phát hành bản beta

## Đóng góp

Repo này được tạo và phát triển chuyên biệt cho dự án **Con Chim Non**.  
Mọi đóng góp về code, thiết kế, nội dung social stories đều rất được hoan nghênh.

## License

MIT License – Tự do sử dụng cho mục đích giáo dục và hỗ trợ trẻ tự kỷ.

---

**Con Chim Non** – Giúp trẻ tự kỷ cất cánh theo cách của riêng mình.
