# the-pakistani-app

> You're on `app/the-pakistani-app` -- one of the independent,
> self-contained project branches in the `flutter-apps` archive repo
> (see that repo's `main` branch for the full index). The Dart package
> itself is named `the_pakistani_app` (underscores, not hyphens -- Dart
> package names can't contain hyphens); the hyphenated name is just this
> branch/repo path. The Android/iOS/macOS bundle identifier
> (`com.thedesiproject.thepakistaniapp`) is untouched by this rename --
> it's tied to a real historical Firebase project registration, not just
> a display name.

An early-stage Flutter prototype for a Pakistani community app: a tabbed
shell (Home / Events / News / Dramas / Recipes / About) with Google
Sign-In UI (never actually wired to sign-in -- see Notes), Firestore and
Google Maps demo screens, and a news screen backed by NewsAPI.org.
Several tabs (Dramas, Recipes, About, "News2") are placeholder `Text(...)`
widgets, not built out -- this was scaffolding for a much bigger planned
app, not a finished feature set. Written 2019. Since modernized to build
and run on a current Flutter SDK -- see below. This was the hardest of
the three Flutter apps in this archive to modernize (the only one with
real Firebase/Maps/webview integrations that couldn't just be excluded
as dead code).

## This builds and runs on a current Flutter/Dart SDK

Verified directly, not assumed. `flutter pub get` originally failed:

```
$ flutter pub get
Resolving dependencies...
The lower bound of "sdk: '>=2.0.0-dev.68.0 <3.0.0'" must be 2.12.0'
or higher to enable null safety.

The current Dart SDK (3.13.2) only supports null safety.
```

This predated null safety even more thoroughly than the other two apps
in this archive (`>=2.0.0-dev.68.0` targets a pre-release Dart 2.0 dev
build) and pinned several now-abandoned packages: `cloud_firestore
0.8.2`, `google_maps_flutter ^0.0.3`, `flutter_webview_plugin`
(long-abandoned, superseded by `webview_flutter`), `share` (deprecated,
superseded by `share_plus`). Unlike `rishta-aunty`, none of these could
be removed as dead code -- every one of them is exercised by a real,
reachable screen. `google_sign_in`/`firebase_auth` *were* removable
though -- see Notes.

Real result, not just "it compiles":

```
$ flutter analyze                          # 0 errors, 1 warning (unrelated to migration -- see Notes), 76 style infos
$ flutter test                             # 1/1 passing
$ flutter build macos --debug              # ✓ Built build/macos/Build/Products/Debug/the_pakistani_app.app
$ flutter build macos                      # ✓ release build also succeeds (79.4MB)
$ flutter build web --no-tree-shake-icons  # ✓ Built build/web
```

Both macOS builds were actually launched, not just compiled -- `open`
on the `.app` produced a running process. No iOS Simulator runtime or
Android SDK was available in this environment, so macOS desktop and web
are the verified targets here.

No Firebase project, Google Maps API key, or NewsAPI.org key is
configured for this archived app (the originals were redacted -- see
this repo's security history). The Firebase and Maps screens will show
an error or blank tiles when visited; the news screen's API call will
401. All three are graceful failures (documented, not something this
pass tried to paper over) rather than app-wide crashes.

## Structure

```
lib/
  main.dart                                entry point
  app.dart                                 root widget, tab/bottom-nav wiring
  models/
    EventModel.dart                        minimal stub (name field only)
  screens/
    home/
      temp_screen.dart                     the actual "Home" tab (class
                                            is named HomeScreen despite
                                            the filename)
      auth_screen.dart                     Google Sign-In UI (button
                                            prints a debug message,
                                            never calls sign-in)
      firebase_screen.dart                 Firestore demo screen
      counter_screen.dart                  Flutter-default counter demo
      waiting_screen.dart                  loading/waiting placeholder
    events/
      events_summary_screen.dart           list + calendar view of events
      events_map_screen.dart               Google Maps view of events
    news_screen.dart                       NewsAPI.org-backed news list
  widgets/
    calendarView/                          custom month/event calendar widget
    temp.dart                              small unreferenced counter widget
  utils/
    NavHelper.dart                         builds the tab/bottom-nav structure
test/
  widget_test.dart                         launches the app, checks all 6 tabs
```

## Notes on this modernization pass

- **`google_sign_in` and `firebase_auth` were removable entirely.**
  `auth_screen.dart` and `temp_screen.dart` both declared
  `GoogleSignInAccount`/`GoogleSignIn` fields that were never read
  anywhere -- their buttons just print a debug message. A whole
  top-level `signInWithGoogle()`/`signOutWithGoogle()` pair in
  `waiting_screen.dart` (using firebase_auth 0.6.x's old
  `signInWithGoogle(idToken:, accessToken:)`/`FirebaseUser` API) was
  never called from anywhere live -- the one call site was already
  commented out. All removed rather than migrated to the current
  (very different) `signInWithCredential`/`UserCredential` API, since
  there was zero reachable behavior to preserve.
- **Found and fixed a real bug along the way**: `news_screen.dart`'s
  article sort comparator returned `null` from its missing-timestamp
  branch instead of an `int` -- a comparator contract violation that
  would have thrown the first time an article without a `publishedAt`
  field was actually sorted against another.
- **Also found and fixed**: `counter_screen.dart` uses
  `AutomaticKeepAliveClientMixin` but never called `super.build(context)`
  in its `build()` override, which that mixin requires -- would have
  thrown an assertion failure in debug mode the first time that tab
  actually rendered. Pre-existing, unrelated to null safety.
- **`quiver` was used but never declared** as a pubspec dependency
  (`monthView.dart` imports `package:quiver/time.dart` for
  `daysInMonth()`). No `pubspec.lock` was ever committed for this app,
  so there's no record of whether/how this ever resolved before.
  Declared as a direct dependency now regardless.
- **`share_plus` deliberately pinned to `^7.2.2`**, not the current
  major version -- 7.x keeps the same simple `Share.share(text)` static
  API the original `share` package had. The current major version
  introduced a different `SharePlus.instance.share(ShareParams(...))`
  API; pinning to the compatible version minimizes what actually
  changed here.
- **`ThemeData.accentColor`/`.accentTextTheme` and the old (pre-2018)
  `TextTheme` property names** (`display1`/`subhead`/`headline`/`title`/
  `body1`) used throughout `widgets/calendarView/` were all removed from
  current Flutter. Remapped onto 6 distinct current-API text-style slots,
  preserving the exact same font sizes/colors/weights -- this custom
  `ThemeData` is only ever read directly by the calendar widgets as a
  plain settings object (never applied as the app's ambient `Theme`), so
  slot choice can't collide with anything else.
- `lib/generated/i18n.dart` (an auto-generated, empty localization
  scaffold -- its own header says "DO NOT EDIT") and a second,
  independently-broken stale test file (`test/app_test.dart`, expecting
  a floating counter UI that never existed in this app's actual tabbed
  design) were both deleted rather than migrated.
- `HomeScreen`'s class lives in `temp_screen.dart`, not a
  `home_screen.dart` -- a naming quirk from development, not a bug (the
  import in `app.dart` is correct). Left as-is.
- **Known unrelated warning**: `widgets/temp.dart`'s `TempPage` (an
  unreferenced widget, kept rather than deleted) mutates a field
  directly on the `StatefulWidget` itself instead of keeping that state
  in its `State` object -- a real Flutter anti-pattern, but pre-existing
  and harmless since nothing renders this widget. Not fixed, to avoid
  restructuring code with zero live usage to verify against.
- **Two more real bugs found during independent review (Grok 4.6 /
  ai-nepo), both fixed**: the `ThemeData` remapping above initially
  pointed 3 sites (`calendarView`'s year text, `eventsView`'s detail and
  time text) at the wrong slot -- they read `bodyLarge` (black, the
  slot for `accentTextTheme.body1`) instead of `bodyMedium` (blueGrey,
  the slot for the original `subhead`), and `monthView`'s non-event day
  numbers had the same mixup. And `news_screen.dart`'s loading/empty
  logic was keyed off `articles == null`, which doesn't distinguish
  "fetch still in progress" from "fetch completed with no articles key"
  -- a 401 response (what this always gets without a real API key) has
  no `articles` key at all, so the screen span its `CircularProgressIndicator`
  forever instead of showing "No articles saved". Now keyed off
  `data == null` instead.
- **Rename**: the app was renamed from `thepakistaniapp` to distinguish
  word boundaries -- `the_pakistani_app` for the Dart package
  (underscores; Dart package names can't contain hyphens),
  `app/the-pakistani-app` for the branch/repo path (hyphens, matching
  this archive's convention). The Android `applicationId`/`package` and
  the iOS/macOS `PRODUCT_BUNDLE_IDENTIFIER`
  (`com.thedesiproject.thepakistaniapp`) were deliberately left
  unrenamed -- registered against a real (if long since retired)
  Firebase project (`tthepakistaniapp-1547719565335`, see
  `google-services.json`), so this is historical identity, not just a
  cosmetic display name. The Android `android:label`, macOS/iOS
  `PRODUCT_NAME`, and web manifest name were renamed, since those are
  purely cosmetic and unrelated to the bundle identifier.

## License

MIT -- see [LICENSE](LICENSE).
