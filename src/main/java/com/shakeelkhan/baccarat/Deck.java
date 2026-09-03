package com.shakeelkhan.baccarat;

import java.util.ArrayList;
import java.util.concurrent.ThreadLocalRandom;

public class Deck {

	private ArrayList<Card> cards;
	private int top;

	public Deck() {

		cards = new ArrayList<Card>();

		for (int i = 0; i < 52; i++) {
			Card newCard = new Card(i / 13, i % 13);
			cards.add(newCard);
		}
		top = 0;
	}

	public Card draw() {

		if (top >= 52) {
			throw new IllegalStateException("deck is exhausted -- call shuffle() before drawing again");
		}
		return cards.get(top++);
	}

	public void shuffle() {

		Card temp;
		ThreadLocalRandom rng = ThreadLocalRandom.current();

		for (int i = 0; i < 52; i++) {
			int randomNum = rng.nextInt(52 - i);
			temp = cards.remove(randomNum);
			cards.add(temp);
		}

		top = 0;
	}

	public int cardsDrawn() {

		return top;
	}

	public void printDeck() {

		System.out.println();
		for (int i = 0; i < 52; i++) {
			System.out.print(" " + cards.get(i).getShortInfo());
		}
		System.out.println();
	}
}
