import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_news/main.dart';

void main() {
  testWidgets('App loads correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: NewsNowApp(),
      ),
    );
    
    await tester.pump();
    
    expect(find.text('热点'), findsOneWidget);
  });
}
