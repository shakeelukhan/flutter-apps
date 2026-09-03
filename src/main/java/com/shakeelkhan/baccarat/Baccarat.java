package com.shakeelkhan.baccarat;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

/**
 * Simplest end-to-end shoe simulator: deals hands under standard baccarat
 * tableau rules and tallies player/banker/tie counts across many shoes.
 * See {@link Game} for the richer version that also tracks streaks and
 * hand patterns.
 */
public class Baccarat {
	private final Shoe gameShoe;
	private int gameIndex;
	private int handIndex;
	private final ArrayList<char[]> gameData;
	private int bcount, pcount, tcount;

	public Baccarat() {
		gameShoe = new Shoe();
		gameIndex = -1;
		gameData = new ArrayList<char[]>();
		bcount = pcount = tcount = 0;
	}

	public void prepare() {
		gameIndex++;
		gameShoe.prepareNewShoe();
		gameShoe.printCardsLeft();
		handIndex = 0;

		gameData.add(new char[104]);
		for (int i = 0; i < 104; i++) {
			gameData.get(gameIndex)[i] = 'X';
		}
	}

	/*
	 * Java method to sort Map in Java by value e.g. HashMap or Hashtable throw
	 * NullPointerException if Map contains null values It also sort values even if
	 * they are duplicates
	 */
	@SuppressWarnings("rawtypes")
	public static <K extends Comparable, V extends Comparable> Map<K, V> sortByValues(Map<K, V> map) {
		List<Map.Entry<K, V>> entries = new LinkedList<Map.Entry<K, V>>(map.entrySet());
		Collections.sort(entries, new Comparator<Map.Entry<K, V>>() {
			@SuppressWarnings("unchecked")
			public int compare(Entry<K, V> o1, Entry<K, V> o2) {
				return o1.getValue().compareTo(o2.getValue());
			}
		});
		Map<K, V> sortedMap = new LinkedHashMap<K, V>();

		for (Map.Entry<K, V> entry : entries) {
			sortedMap.put(entry.getKey(), entry.getValue());
		}

		return sortedMap;
	}

	public char playHand() {
		int player_score = 0, banker_score = 0;
		Card temp;

		player_score += gameShoe.draw().getRankValue();
		banker_score += gameShoe.draw().getRankValue();
		player_score += gameShoe.draw().getRankValue();
		banker_score += gameShoe.draw().getRankValue();
		player_score = player_score % 10;
		banker_score = banker_score % 10;

		if (player_score <= 7 && banker_score <= 7) {
			if (player_score <= 5) {
				temp = gameShoe.draw();
				player_score += temp.getRankValue();

				if ((temp.getRankValue() == 0 || temp.getRankValue() == 1) && banker_score <= 3) {
					banker_score += gameShoe.draw().getRankValue();
				} else if ((temp.getRankValue() == 2 || temp.getRankValue() == 3) && banker_score <= 4) {
					banker_score += gameShoe.draw().getRankValue();
				} else if ((temp.getRankValue() == 4 || temp.getRankValue() == 5) && banker_score <= 5) {
					banker_score += gameShoe.draw().getRankValue();
				} else if ((temp.getRankValue() == 6 || temp.getRankValue() == 7) && banker_score <= 6) {
					banker_score += gameShoe.draw().getRankValue();
				} else if (temp.getRankValue() == 8 && banker_score <= 2) {
					banker_score += gameShoe.draw().getRankValue();
				} else if (temp.getRankValue() == 9 && banker_score <= 3) {
					banker_score += gameShoe.draw().getRankValue();
				}
			} else {
				if (banker_score <= 5) {
					banker_score += gameShoe.draw().getRankValue();
				}
			}
		}

		player_score = player_score % 10;
		banker_score = banker_score % 10;

		char winner;
		if (player_score > banker_score) {
			winner = 'P';
			pcount++;
		} else if (player_score < banker_score) {
			winner = 'B';
			bcount++;
		} else {
			winner = 'T';
			tcount++;
		}

		return (winner);
	}

	public void playShoe(int min) {
		char prev, curr;
		prev = curr = 'X';

		System.out.print("GAME:");
		while (gameShoe.cardsLeft() >= min) {

			curr = playHand();
			gameData.get(gameIndex)[handIndex] = curr;

			if (prev != curr && curr != 'T')
				System.out.print(" ");
			System.out.print(curr);

			handIndex++;
			prev = curr;
		}
		System.out.println();
	}

	public int getBankerCount() {
		return bcount;
	}

	public int getPlayerCount() {
		return pcount;
	}

	public int getTieCount() {
		return tcount;
	}

	public static void main(String[] args) {
		Baccarat baccarat = new Baccarat();
		for (int i = 0; i < 10000; i++) {
			baccarat.prepare();
			baccarat.playShoe(6);
		}
		int allcount = baccarat.getBankerCount() + baccarat.getPlayerCount() + baccarat.getTieCount();
		System.out.println("b=" + baccarat.getBankerCount() + "(" + 100 * baccarat.getBankerCount() / allcount + "%)"
				+ " p=" + baccarat.getPlayerCount() + "(" + 100 * baccarat.getPlayerCount() / allcount + "%)" + " t="
				+ baccarat.getTieCount() + "(" + 100 * baccarat.getTieCount() / allcount + "%)");
	}
}
