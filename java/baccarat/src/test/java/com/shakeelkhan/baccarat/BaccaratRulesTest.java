package com.shakeelkhan.baccarat;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

/**
 * Direct truth-table coverage of the exact rule that was broken before
 * this class was extracted (Game/Baccarat both silently skipped the
 * banker's third-card draw whenever the player's third card was a ten
 * or face card, since getRankValue() returns 10 for those instead of
 * the tableau's expected digit value of 0).
 */
class BaccaratRulesTest {

	@Test
	void eightAndNineAreNatural() {
		assertTrue(BaccaratRules.isNatural(8));
		assertTrue(BaccaratRules.isNatural(9));
	}

	@Test
	void zeroThroughSevenAreNotNatural() {
		for (int score = 0; score <= 7; score++) {
			assertFalse(BaccaratRules.isNatural(score), "score " + score + " should not be natural");
		}
	}

	@Test
	void playerDrawsOnZeroThroughFiveOnly() {
		for (int score = 0; score <= 5; score++) {
			assertTrue(BaccaratRules.playerDrawsThirdCard(score), "player should draw on " + score);
		}
		for (int score = 6; score <= 7; score++) {
			assertFalse(BaccaratRules.playerDrawsThirdCard(score), "player should stand on " + score);
		}
	}

	@Test
	void bankerStandRuleWhenPlayerStoodMatchesPlayerRule() {
		for (int score = 0; score <= 5; score++) {
			assertTrue(BaccaratRules.bankerDrawsWhenPlayerStood(score));
		}
		for (int score = 6; score <= 7; score++) {
			assertFalse(BaccaratRules.bankerDrawsWhenPlayerStood(score));
		}
	}

	@Test
	void bankerDrawsOnZeroThroughTwoRegardlessOfThirdCard() {
		// Standard tableau: banker with 0-2 always draws a third card,
		// no matter what the player's third card was.
		for (int thirdCard = 1; thirdCard <= 10; thirdCard++) {
			for (int bankerScore = 0; bankerScore <= 2; bankerScore++) {
				assertTrue(BaccaratRules.bankerDrawsAfterPlayerThirdCard(thirdCard, bankerScore),
						"banker=" + bankerScore + " thirdCard=" + thirdCard);
			}
		}
	}

	@Test
	void bankerStandsOnSevenRegardlessOfThirdCard() {
		for (int thirdCard = 1; thirdCard <= 10; thirdCard++) {
			assertFalse(BaccaratRules.bankerDrawsAfterPlayerThirdCard(thirdCard, 7));
		}
	}

	@Test
	void tenJackQueenKingAreTreatedAsDigitZero() {
		// This is the exact bug that was fixed: a raw getRankValue() of 10
		// must NOT be compared literally -- it has to behave like digit 0.
		// Banker on 3 draws against digit 0/1, stands against digit 2+.
		assertTrue(BaccaratRules.bankerDrawsAfterPlayerThirdCard(10, 3), "10 (face/ten) must act like digit 0");
		assertTrue(BaccaratRules.bankerDrawsAfterPlayerThirdCard(1, 3), "ace must act like digit 1");
		assertFalse(BaccaratRules.bankerDrawsAfterPlayerThirdCard(10, 4), "digit 0 -> banker stands on 4");
	}

	@Test
	void fullBankerThirdCardTableau() {
		// [thirdCardDigit] -> max banker score that still draws
		int[] maxBankerScoreThatDraws = { 3, 3, 4, 4, 5, 5, 6, 6, 2, 3 };

		for (int digit = 0; digit <= 9; digit++) {
			// Use the digit itself as the raw rank value except where it
			// would collide with ten/face (digit 0 is represented by
			// rank value 10 in real play, but the function must treat a
			// raw 0 the same way since %10 of 10 and %10 of 0 are equal).
			int threshold = maxBankerScoreThatDraws[digit];
			for (int bankerScore = 0; bankerScore <= threshold; bankerScore++) {
				assertTrue(BaccaratRules.bankerDrawsAfterPlayerThirdCard(digit, bankerScore),
						"digit=" + digit + " banker=" + bankerScore + " should draw");
			}
			for (int bankerScore = threshold + 1; bankerScore <= 7; bankerScore++) {
				assertFalse(BaccaratRules.bankerDrawsAfterPlayerThirdCard(digit, bankerScore),
						"digit=" + digit + " banker=" + bankerScore + " should stand");
			}
		}
	}
}
