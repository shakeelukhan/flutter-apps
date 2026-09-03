package com.shakeelkhan.baccarat;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertDoesNotThrow;

class BetSystemsTest {

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
