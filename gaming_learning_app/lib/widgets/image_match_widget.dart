import 'package:flutter/material.dart';
import '../models/course_content.dart';

class ImageMatchWidget extends StatelessWidget {
  final CourseContent content;

  const ImageMatchWidget({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Image Identification", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          // Placeholder for image, replace 'assets/image.png' with your image path
          Image.asset('assets/${content.content}.png', height: 200),
          SizedBox(height: 10),
          Text("What do you See?"),
          TextField(
            decoration: InputDecoration(hintText: "Enter your answer", border: OutlineInputBorder()),
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