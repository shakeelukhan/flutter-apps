import 'package:flutter_test/flutter_test.dart';

import 'package:thepakistaniapp/app.dart';

void main() {
  testWidgets('App launches and shows the bottom-nav menu',
      (WidgetTester tester) async {
    await tester.pumpWidget(App());
    await tester.pump(const Duration(seconds: 1));

    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Events'), findsOneWidget);
    expect(find.text('News'), findsOneWidget);
    expect(find.text('Dramas'), findsOneWidget);
    expect(find.text('Recipes'), findsOneWidget);
    expect(find.text('About'), findsOneWidget);
  });
}
