import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tesst/Features/Feature_Prototype/Presentaion/Pages/HomePage.dart';

void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();
  testWidgets("Check image size on 400x200 size  ",
      (WidgetTester tester) async {
    binding.window.physicalSizeTestValue = Size(200, 400);
    binding.window.devicePixelRatioTestValue = 1.0;
    await tester.pumpWidget(MaterialApp(home: HomePage()));
    final flutterlogo = find.byKey(ValueKey("Flutter Logo"));
    // // ? executing tests
    await tester.pump();
    final Size baseSize = tester.getSize(flutterlogo);
    expect(baseSize.height, 400 / 5);
    expect(baseSize.height, 400 / 5);
  });
  testWidgets("Check image size on 800x600 size  ",
      (WidgetTester tester) async {
    binding.window.physicalSizeTestValue = Size(600, 800);
    binding.window.devicePixelRatioTestValue = 1.0;
    await tester.pumpWidget(MaterialApp(home: HomePage()));
    final flutterlogo = find.byKey(ValueKey("Flutter Logo"));
    // // ? executing tests
    await tester.pump();
    final Size baseSize = tester.getSize(flutterlogo);
    expect(baseSize.height, 800 / 5);
    expect(baseSize.height, 800 / 5);
  });
  testWidgets("Check image size on 1800x1600 size  ",
      (WidgetTester tester) async {
    binding.window.physicalSizeTestValue = Size(1600, 1800);
    binding.window.devicePixelRatioTestValue = 1.0;
    await tester.pumpWidget(MaterialApp(home: HomePage()));
    final flutterlogo = find.byKey(ValueKey("Flutter Logo"));
    // // ? executing tests
    await tester.pump();
    final Size baseSize = tester.getSize(flutterlogo);
    expect(baseSize.height, 1800 / 5);
    expect(baseSize.height, 1800 / 5);
  });
  testWidgets("Check TextFormField size on 400x200 size  ",
      (WidgetTester tester) async {
    binding.window.physicalSizeTestValue = Size(200, 400);
    binding.window.devicePixelRatioTestValue = 1.0;
    await tester.pumpWidget(MaterialApp(home: HomePage()));
    final entrypoint = find.byKey(ValueKey("Entertextsss"));
    // // ? executing tests
    await tester.pump();
    final Size baseSize = tester.getSize(entrypoint);
    expect(baseSize.width, 200 * 0.95);
  });

  testWidgets("Check TextFormField size on 800x600 size  ",
      (WidgetTester tester) async {
    binding.window.physicalSizeTestValue = Size(600, 800);
    binding.window.devicePixelRatioTestValue = 1.0;
    await tester.pumpWidget(MaterialApp(home: HomePage()));
    final entrypoint = find.byKey(ValueKey("Entertextsss"));
    // ? executing tests

    await tester.pump();

    final Size baseSize = tester.getSize(entrypoint);
    expect(baseSize.width, 600 * 0.95);
  });
  testWidgets("Check TextFormField size on 1800x1600 size  ",
      (WidgetTester tester) async {
    binding.window.physicalSizeTestValue = Size(1600, 1800);
    binding.window.devicePixelRatioTestValue = 1.0;
    await tester.pumpWidget(MaterialApp(home: HomePage()));
    final entrypoint = find.byKey(ValueKey("Entertextsss"));
    // ? executing tests

    await tester.pump();
    final Size baseSize = tester.getSize(entrypoint);
    expect(baseSize.width, 1600 * 0.95);
  });
}
