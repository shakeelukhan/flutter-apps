package com.shakeelkhan.baccarat;

import java.util.ArrayList;
import java.util.Random;

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

		return cards.get(top++ % 52);
	}

	public void shuffle() {

		Card temp;
		Random rng = new Random();

		for (int i = 0; i < 52; i++) {
			int randomNum = rng.nextInt(52 - i);
			temp = cards.remove(randomNum);
			cards.add(temp);
		}

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
