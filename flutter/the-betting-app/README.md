# the-betting-app

> You're on `app/the-betting-app` -- one of the independent, self-contained
> project branches in the `flutter-apps` archive repo (see that repo's
> `main` branch for the full index). The Dart package itself is named
> `the_betting_app` (underscores, not hyphens -- Dart package names can't
> contain hyphens); the hyphenated name is just this branch/repo path.

A Flutter mobile UI for the same betting-system experiments as
[baccarat](../../tree/app/baccarat) (a Java prototype in this same
archive): a coin-toss game, a Martingale-style bet-progression calculator
("Martingdale" -- yes, misspelled in the original source, left as-is,
see below), and a simulation screen that runs flat/Martingale/
Martingale-variant strategies against randomized outcomes and shows the
results.

Written 2019, last touched December 2019 (the final commit was literally
titled "Broken changes"). Since modernized to build and run on a current
Flutter SDK -- see below.

## This builds and runs on a current Flutter/Dart SDK

Verified directly, not assumed. `flutter pub get` originally failed:

```
$ flutter pub get
Resolving dependencies...
The lower bound of "sdk: '>=2.1.0 <3.0.0'" must be 2.12.0'
or higher to enable null safety.

The current Dart SDK (3.13.2) only supports null safety.
```

Migrated to null safety (SDK constraint bumped to `>=3.0.0 <4.0.0`,
`shared_preferences`/`cupertino_icons` bumped to current major versions,
every `.dart` file updated for sound null safety and a handful of
Flutter API changes -- see the git history on this branch for the
file-by-file breakdown). Real result, not just "it compiles":

```
$ flutter analyze         # 0 errors, 0 warnings (a handful of style-only infos)
$ flutter test            # 2/2 passing
$ flutter build macos     # ✓ Built build/macos/Build/Products/Debug/the_betting_app.app
$ flutter build web       # ✓ Built build/web
```

Both builds were actually launched, not just compiled -- `open` on the
macOS `.app` produced a running process. No iOS Simulator runtime or
Android SDK was available in this environment, so macOS desktop and web
are the verified targets here; nothing about the Dart/Flutter code is
platform-specific, so `flutter build ios`/`apk` should work the same way
given those toolchains.

One real bug surfaced by the migration: see "Notes" below.

## Structure

```
lib/
  main.dart                        entry point
  app.dart                         root widget, bottom-nav + tab menu wiring
  screens/
    settings/                      session/game/all settings screens
    session/
      simulation_screen.dart       runs GameHelper.simulate() for flat/
                                    mart/mart2 and displays results
      martingdale_screen.dart      Martingale bet-sequence calculator
      martingdale_screen2.dart     a variant of the above (see note below)
    game/
      cointoss_screen.dart         simple random coin-flip log
  utils/
    GameHelper.dart                 the actual betting-system simulation logic
    SettingsHelper.dart              shared_preferences-backed settings
    NavHelper.dart                   builds the tab/bottom-nav structure
    DataTableHelper.dart             generic DataTable row builder
    LoadingScreenHelper.dart         loading-state widget helper
test/
  widget_test.dart                  launches the app, checks the 3 tabs render
```

## Notes on this modernization pass

- **Real bug fixed**: `martingdale_screen.dart` read a settings key
  called `session.end_goal`, which is never set anywhere --
  `SettingsHelper` only defines `session.goal` (the same key
  `session_screen.dart`'s Goal field uses). Pre-null-safety, this
  silently read `null` and would have thrown the first time `_endGoal`
  was used in a comparison; null safety's static checking surfaced it
  immediately. Fixed to read `session.goal`.
- **"Martingdale" is a typo for "Martingale"** that's used consistently
  as a class/file name throughout (`MartingdaleScreen`, the "Session"
  tab label, etc.). Left uncorrected: renaming would touch multiple
  files' class names and imports for a purely cosmetic fix, unrelated
  to the migration.
- **The "Broken changes" commit (2019-12-25, the branch's last original
  commit)** actually looks like legitimate in-progress work, not an
  accidental break: it finishes wiring up `MartingdaleScreen2`
  (previously a copy-pasted file that still declared a duplicate
  `MartingdaleScreen` class -- would not have compiled) and generalizes
  `DataTableHelper.getDataTableRows()` to handle a variable number of
  columns instead of a hardcoded 3. Both are kept as-is; no further
  work was needed to make either one compile under null safety.
- Repo hygiene fixed: a locally-committed root `.gradle/` build cache
  (6 files) and a locally-committed `ios/Flutter/flutter_export_environment.sh`
  (a generated file whose own header says not to check it into version
  control -- it had another machine's absolute paths baked in) were
  both removed, with matching `.gitignore` rules added.

## License

MIT -- see [LICENSE](LICENSE).
