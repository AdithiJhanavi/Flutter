import 'package:flutter/material.dart';
import '../models/course_content.dart';

class AudioWidget extends StatelessWidget {
  final CourseContent content;

  const AudioWidget({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Listen and Fill", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          ElevatedButton(
            onPressed: () {
              // Play audio functionality
            },
            child: Text("Play Audio"),
          ),
          TextField(
            decoration: InputDecoration(hintText: "Fill in the answer", border: OutlineInputBorder()),
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