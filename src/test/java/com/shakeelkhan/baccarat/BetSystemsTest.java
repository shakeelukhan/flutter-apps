package com.shakeelkhan.baccarat;

import org.junit.jupiter.api.Test;

import java.util.Arrays;

import static org.junit.jupiter.api.Assertions.assertArrayEquals;
import static org.junit.jupiter.api.Assertions.assertDoesNotThrow;

class BetSystemsTest {

	private static final int W = 1;
	private static final int L = 0;

	@Test
	void openingStreakIsNotDoubleCountedOrOffByOne() {
		// W,W,W,L: a 3-win opening streak, then a loss. Must land at
		// winStreak[2] (index = length-1, matching simulate()'s print
		// loop labeling index i as "length i+1" -> prints as W3). Regression
		// test for the off-by-one Grok 4.6 (ai-nepo) found in the first fix
		// attempt for the original phantom-first-bet bug.
		int[][] streaks = BetSystems.computeStreaks(new int[] { W, W, W, L });
		int[] winStreak = streaks[0];
		int[] loseStreak = streaks[1];

		assertArrayEquals(new int[] { 0, 0, 1 }, Arrays.copyOfRange(winStreak, 0, 3));
		assertArrayEquals(new int[] { 0, 0, 0 }, Arrays.copyOfRange(loseStreak, 0, 3));
	}

	@Test
	void firstBetNeverProducesAPhantomStreakEntry() {
		// A single bet, W or L, must record nothing -- there's no streak
		// to speak of yet with only one data point.
		int[][] winOnly = BetSystems.computeStreaks(new int[] { W });
		assertArrayEquals(new int[100], winOnly[0]);
		assertArrayEquals(new int[100], winOnly[1]);

		int[][] loseOnly = BetSystems.computeStreaks(new int[] { L });
		assertArrayEquals(new int[100], loseOnly[0]);
		assertArrayEquals(new int[100], loseOnly[1]);
	}

	@Test
	void multipleStreaksAreEachRecordedAtTheirOwnLength() {
		// W,W,L,L,L,W: a 2-win streak, then a 3-loss streak, then a
		// still-open 1-win streak (not recorded -- matches original,
		// pre-review behavior of never flushing a trailing open streak).
		int[][] streaks = BetSystems.computeStreaks(new int[] { W, W, L, L, L, W });
		int[] winStreak = streaks[0];
		int[] loseStreak = streaks[1];

		assertArrayEquals(new int[] { 0, 1, 0, 0 }, Arrays.copyOfRange(winStreak, 0, 4));
		assertArrayEquals(new int[] { 0, 0, 1, 0 }, Arrays.copyOfRange(loseStreak, 0, 4));
	}

	@Test
	void doesNotDivideByZeroWhenEverySessionHitsTargetWithoutBetting() {
		// startingBalance >= target means the while loop in system() never
		// runs a single bet -- every session "hits target" with zero bets
		// placed, which used to divide totalHitTargetBetAmount (0) by
		// totalHitTargetBetCount (0) and throw ArithmeticException.
		BetSystems betSystems = new BetSystems();
		assertDoesNotThrow(() -> betSystems.system("martindale", /* startingBalance */ 500, 10, 5,
				/* target */ 100, 10, false));
	}

	@Test
	void doesNotDivideByZeroWhenEverySessionMissesTargetWithoutBetting() {
		// startingBalance < minBet means the while loop's guard fails
		// immediately -- every session "misses target" with zero bets
		// placed, hitting the equivalent divide-by-zero on the miss side.
		BetSystems betSystems = new BetSystems();
		assertDoesNotThrow(() -> betSystems.system("martindale", /* startingBalance */ 5, 10, 5,
				/* target */ 500, 10, false));
	}

	@Test
	void ordinarySessionsStillRunToCompletion() {
		BetSystems betSystems = new BetSystems();
		assertDoesNotThrow(() -> betSystems.system("martindale", 280, 10, 20, 500, 10, false));
	}
}
