class SocialStoryStep {
  final String text;
  final String? emoji;
  final String? tip;

  const SocialStoryStep({
    required this.text,
    this.emoji,
    this.tip,
  });
}

class SocialStory {
  final String id;
  final String title;
  final String emoji;
  final String description;
  final List<SocialStoryStep> steps;
  final List<String> keyPhrases;

  const SocialStory({
    required this.id,
    required this.title,
    required this.emoji,
    required this.description,
    required this.steps,
    this.keyPhrases = const [],
  });
}
