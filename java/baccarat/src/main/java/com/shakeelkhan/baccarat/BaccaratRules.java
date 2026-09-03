package com.shakeelkhan.baccarat;

/**
 * Standard baccarat tableau rules, extracted so they have one
 * implementation and can be unit-tested directly instead of only
 * indirectly through full-shoe statistical simulation. Game and
 * Baccarat both had their own copy of this logic; this replaces both.
 */
public final class BaccaratRules {

	private BaccaratRules() {
	}

	/** A two-card total of 8 or 9 is a "natural" -- no third card is drawn by either hand. */
	public static boolean isNatural(int twoCardScore) {
		return twoCardScore == 8 || twoCardScore == 9;
	}

	/** Player draws a third card on a two-card total of 0-5, stands on 6-7. */
	public static boolean playerDrawsThirdCard(int playerTwoCardScore) {
		return playerTwoCardScore <= 5;
	}

	/**
	 * When the player stood (didn't draw a third card), banker draws on a
	 * two-card total of 0-5, same threshold as the player's own rule.
	 */
	public static boolean bankerDrawsWhenPlayerStood(int bankerTwoCardScore) {
		return bankerTwoCardScore <= 5;
	}

	/**
	 * When the player drew a third card, whether banker draws depends on
	 * both banker's own two-card total and the digit value of the
	 * player's third card (ten/jack/queen/king count as 0 here, same as
	 * a real baccarat tableau -- NOT the 10 that Card.getRankValue()
	 * returns for two-card-total purposes).
	 */
	public static boolean bankerDrawsAfterPlayerThirdCard(int playerThirdCardRankValue, int bankerTwoCardScore) {
		int digit = playerThirdCardRankValue % 10;
		if (digit == 0 || digit == 1) {
			return bankerTwoCardScore <= 3;
		} else if (digit == 2 || digit == 3) {
			return bankerTwoCardScore <= 4;
		} else if (digit == 4 || digit == 5) {
			return bankerTwoCardScore <= 5;
		} else if (digit == 6 || digit == 7) {
			return bankerTwoCardScore <= 6;
		} else if (digit == 8) {
			return bankerTwoCardScore <= 2;
		} else if (digit == 9) {
			return bankerTwoCardScore <= 3;
		}
		return false;
	}
}
