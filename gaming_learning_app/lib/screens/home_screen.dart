import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/course_content.dart';
import '../widgets/fill_widget.dart';
import '../widgets/image_match_widget.dart';
import '../widgets/audio_widget.dart';
import '../widgets/sentence_widget.dart';

class HomeScreen extends StatefulWidget {
  final ApiService apiService;

  const HomeScreen({super.key, required this.apiService});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;
  List<CourseContent> contentList = [];

  @override
  void initState() {
    super.initState();
    _loadCourseContent();
  }

  Future<void> _loadCourseContent() async {
    try {
      final rawData = await widget.apiService.createCourseContent("KG1");
      setState(() {
        contentList = rawData.map((e) => CourseContent.fromJson(e)).toList();
        isLoading = false;
      });
    } catch (e) {
      debugPrint("Error loading course content: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  Widget buildContentWidget(CourseContent content) {
    switch (content.type) {
      case 'fill':
        return FillWidget(content: content);
      case 'image_match':
        return ImageMatchWidget(content: content);
      case 'audio':
        return AudioWidget(content: content);
      case 'sentence':
        return SentenceWidget(content: content);
      default:
        return const Text("Unknown content type");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Course Content"),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : contentList.isEmpty
              ? const Center(child: Text("No course content available."))
              : ListView.builder(
                  itemCount: contentList.length,
                  itemBuilder: (context, index) => buildContentWidget(contentList[index]),
                ),
    );
  }
}
