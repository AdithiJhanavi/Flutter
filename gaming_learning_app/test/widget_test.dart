// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'package:gaming_learning_app/main.dart' as main_app;
import 'package:gaming_learning_app/services/api_service.dart' as services;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'widget_test.mocks.dart';

@GenerateMocks([services.ApiService])
void main() {
  testWidgets('Course content loads and displays correctly', (WidgetTester tester) async {
    // Mock the ApiService
    final mockApiService = MockApiService();
    when(mockApiService.createCourseContent("KG1")).thenAnswer((_) async => [
      {"type": "fill", "content": "Fill in the blanks for KG1"},
      {"type": "image_match", "content": "Match the image for KG1"},
      {"type": "audio", "content": "Listen to this audio for KG1"},
      {"type": "sentence", "content": "Complete the sentence for KG1"},
    ]);

    // Build the app with the mock ApiService
    await tester.pumpWidget(main_app.DemoApp(apiService: mockApiService));

    // Verify that the loading indicator is shown initially.
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // Simulate the completion of the FutureBuilder by pumping frames.
    await tester.pump(const Duration(milliseconds: 100));

    // Verify that the course content is displayed.
    expect(find.text('Fill in the blanks for KG1'), findsOneWidget);
    expect(find.text('Match the image for KG1'), findsOneWidget);
    expect(find.text('Listen to this audio for KG1'), findsOneWidget);
    expect(find.text('Complete the sentence for KG1'), findsOneWidget);
  });
}
