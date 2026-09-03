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
  (rishtaaunty, thebettingapp, thepakistaniapp -- pending migration)
```

To share or work on one project in isolation, push its branch to a fresh
repo: `git push <remote> app/<name>:main` -- no extraction step needed,
since each branch was already born independent.

## Projects

| Project | Type | Branch | Folder on `main` | Status |
|---|---|---|---|---|
| baccarat | Java statistics tool | `app/baccarat` | `java/baccarat` | done -- modernized, bugs fixed, tested, CI added |
| rishtaaunty | Flutter app | -- | -- | planned, branch not created yet |
| thebettingapp | Flutter app | -- | -- | planned, branch not created yet |
| thepakistaniapp | Flutter app | -- | -- | planned, branch not created yet |

The three Flutter apps are legacy, pre-null-safety projects (Dart SDK
constraints from ~2018-2019, several now-abandoned packages). They're
being archived here for provenance and cleaned up for documentation/
hygiene, but are not being fully modernized to build on a current Flutter
SDK -- see each branch's own README once it exists for exactly what was
and wasn't done, and why.

`baccarat` (Java) got the fuller treatment (bug fixes, unit tests, CI)
since it has a real, locally-available toolchain to verify changes against
-- see [java/baccarat/README.md](java/baccarat/README.md) for details.

## License

MIT -- see each branch's own `LICENSE`.
