package com.shakeelkhan.baccarat;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

class CardTest {

	@Test
	void faceCardsAreWorthTen() {
		assertEquals(10, new Card(Card.Suit.SPADE, Card.Rank.JACK).getRankValue());
		assertEquals(10, new Card(Card.Suit.SPADE, Card.Rank.QUEEN).getRankValue());
		assertEquals(10, new Card(Card.Suit.SPADE, Card.Rank.KING).getRankValue());
		assertEquals(10, new Card(Card.Suit.SPADE, Card.Rank.TEN).getRankValue());
	}

	@Test
	void aceIsWorthOne() {
		assertEquals(1, new Card(Card.Suit.HEART, Card.Rank.ACE).getRankValue());
	}

	@Test
	void numberCardsMatchTheirFaceValue() {
		assertEquals(7, new Card(Card.Suit.CLUB, Card.Rank.SEVEN).getRankValue());
	}

	@Test
	void indexConstructorMatchesEnumOrdering() {
		// index 0 = SPADE, index 3 = FOUR -> matches Deck's i/13, i%13 scheme
		Card card = new Card(0, 3);
		assertEquals("SPADE", card.getSuit());
		assertEquals("FOUR", card.getRank());
		assertEquals(4, card.getRankValue());
	}

	@Test
	void shortInfoAbbreviatesFaceCardsAndTen() {
		assertEquals("SA", new Card(Card.Suit.SPADE, Card.Rank.ACE).getShortInfo());
		assertEquals("H10", new Card(Card.Suit.HEART, Card.Rank.TEN).getShortInfo());
		assertEquals("CJ", new Card(Card.Suit.CLUB, Card.Rank.JACK).getShortInfo());
		assertEquals("D7", new Card(Card.Suit.DIAMOND, Card.Rank.SEVEN).getShortInfo());
	}
}
