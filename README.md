# flutter-apps

> You're on `main` -- the combined index/browsing view. Each project's own
> README (with real setup/run instructions) lives on its own branch, not
> here. `main` merges every project branch into folders here so you can
> browse everything from one place, but it is not itself a buildable
> monorepo -- there's no single root build file covering everything, and
> the toolchains involved (Java, Dart/Flutter) don't share one anyway.

Archive of personal Flutter app prototypes, plus a Java statistics tool
that was early prototyping work for one of them. Each project is a fully
independent, self-contained branch (own manifest at branch root, own
history) -- go there to build/run it.

## Structure

```
java/
  baccarat/           <- app/baccarat
flutter/
  thebettingapp/      <- app/thebettingapp
  rishtaaunty/        <- app/rishtaaunty
  thepakistaniapp/    <- app/thepakistaniapp
```

To share or work on one project in isolation, push its branch to a fresh
repo: `git push <remote> app/<name>:main` -- no extraction step needed,
since each branch was already born independent.

## Projects

| Project | Type | Branch | Folder on `main` | Status |
|---|---|---|---|---|
| baccarat | Java statistics tool | `app/baccarat` | `java/baccarat` | done -- modernized, bugs fixed, tested, CI added |
| thebettingapp | Flutter app | `app/thebettingapp` | `flutter/thebettingapp` | done -- migrated to null safety, builds/runs (macOS + web verified), 1 real bug fixed |
| rishtaaunty | Flutter app | `app/rishtaaunty` | `flutter/rishtaaunty` | done -- BLoC layer rewritten to current API, 23 unused deps removed, null-safety migrated, builds/runs (macOS + web verified) |
| thepakistaniapp | Flutter app | `app/thepakistaniapp` | `flutter/thepakistaniapp` | done -- hardest of the 3 (real Firebase/Maps/webview migrations, not removable as dead code), 2 real bugs fixed, builds/runs (macOS + web verified) |

All four projects were legacy, pre-null-safety code (Dart SDK constraints
from ~2018-2019, several now-abandoned or breaking-API-changed
dependencies) -- all originally verified to fail to build outright
against a real, locally-installed toolchain (Java 17/Maven for baccarat;
Flutter 3.47.2/Dart 3.13.2 for the three Flutter apps). Every one is now
modernized, with each fix verified against that real toolchain rather
than guessed at -- see each branch's own README for exactly what changed,
what was found along the way (several real bugs, and in rishtaaunty's/
thepakistaniapp's cases, large amounts of dead/unused code that didn't
need migrating at all), and what was verified.

No iOS Simulator runtime or Android SDK was available in this
environment, so macOS desktop and web are the verified run targets for
all three Flutter apps -- nothing about the code is platform-specific,
so mobile builds should work the same way given those toolchains.

## License

MIT -- see each branch's own `LICENSE`.
