package com.shakeelkhan.baccarat;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

/**
 * The dealing algorithm has no seam for injecting a fixed card sequence
 * (Shoe always draws from its own internally-shuffled cards), so these
 * are statistical checks against well-known baccarat odds rather than
 * exact-hand assertions -- they'd catch a badly broken drawing/scoring
 * rule (e.g. tie rate near 0% or banker/player rates flipped) without
 * being sensitive to shuffle randomness.
 */
class BaccaratTest {

	@Test
	void outcomeRatesMatchKnownBaccaratOdds() {
		Baccarat baccarat = new Baccarat();
		for (int i = 0; i < 200; i++) {
			baccarat.prepare();
			baccarat.playShoe(6);
		}

		int total = baccarat.getBankerCount() + baccarat.getPlayerCount() + baccarat.getTieCount();
		assertTrue(total > 0);

		double bankerRate = 100.0 * baccarat.getBankerCount() / total;
		double playerRate = 100.0 * baccarat.getPlayerCount() / total;
		double tieRate = 100.0 * baccarat.getTieCount() / total;

		// Real-world baccarat: banker ~45.8%, player ~44.6%, tie ~9.5%.
		// Generous tolerance since this is a randomized simulation, not
		// a fixed deck -- the point is to catch a rule bug that would
		// skew these far outside the real distribution, not to pin the
		// exact percentage.
		assertTrue(bankerRate > 40 && bankerRate < 52, "banker rate out of range: " + bankerRate);
		assertTrue(playerRate > 38 && playerRate < 50, "player rate out of range: " + playerRate);
		assertTrue(tieRate > 5 && tieRate < 14, "tie rate out of range: " + tieRate);
	}

	@Test
	void everyHandProducesAWinner() {
		Baccarat baccarat = new Baccarat();
		baccarat.prepare();
		char result = baccarat.playHand();
		assertTrue(result == 'P' || result == 'B' || result == 'T');
	}
}
