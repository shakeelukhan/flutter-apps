package com.shakeelkhan.baccarat;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;

class DeckTest {

	@Test
	void drawingAllFiftyTwoCardsSucceeds() {
		Deck deck = new Deck();
		for (int i = 0; i < 52; i++) {
			deck.draw();
		}
		assertEquals(52, deck.cardsDrawn());
	}

	@Test
	void drawingPastFiftyTwoThrowsInsteadOfWrapping() {
		Deck deck = new Deck();
		for (int i = 0; i < 52; i++) {
			deck.draw();
		}
		assertThrows(IllegalStateException.class, deck::draw);
	}

	@Test
	void shuffleResetsDrawPositionSoDrawingCanContinue() {
		Deck deck = new Deck();
		for (int i = 0; i < 52; i++) {
			deck.draw();
		}

		deck.shuffle();

		assertEquals(0, deck.cardsDrawn());
		deck.draw(); // must not throw
		assertEquals(1, deck.cardsDrawn());
	}
}
