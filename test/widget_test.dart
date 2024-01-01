// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_book_chap5_q501/main.dart';



 
 
void main() {
  // This is a test suite for widget tests. 'testWidgets' creates a new test case with a 'WidgetTester' to test the widgets.
  testWidgets('Global Theme Implementation Test', (WidgetTester tester) async {
    // This line creates an instance of 'MyApp' and gets its global theme.
    final globalTheme = const MyApp().globalTheme();
    //Unfortunately I could find no feasible way to get this from the running app (via pumpWidget below), so had to resort to doing this

    // This line tells the tester to build the 'MyApp' widget.
    await tester.pumpWidget(const MyApp());

    // This section verifies that the AppBar uses the global theme color.
    // This line finds the AppBar widget in the widget tree.
    AppBar appBar = tester.widget(find.byType(AppBar));
    // This line checks if the background color of the AppBar is the same as the primary color of the global theme.
    expect(
        appBar.backgroundColor, //actual
        equals(globalTheme.colorScheme.primary)); //expected

    // This section verifies that the TextButton uses the theme's primary color.
    // This line finds the TextButton widget in the widget tree.
    TextButton textButton = tester.widget(find.byType(TextButton));
    // This line checks if the foreground color of the TextButton is the same as the primary color of the global theme.
    expect(textButton.style?.foregroundColor?.resolve({}),
        equals(globalTheme.colorScheme.primary));

    // This section verifies that the Text widgets use the correct text theme.
    // This line finds the Text widget in the widget tree.
    Text text = tester.widget(find.byType(Text));

    // This line checks if the font family of the Text widget is the same as the font family of the 'bodyLarge' text style of the global theme.
    expect(text.style?.fontFamily,
        equals(globalTheme.textTheme.bodyLarge?.fontFamily));

    // This line checks if the font size of the Text widget is the same as the font size of the 'bodyLarge' text style of the global theme.
    expect(text.style?.fontSize,
        equals(globalTheme.textTheme.bodyLarge?.fontSize));

    // This line checks if the font style of the Text widget is the same as the font style of the 'bodyLarge' text style of the global theme.
    expect(text.style?.fontStyle,
        equals(globalTheme.textTheme.bodyLarge?.fontStyle));
  });
}