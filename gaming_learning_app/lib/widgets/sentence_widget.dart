import 'package:flutter/material.dart';
import '../models/course_content.dart';

class SentenceWidget extends StatelessWidget {
  final CourseContent content;

  const SentenceWidget({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(content.content, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          TextField(
            decoration: InputDecoration(hintText: "Complete the sentence", border: OutlineInputBorder()),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Handle submission
            },
            child: Text("Continue"),
          ),
        ],
      ),
    );
  }
}