import 'package:flutter_test/flutter_test.dart';

extension WidgetTesterExtension on WidgetTester {
  Future<void> pumpUntilFound(
    Finder finder, {
    Duration timeout = const Duration(seconds: 5),
    Duration interval = const Duration(milliseconds: 50),
  }) async {
    if (finder.evaluate().isNotEmpty) return;

    final stopwatch = Stopwatch()..start();

    while (stopwatch.elapsed < timeout) {
      await pump(interval);

      if (finder.evaluate().isNotEmpty) return;
    }

    throw TestFailure(
      'pumpUntilFound: $timeout 経過しても $finder が見つかりませんでした',
    );
  }
}
