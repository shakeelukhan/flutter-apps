# baccarat

> You're on `app/baccarat` -- one of the independent, self-contained project
> branches in the `flutter-apps` archive repo (see that repo's `main` branch
> for the full index). This branch builds and tests on its own; no other
> branch or folder is required.

A baccarat shoe simulator and betting-system backtester. Deals hands under
standard casino tableau rules across an 8-deck continuous shoe, and
separately backtests several betting progressions (Martingale-style,
Labouchere, proportional, a fixed bet-array cycle) against simulated outcomes
to see how their bankroll curves behave over many sessions. Originally
written as prototyping/statistics work while building `thebettingapp`
(a Flutter app being migrated into a later branch of this same archive).

This is a statistics/research tool, not casino-facing automation -- nothing
here talks to a real game or place a real bet anywhere.

## Structure

```
src/main/java/com/shakeelkhan/baccarat/
  Card.java             a single playing card (suit, rank, value)
  Deck.java             a single 52-card deck (currently unused -- Game
                         and Baccarat both draw from Shoe instead)
  Shoe.java             an 8-deck continuous shoe: draw, shuffle, cut,
                         and the standard pre-shoe burn procedure
  BaccaratRules.java    the tableau draw/stand rules, extracted so both
                         Game and Baccarat share one implementation
  Game.java             richer simulator: streak tracking, hand-pattern
                         frequency stats, has a main() entry point
  Baccarat.java         simplest simulator: just deals hands and tallies
                         player/banker/tie counts, has a main() entry point
  BetSystems.java        betting-system backtester, has a main() entry point
src/test/java/com/shakeelkhan/baccarat/
  unit tests for the above
```

`Game` and `Baccarat` are two independent simulators with overlapping
purpose (a richer one and a minimal one) -- both are kept since they're
each runnable on their own and neither is a strict superset of the other's
output.

## Building and running

Requires Java 17 and Maven.

```
mvn test          # run the unit tests
mvn compile        # just compile
mvn package        # build target/baccarat.jar
```

Each of `Game`, `Baccarat`, and `BetSystems` has its own `main()`:

```
mvn compile
java -cp target/classes com.shakeelkhan.baccarat.Game
java -cp target/classes com.shakeelkhan.baccarat.Baccarat
java -cp target/classes com.shakeelkhan.baccarat.BetSystems
```

Or after `mvn package`:

```
java -cp target/baccarat.jar com.shakeelkhan.baccarat.Baccarat
```

(The jar's manifest points its default entry point at `Game`, so
`java -jar target/baccarat.jar` runs that one specifically.)

All three just print to stdout -- there's no persisted output format.

## Notes on this modernization pass

This started as ad hoc source with no build tool, a committed IntelliJ
project and compiled `.class` files, and zero tests. Two independent model
reviews (Gemini and Grok, via a multi-agent review pass) plus a manual
read-through found and fixed several real bugs along the way, most notably:

- **Banker's third-card draw rule was wrong.** `Card.getRankValue()`
  returns 10 for ten/jack/queen/king (correct for two-card totals, which get
  `%10`'d), but the third-card draw table compared that raw value against
  0-9 directly -- so whenever the player's third card was a ten or face
  card, the banker never drew, regardless of its own score. This skewed
  every simulated shoe's outcome distribution away from real baccarat odds.
  See `BaccaratRulesTest` for a full truth-table regression test.
- `Deck.draw()` silently wrapped past 52 cards instead of signaling
  exhaustion (Deck is currently unused, but the bug is real).
- `BetSystems.system()` divided by zero when a session hit/missed its
  target without placing a single bet (e.g. starting balance already past
  target).
- A streak-tracking bug in `Game` that read stale instance fields instead
  of the parameters it was passed, corrupting its own streak-length
  histogram.
- Heavy reliance on brand-new `new Random()` instances instead of a shared
  `ThreadLocalRandom`.

None of this changes what the tool is for -- it's still the same
statistics experiment, just correctly implemented and with test coverage
that would catch a regression on any of the above.

## License

MIT -- see [LICENSE](LICENSE).
