package com.shakeelkhan.baccarat;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

class ShoeTest {

	@Test
	void freshShoeHasEightDecks() {
		Shoe shoe = new Shoe();
		assertEquals(8 * 52, shoe.cardsLeft());
		assertEquals(0, shoe.cardsDrawn());
	}

	@Test
	void drawingMovesACardFromLeftToDrawn() {
		Shoe shoe = new Shoe();
		shoe.draw();
		assertEquals(8 * 52 - 1, shoe.cardsLeft());
		assertEquals(1, shoe.cardsDrawn());
	}

	@Test
	void shuffleReturnsDrawnCardsToPlay() {
		Shoe shoe = new Shoe();
		for (int i = 0; i < 10; i++) {
			shoe.draw();
		}
		assertEquals(8 * 52 - 10, shoe.cardsLeft());

		shoe.shuffle();

		assertEquals(8 * 52, shoe.cardsLeft());
		assertEquals(0, shoe.cardsDrawn());
	}

	@Test
	void prepareNewShoeBurnsAtLeastOneCard() {
		Shoe shoe = new Shoe();
		shoe.prepareNewShoe();
		// burnCardsForNewShoe() always draws the burn card itself, plus
		// its rank value in additional cards (rank value is >= 1).
		assertTrue(shoe.cardsDrawn() >= 2);
		assertEquals(8 * 52 - shoe.cardsDrawn(), shoe.cardsLeft());
	}
}
