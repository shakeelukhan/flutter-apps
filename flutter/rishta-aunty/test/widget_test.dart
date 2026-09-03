import 'package:flutter_test/flutter_test.dart';

import 'package:rishta_aunty/ui/ui.dart';

void main() {
  testWidgets('App loads config.json and shows the app title and menu',
      (WidgetTester tester) async {
    await tester.pumpWidget(App.fromConfig('rishta_aunty_local'));
    // Config load -> asset read -> built_value deserialize -> bloc events
    // all happen asynchronously; a few pumps let that chain settle without
    // hitting pumpAndSettle()'s "never stops animating" trap (the submenu
    // BlocBuilder's DialogWidget shows a CircularProgressIndicator).
    for (var i = 0; i < 5; i++) {
      await tester.pump(const Duration(milliseconds: 100));
    }

    expect(find.text('Rishta Aunty'), findsOneWidget);
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Profile'), findsOneWidget);
    expect(find.text('Search'), findsOneWidget);
    expect(find.text('Rishtas'), findsOneWidget);
    expect(find.text('About'), findsOneWidget);
  });
}
