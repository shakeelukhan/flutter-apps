

import java.util.ArrayList;
import java.util.Random;

public class Shoe {

	private ArrayList<Card> cards, cardsDrawn;
	private int numDecks = 8;

	public Shoe() {

		cards = new ArrayList<Card>();
		cardsDrawn = new ArrayList<Card>();

		for (int j = 0; j < numDecks; j++) {
			for (int i = 0; i < 52; i++) {
				Card newCard = new Card(i / 13, i % 13);
				cards.add(newCard);
			}
		}
	}

	public Card draw() {

		Card card = cards.remove(0);
		cardsDrawn.add(card);
		return card;
	}

	public void shuffle() {

		Card temp;

		while (cardsDrawn.size() != 0) {
			cards.add(cardsDrawn.remove(0));
		}

		int numCards = cards.size();
		Random rng = new Random();
		for (int i = 0; i < numCards; i++) {
			int randomNum = rng.nextInt(numCards - i);
			temp = cards.remove(randomNum);
			cards.add(temp);
		}

	}

	private void cutShoe(int cutIndex) {

		Card temp;

		for (int i = 0; i < cutIndex; i++) {
			temp = cards.remove(0);
			cards.add(temp);
		}
	}

	private void burnCardsForNewShoe() {

		Card temp = draw();
//		System.out.print("BURNING " + temp.getShortInfo() + " (x" + temp.getRankValue() + "):");
		for (int i = 0; i < temp.getRankValue(); i++) {
//			System.out.print(" " + draw().getShortInfo());
			draw();
		}
//		System.out.println("");
	}

	public void prepareNewShoe() {

//		info();

		shuffle();
//		info();

		Random rng = new Random();
		cutShoe(rng.nextInt(cards.size()));
//		info();

		burnCardsForNewShoe();
//s		info();
	}

	public int cardsLeft() {

		return cards.size();
	}

	public int cardsDrawn() {

		return cardsDrawn.size();
	}

	public void printCardsLeft() {

		System.out.print("SHOE (x" + cards.size() + "):");
		for (int i = 0; i < cards.size(); i++) {
			System.out.print(" " + cards.get(i).getShortInfo());
		}
		System.out.println();
	}

	public void printCardsDrawn() {

		System.out.print("DRAWN (x" + cardsDrawn.size() + "):");
		for (int i = 0; i < cardsDrawn.size(); i++) {
			System.out.print(" " + cardsDrawn.get(i).getShortInfo());
		}
		System.out.println();
	}

	public void info() {
		printCardsLeft();
		printCardsDrawn();
	}

}
