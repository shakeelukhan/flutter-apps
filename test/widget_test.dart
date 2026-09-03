import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:thebettingapp/app.dart';

void main() {
  // A screen's LoadingScreenHelper shows an indeterminate
  // CircularProgressIndicator while settings load -- that animates
  // forever, so pumpAndSettle() (which waits for animations to stop)
  // would time out even on a healthy app. A single bounded pump is
  // enough to let the SharedPreferences future resolve.
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  testWidgets('App launches and shows the app bar title', (WidgetTester tester) async {
    await tester.pumpWidget(App());
    await tester.pump(const Duration(seconds: 1));

    expect(find.text('TheBettingApp'), findsOneWidget);
  });

  testWidgets('Settings/Session/Game tabs are reachable from the bottom nav',
      (WidgetTester tester) async {
    await tester.pumpWidget(App());
    await tester.pump(const Duration(seconds: 1));

    expect(find.text('Settings'), findsOneWidget);
    expect(find.text('Session'), findsOneWidget);
    expect(find.text('Game'), findsOneWidget);
  });
}
