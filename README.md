# rishtaaunty

> You're on `app/rishtaaunty` -- one of the independent, self-contained
> project branches in the `flutter-apps` archive repo (see that repo's
> `main` branch for the full index).

A matchmaking-app prototype, and the most architecturally developed of
the three Flutter apps in this archive: BLoC state management
(`flutter_bloc`), a config-driven app shell (menus/screens loaded from
`assets/rishta_aunty_dev.json` / `assets/config.json` rather than
hardcoded), generated data models (`built_value` + `json_serializable`,
`.g.dart` files checked in), and Firebase (Auth, Firestore, Analytics)
for the backend. Originally written 2019; a 2022 commit regenerated the
`.g.dart` model files but didn't touch the SDK/dependency versions.

The app's own source already marks a `lib/old_files/` directory as
superseded (pre-BLoC sign-in/dialog widgets, an early `AppDatabase`) --
that designation is the original author's, not something added by this
archival pass.

## This does NOT build on a current Flutter/Dart SDK

Verified directly, not assumed:

```
$ flutter pub get
Resolving dependencies...
The lower bound of "sdk: '>=2.1.0 <3.0.0'" must be 2.12.0'
or higher to enable null safety.

The current Dart SDK (3.13.2) only supports null safety.
```

Same blocker as `thebettingapp`, plus this one depends on several
packages pinned to pre-null-safety major versions that would each need
a real upgrade, not just a version bump: `cloud_firestore ^0.12.9`,
`firebase_auth ^0.14.0`, `firebase_analytics ^4.0.2`, `flutter_bloc
^0.21.0` (the `flutter_bloc` API changed significantly between 0.x and
current 8.x+), `built_value`/`built_collection` (code-generation-based,
would need their generated `.g.dart` output regenerated against current
generator versions after any model changes). Combined with the
null-safety migration every branch here would need, this is a
substantially bigger job than `thebettingapp` and roughly comparable to
`thepakistaniapp` -- out of scope for this archival pass. Preserved as
buildable history and hygiene only; source untouched.

## Structure

```
lib/
  main.dart                    entry point -- App.fromConfig('rishta_aunty_local')
  ui/
    ui.dart                    barrel export
    app.dart (via ui/)          root App widget, config-driven shell
    pages/
      home_page.dart
    widgets/                    shared UI widgets
  blocs/                        flutter_bloc state management
  data/
    data.dart                   barrel export
    models/                     built_value data models (+ generated .g.dart)
  tools/                        logging and misc utilities
  old_files/                    superseded pre-BLoC code (author's own
                                 designation, kept for reference only --
                                 see note above)
assets/
  config.json, rishta_aunty_dev.json   drives the app's menu/screen config
```

## Notes on this archival pass

- Repo hygiene fixed: a locally-committed root `.gradle/` build cache
  (6 files, same `.gitignore` gap as `thebettingapp`) was removed and
  the gap closed.
- `lib/old_files/` was left in place rather than deleted -- it's dead
  code by the original author's own admission, but removing files is a
  destructive, one-way action on an archival branch whose whole point is
  preserving what existed; the directory name already communicates its
  status clearly enough.

## License

MIT -- see [LICENSE](LICENSE).
