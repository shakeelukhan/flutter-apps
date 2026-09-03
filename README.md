# thebettingapp

> You're on `app/thebettingapp` -- one of the independent, self-contained
> project branches in the `flutter-apps` archive repo (see that repo's
> `main` branch for the full index).

A Flutter mobile UI for the same betting-system experiments as
[baccarat](../../tree/app/baccarat) (a Java prototype in this same
archive): a coin-toss game, a Martingale-style bet-progression calculator
("Martingdale" -- yes, misspelled in the original source, left as-is,
see below), and a simulation screen that runs flat/Martingale/
Martingale-variant strategies against randomized outcomes and shows the
results.

Written 2019, last touched December 2019 (the final commit is literally
titled "Broken changes").

## This does NOT build on a current Flutter/Dart SDK

Verified directly, not assumed:

```
$ flutter pub get
Resolving dependencies...
The lower bound of "sdk: '>=2.1.0 <3.0.0'" must be 2.12.0'
or higher to enable null safety.

The current Dart SDK (3.13.2) only supports null safety.
```

Dart made null safety mandatory in 3.0. This app's `pubspec.yaml`
predates null safety entirely (2019), and every `.dart` file uses
pre-null-safety syntax throughout (nullable-by-default types, no `?`/`!`
anywhere). Reviving this would mean a real null-safety migration across
every file plus updating `shared_preferences` and `cupertino_icons` past
their pre-null-safety major versions -- not a quick fix, and not
something to guess at without a working toolchain to verify against
(this modernization pass has Flutter 3.47.2 / Dart 3.13.2 available, but
running the migration tool and manually verifying ~10 files' worth of
UI/state logic actually behaves the same afterward is a bigger job than
this archival pass is scoped for). This branch is preserved as-is:
buildable history and hygiene fixes only, source logic untouched.

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
```

## Notes on this archival pass

- **"Martingdale" is a typo for "Martingale"** that's used consistently
  as a class/file name throughout (`MartingdaleScreen`, the "Session"
  tab label, etc.). Left uncorrected rather than renamed: renaming
  touches multiple files' class names and imports, and there's no
  working build to verify the rename didn't break anything.
- **The final commit ("Broken changes", 2019-12-25)** actually looks
  like legitimate in-progress work, not an accidental break: it
  finishes wiring up `MartingdaleScreen2` (previously a copy-pasted file
  that still declared a duplicate `MartingdaleScreen` class -- would not
  have compiled) and generalizes `DataTableHelper.getDataTableRows()` to
  handle a variable number of columns instead of a hardcoded 3. The
  commit message suggests the author knew it wasn't finished. Not
  completed here, for the same reason as above.
- Repo hygiene fixed: a locally-committed root `.gradle/` build cache
  (6 files, a gap in the original `.gitignore` which only excluded
  `**/android/.gradle`) was removed and the gap closed.

## License

MIT -- see [LICENSE](LICENSE).
