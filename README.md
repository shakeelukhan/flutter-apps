# thepakistaniapp

> You're on `app/thepakistaniapp` -- one of the independent,
> self-contained project branches in the `flutter-apps` archive repo
> (see that repo's `main` branch for the full index).

An early-stage Flutter prototype for a Pakistani community app: a tabbed
shell (Home / Events / News / Dramas / Recipes / About) with Firebase
auth + Google sign-in wired up, an events map + summary view (Google
Maps), and a news screen. Several tabs (Dramas, Recipes, About, "News2")
are placeholder `Text(...)` widgets, not built out -- this was scaffolding
for a much bigger planned app, not a finished feature set. Written 2019.

## This does NOT build on a current Flutter/Dart SDK

Verified directly, not assumed:

```
$ flutter pub get
Resolving dependencies...
The lower bound of "sdk: '>=2.0.0-dev.68.0 <3.0.0'" must be 2.12.0'
or higher to enable null safety.

The current Dart SDK (3.13.2) only supports null safety.
```

This one predates null safety even more thoroughly than the other two
apps in this archive -- its SDK constraint (`>=2.0.0-dev.68.0`) targets
a pre-release Dart 2.0 dev channel build. On top of the null-safety
migration every branch in this archive would need, this app also pins
several now-ancient, largely-superseded packages directly to old
versions: `cloud_firestore: 0.8.2+3`, `firebase_auth: ^0.6.6`,
`google_maps_flutter: ^0.0.3+3`, `flutter_webview_plugin: ^0.3.0+2`
(long abandoned -- superseded by `webview_flutter`), `share: ^0.5.3`
(deprecated in favor of `share_plus`). Reviving this is a considerably
bigger job than `rishtaaunty` or `thebettingapp` -- essentially a
rewrite of the Firebase/Maps/webview integration layer on top of the
null-safety migration -- and is out of scope for this archival pass.
Preserved as-is: buildable history and hygiene only, source untouched.

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
      auth_screen.dart                     Firebase/Google auth UI
      firebase_screen.dart                 Firestore demo screen
      counter_screen.dart                  Flutter-default counter demo
      waiting_screen.dart                  loading/waiting placeholder
    events/
      events_summary_screen.dart           list view of events
      events_map_screen.dart               Google Maps view of events
    news_screen.dart                       news list
  widgets/
    calendarView/                          custom month/event calendar widget
  utils/
    NavHelper.dart                         builds the tab/bottom-nav structure
  generated/
    i18n.dart                              generated localization strings
```

## Notes on this archival pass

- No committed build artifacts or IDE project files were found in this
  repo (unlike `rishtaaunty` and `thebettingapp`, which each had a small
  amount of hygiene cleanup) -- nothing to fix here.
- `HomeScreen`'s class lives in `temp_screen.dart`, not a `home_screen.dart`
  -- a naming quirk from development, not a bug (the import in `app.dart`
  is correct and points at the right file). Left as-is.
- `EventModel.dart` is a one-field stub (`Event(this.name)`) -- the events
  feature was clearly still being designed, not a broken implementation
  of a finished one.

## License

MIT -- see [LICENSE](LICENSE).
