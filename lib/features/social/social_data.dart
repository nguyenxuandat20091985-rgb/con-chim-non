import '../../shared/models/social_story.dart';

/// Nội dung Social Stories dành cho trẻ từ lớp 5 trở lên.
/// Ngôn ngữ rõ ràng, từng bước, không ẩn dụ phức tạp.
final List<SocialStory> kSocialStories = [
  SocialStory(
    id: 'apologize',
    title: 'Cách xin lỗi',
    emoji: '🙏',
    description: 'Khi bạn làm ai đó buồn hoặc sai sót',
    keyPhrases: ['Xin lỗi bạn', 'Mình không cố ý', 'Mình sẽ chú ý hơn'],
    steps: [
      SocialStoryStep(
        text: 'Nhận ra rằng hành động của mình đã làm người khác không vui.',
        emoji: '🤔',
      ),
      SocialStoryStep(
        text: 'Đến gần người đó (nếu an toàn) và nhìn vào họ.',
        emoji: '👀',
        tip: 'Không cần nhìn thẳng mắt quá lâu nếu bạn không thoải mái.',
      ),
      SocialStoryStep(
        text: 'Nói rõ ràng: "Xin lỗi bạn" hoặc "Mình xin lỗi".',
        emoji: '🗣️',
      ),
      SocialStoryStep(
        text: 'Có thể giải thích ngắn gọn nếu cần: "Mình không cố ý".',
        emoji: '💬',
      ),
      SocialStoryStep(
        text: 'Lắng nghe phản ứng của họ. Sau đó có thể hỏi: "Bạn ổn chứ?".',
        emoji: '👂',
      ),
    ],
  ),
  SocialStory(
    id: 'thank',
    title: 'Cách cảm ơn',
    emoji: '😊',
    description: 'Khi ai đó giúp đỡ hoặc cho bạn thứ gì',
    keyPhrases: ['Cảm ơn bạn', 'Mình cảm ơn nhiều', 'Bạn tốt quá'],
    steps: [
      SocialStoryStep(
        text: 'Nhận ra người khác đã làm điều gì đó tốt cho mình.',
        emoji: '💡',
      ),
      SocialStoryStep(
        text: 'Nhìn về phía họ và mỉm cười nếu cảm thấy thoải mái.',
        emoji: '🙂',
      ),
      SocialStoryStep(
        text: 'Nói: "Cảm ơn bạn" hoặc "Mình cảm ơn nhiều".',
        emoji: '🗣️',
      ),
      SocialStoryStep(
        text: 'Có thể nói thêm điều cụ thể: "Cảm ơn bạn đã giúp mình".',
        emoji: '💬',
      ),
    ],
  ),
  SocialStory(
    id: 'refuse',
    title: 'Từ chối lịch sự',
    emoji: '🙅',
    description: 'Khi bạn không muốn làm điều gì đó',
    keyPhrases: ['Không, cảm ơn', 'Mình không muốn', 'Lúc khác nhé'],
    steps: [
      SocialStoryStep(
        text: 'Bạn có quyền nói "không" khi không muốn làm điều gì.',
        emoji: '🛡️',
        tip: 'Từ chối không có nghĩa là bạn đang bất lịch sự.',
      ),
      SocialStoryStep(
        text: 'Nói rõ ràng và bình tĩnh: "Không, cảm ơn" hoặc "Mình không muốn".',
        emoji: '🗣️',
      ),
      SocialStoryStep(
        text: 'Nếu cần, đưa ra lý do ngắn: "Mình đang mệt" hoặc "Mình không thích".',
        emoji: '💬',
      ),
      SocialStoryStep(
        text: 'Bạn không cần giải thích quá nhiều nếu không muốn.',
        emoji: '✅',
      ),
    ],
  ),
  SocialStory(
    id: 'start-conversation',
    title: 'Bắt đầu trò chuyện',
    emoji: '💬',
    description: 'Cách mở lời với bạn bè hoặc người mới',
    keyPhrases: ['Chào bạn', 'Bạn đang làm gì vậy?', 'Mình có thể ngồi đây không?'],
    steps: [
      SocialStoryStep(
        text: 'Chọn thời điểm phù hợp (không làm phiền khi họ đang bận).',
        emoji: '⏰',
      ),
      SocialStoryStep(
        text: 'Đến gần và chào: "Chào bạn".',
        emoji: '👋',
      ),
      SocialStoryStep(
        text: 'Hỏi một câu đơn giản: "Bạn đang làm gì vậy?" hoặc "Hôm nay bạn thế nào?".',
        emoji: '❓',
      ),
      SocialStoryStep(
        text: 'Lắng nghe câu trả lời và có thể kể thêm về bản thân.',
        emoji: '👂',
      ),
      SocialStoryStep(
        text: 'Nếu cuộc trò chuyện kết thúc, bạn có thể nói: "Tạm biệt" hoặc "Hẹn gặp lại".',
        emoji: '🤝',
      ),
    ],
  ),
  SocialStory(
    id: 'misunderstanding',
    title: 'Khi bị hiểu lầm',
    emoji: '🤔',
    description: 'Cách giải thích khi người khác hiểu sai',
    keyPhrases: ['Mình muốn nói là…', 'Có lẽ mình nói chưa rõ', 'Ý mình là…'],
    steps: [
      SocialStoryStep(
        text: 'Nhận ra rằng người kia đang hiểu khác với ý bạn muốn nói.',
        emoji: '💡',
      ),
      SocialStoryStep(
        text: 'Giữ bình tĩnh. Không cần lớn tiếng.',
        emoji: '😌',
      ),
      SocialStoryStep(
        text: 'Nói: "Mình muốn nói là…" hoặc "Ý mình là…".',
        emoji: '🗣️',
      ),
      SocialStoryStep(
        text: 'Giải thích lại bằng câu ngắn và rõ ràng hơn.',
        emoji: '📝',
      ),
      SocialStoryStep(
        text: 'Hỏi lại: "Bạn hiểu ý mình chưa?" nếu cần.',
        emoji: '❓',
      ),
    ],
  ),
  SocialStory(
    id: 'ask-help',
    title: 'Xin giúp đỡ',
    emoji: '🙋',
    description: 'Khi bạn cần sự hỗ trợ từ người khác',
    keyPhrases: ['Bạn có thể giúp mình không?', 'Mình cần giúp đỡ', 'Làm ơn giúp mình với'],
    steps: [
      SocialStoryStep(
        text: 'Xác định mình đang cần giúp đỡ điều gì.',
        emoji: '🎯',
      ),
      SocialStoryStep(
        text: 'Tìm người phù hợp (bạn bè, thầy cô, người thân).',
        emoji: '👤',
      ),
      SocialStoryStep(
        text: 'Nói rõ ràng: "Bạn có thể giúp mình không?" hoặc "Mình cần giúp đỡ".',
        emoji: '🗣️',
      ),
      SocialStoryStep(
        text: 'Nói cụ thể mình cần gì: "Mình không hiểu bài này" hoặc "Mình bị đau".',
        emoji: '💬',
      ),
      SocialStoryStep(
        text: 'Cảm ơn sau khi được giúp đỡ.',
        emoji: '🙏',
      ),
    ],
  ),
];
