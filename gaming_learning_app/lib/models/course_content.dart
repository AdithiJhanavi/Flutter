class CourseContent {
  final String type;
  final String content;

  CourseContent({required this.type, required this.content});

  factory CourseContent.fromJson(Map<String, dynamic> json) {
    return CourseContent(
      type: json['type'],
      content: json['content'],
    );
  }
}