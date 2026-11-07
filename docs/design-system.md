# Design System – Con Chim Non

Thiết kế dành riêng cho trẻ tự kỷ **từ lớp 5 trở lên** (10–16 tuổi).

## Nguyên tắc cốt lõi

1. **Predictable (Dự đoán được)**  
   Layout cố định, vị trí nút không thay đổi giữa các màn hình.

2. **Low sensory load (Giảm kích thích)**  
   Màu dịu, ít animation, không có hiệu ứng bất ngờ.

3. **Respectful (Tôn trọng)**  
   Không infantilization. Giao diện sạch, trưởng thành hơn so với app cho trẻ mẫu giáo.

4. **Customizable (Tùy chỉnh cao)**  
   Cỡ chữ, độ tương phản, tắt âm thanh, giảm chuyển động.

5. **Immediate feedback**  
   Mọi hành động đều có phản hồi rõ ràng ngay lập tức.

## Màu sắc

| Tên            | Hex       | Mục đích                    |
|----------------|-----------|-----------------------------|
| Primary        | `#5B8DEF` | Nút chính, nhấn mạnh        |
| Secondary      | `#7BC67E` | Thành công, hoàn thành      |
| Accent         | `#FFB74D` | Phần thưởng nhẹ             |
| Background     | `#F7F9FC` | Nền chính                   |
| Surface        | `#FFFFFF` | Card, input                 |
| Text Primary   | `#1A2332` | Nội dung chính              |
| Text Secondary | `#5A6A7E` | Nội dung phụ                |
| Calm           | `#81D4FA` | Không gian Tổ Ấm            |

**Tránh**: Đỏ tươi, vàng chói, gradient mạnh, màu neon.

## Typography

- Font chính: **Nunito** (bo tròn, dễ đọc, thân thiện)
- Cỡ chữ tối thiểu: 14sp
- Line height: 1.4 – 1.5
- Ưu tiên font weight 500–700

## Spacing & Radius

- Spacing scale: 4 / 8 / 12 / 16 / 24 / 32 / 48
- Border radius: 12 (small) → 16 (medium) → 24 (large)
- Touch target tối thiểu: **48×48 dp**

## Components chính

- Card lớn, dễ chạm
- Nút primary full-width hoặc lớn
- Bottom navigation cố định 5 tab
- Không dùng floating action button phức tạp
- Progress bar đơn giản, không animation quá đà

## Accessibility checklist

- [ ] Hỗ trợ tăng cỡ chữ hệ thống
- [ ] Chế độ tương phản cao
- [ ] Tắt animation / reduce motion
- [ ] Hỗ trợ TalkBack / VoiceOver
- [ ] Không phụ thuộc hoàn toàn vào màu sắc để truyền thông tin
- [ ] Timeout không tự động (người dùng tự kiểm soát)

## Avatar

- Con chim non (🐣) – biểu tượng sự phát triển, dịu dàng, không quá baby.
- Dùng nhất quán trên splash, home và icon app.
