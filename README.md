# rishta-aunty

> You're on `app/rishta-aunty` -- one of the independent, self-contained
> project branches in the `flutter-apps` archive repo (see that repo's
> `main` branch for the full index). The Dart package itself is named
> `rishta_aunty` (underscores, not hyphens -- Dart package names can't
> contain hyphens); the hyphenated name is just this branch/repo path.
> The Android/iOS/macOS bundle identifier (`com.thedesiproject.rishtaaunty`)
> is untouched by this rename -- it's tied to a real historical Firebase
> project registration (see Notes), not just a display name.

A matchmaking-app prototype, and the most architecturally developed of
the three Flutter apps in this archive: BLoC state management
(`flutter_bloc`), a config-driven app shell (menus/screens loaded from
`assets/rishta_aunty_dev.json` / `assets/config.json` rather than
hardcoded), and generated data models (`built_value`). Originally written
2019; a 2022 commit regenerated the `.g.dart` model files but didn't
touch the SDK/dependency versions. Since modernized to build and run on
a current Flutter SDK -- see below.

The app's own source already marks a `lib/old_files/` directory as
superseded (pre-BLoC sign-in/dialog widgets, an early `AppDatabase`) --
that designation is the original author's. That directory was excluded
from this modernization pass entirely (see "Notes" below).

## This builds and runs on a current Flutter/Dart SDK

Verified directly, not assumed. `flutter pub get` originally failed:

```
$ flutter pub get
Resolving dependencies...
The lower bound of "sdk: '>=2.1.0 <3.0.0'" must be 2.12.0'
or higher to enable null safety.

The current Dart SDK (3.13.2) only supports null safety.
```

This one needed more than a null-safety pass: the BLoC layer used the
pre-rewrite `bloc` package API (`initialState`/`mapEventToState`/
`dispatch`/`currentState`), which was completely replaced years ago by
constructor-registered `on<Event>` handlers, `emit()`, `add()`, and
`state` -- a real rewrite, not a mechanical migration. Also removed 23
of 25 dependencies that turned out to be entirely unused outside
`lib/old_files/` (checked by grepping actual imports, not guessed),
which eliminated the need to migrate Firebase Auth/Firestore/Analytics
at all. Full breakdown in the git history on this branch.

Real result, not just "it compiles":

```
$ flutter analyze                          # 0 errors, 2 warnings (see "known constraint" below), 13 style infos
$ flutter test                             # 1/1 passing
$ flutter build macos --debug              # ✓ Built build/macos/Build/Products/Debug/rishta_aunty.app
$ flutter build macos --no-tree-shake-icons # ✓ release build (bare `flutter build macos` defaults to
                                            #   release, which enforces icon tree-shaking and fails --
                                            #   only --debug or this flag succeeds; verified both ways)
$ flutter build web --no-tree-shake-icons  # ✓ Built build/web
```

Both builds were actually launched, not just compiled -- `open` on the
macOS `.app` produced a running process. No iOS Simulator runtime or
Android SDK was available in this environment, so macOS desktop and web
are the verified targets here.

## Structure

```
lib/
  main.dart                    entry point -- App.fromConfig('rishta_aunty_local')
  ui/
    ui.dart                    barrel export
    app.dart (via ui/)          root App widget, config-driven shell
    routes.dart, pages/          fluro routing -- configured but not
                                  actually consulted for navigation
                                  (MaterialApp's home: is set directly);
                                  already true before this pass
    widgets/                    shared UI widgets
  blocs/                        flutter_bloc state management
  data/
    data.dart                   barrel export
    models/                     built_value data models (+ generated .g.dart)
  tools/                        logging, JSON/asset helpers, built_value glue
  old_files/                    superseded pre-BLoC code (author's own
                                 designation) -- excluded from this
                                 migration entirely, see Notes
assets/
  config.json, rishta_aunty_dev.json   drives the app's menu/screen config
test/
  widget_test.dart              loads config.json, checks title + menu
```

## Notes on this modernization pass

- **23 of 25 dependencies were unused.** Checked by grepping actual
  imports in `lib/`, not assumed: `auth`, `cloud_firestore`,
  `firebase_analytics`, `firebase_auth`, `flutter_signin_button`,
  `package_info`, `sembast`, `country_pickers`, `flutter_radio`,
  `puppeteer`, `localstorage`, `flutter_advanced_networkimage`, `scrapy`,
  `flutter_cache_manager`, `flutter_cache_store`, `flash`, `location`,
  `equatable`, `intro_views_flutter`, `fl_chart`, `dropdownfield`,
  `json_table`, and `percent_indicator` were either never imported at
  all, or only from `lib/old_files/`. Removed rather than migrated.
- **`lib/old_files/` was excluded entirely**, not migrated -- it's dead
  code by the original author's own admission (the directory name), and
  nothing outside it ever imports from it. Kept in place (not deleted)
  for provenance; excluded via `analysis_options.yaml` so it doesn't
  show as broken in `flutter analyze`.
- **`RemoteConfigDatasourceModel` was dead code, more precisely: its
  constructor ran (as a side effect of `ConfigModel` deserializing the
  entire `apps` map in config.json, including the unused
  `"rishta_aunty_cloud"` entry that referenced it), but its `getString()`/
  `getJson()` were never called anywhere** -- the app always loads
  `"rishta_aunty_local"`, an `AssetDatasourceModel`, as its actual
  datasource. Removed along with the `firebase_remote_config` dependency
  and that config.json entry, rather than migrated -- keeping a real
  Firebase dependency around for a datasource that was never actually
  read from would mean needing live Firebase project credentials just to
  build. (Correction: an earlier version of this note said the class was
  "never instantiated," which wasn't quite right -- caught during
  independent review.)
- **Known remaining constraint**: menu icons are built from a runtime
  `codePoint` in config JSON via `IconData(...)`, which conflicts with
  Flutter's default icon tree-shaking. `flutter analyze` shows 2
  warnings about this; `flutter build web` needs
  `--no-tree-shake-icons` (verified: fails without it). This was already
  true of the original code -- modern Flutter just enforces it as a
  hard error now instead of silently working.
- Repo hygiene fixed: a locally-committed root `.gradle/` build cache
  (6 files) was removed.
- **Rename**: the app was renamed from `rishtaaunty` to distinguish word
  boundaries -- `rishta_aunty` for the Dart package (underscores; Dart
  package names can't contain hyphens), `app/rishta-aunty` for the
  branch/repo path (hyphens, matching this archive's convention). The
  Android `applicationId`/`package` and the iOS/macOS
  `PRODUCT_BUNDLE_IDENTIFIER` (`com.thedesiproject.rishtaaunty`) were
  deliberately left unrenamed -- they're already registered against a
  real (if long since retired) Firebase project (`rishtaaunty-463ca`, see
  `google-services.json`/`GoogleService-Info.plist`), so this is
  historical identity, not just a cosmetic display name. The macOS/iOS
  `PRODUCT_NAME` (the actual `.app` file name) was renamed, since that's
  purely cosmetic and unrelated to the bundle identifier.

## License

MIT -- see [LICENSE](LICENSE).
