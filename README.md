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
  thepakistaniapp/    <- app/thepakistaniapp
  rishtaaunty/        <- app/rishtaaunty
```

To share or work on one project in isolation, push its branch to a fresh
repo: `git push <remote> app/<name>:main` -- no extraction step needed,
since each branch was already born independent.

## Projects

| Project | Type | Branch | Folder on `main` | Status |
|---|---|---|---|---|
| baccarat | Java statistics tool | `app/baccarat` | `java/baccarat` | done -- modernized, bugs fixed, tested, CI added |
| thebettingapp | Flutter app | `app/thebettingapp` | `flutter/thebettingapp` | archived -- hygiene + docs only, does not build on current Flutter |
| thepakistaniapp | Flutter app | `app/thepakistaniapp` | `flutter/thepakistaniapp` | archived -- docs only, does not build on current Flutter |
| rishtaaunty | Flutter app | `app/rishtaaunty` | `flutter/rishtaaunty` | archived -- hygiene + docs only, does not build on current Flutter |

The three Flutter apps are legacy, pre-null-safety projects (Dart SDK
constraints from ~2018-2019, several now-abandoned or breaking-API-changed
packages). Verified directly with a real Flutter 3.47.2 / Dart 3.13.2
install that `flutter pub get` fails on all three (`sdk: '>=2.x <3.0.0'`
predates Dart's mandatory null safety). They're archived here for
provenance and cleaned up for documentation/hygiene, but were deliberately
not fully modernized (that would mean a real null-safety migration plus
replacing several now-abandoned/breaking-changed packages per app,
unverifiable as "still correct" without extensive manual re-testing) --
see each branch's own README for exactly what that would take per app,
ordered roughly easiest to hardest: `thebettingapp` < `rishtaaunty` ≈
`thepakistaniapp`.

`baccarat` (Java) got the fuller treatment (bug fixes, unit tests, CI)
since it has a real, locally-available toolchain to verify changes against
-- see [java/baccarat/README.md](java/baccarat/README.md) for details.

## License

MIT -- see each branch's own `LICENSE`.
