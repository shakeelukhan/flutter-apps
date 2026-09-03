package com.shakeelkhan.baccarat;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

public class Game {
	private Shoe gameShoe;
	private int gameIndex, handIndex, handIndexExclTie;
	private ArrayList<char[]> gameData;
	private ArrayList<char[]> gameDataExclTie;
	private ArrayList<int[][]> gameBets;
	private ArrayList<int[]> gameStats;
	int pstreak, bstreak, fstreak;

	private int patternMaxLength = 10;
	private HashMap<String, Integer> patternDataExclTie;
	private int[][] streakData;

	private int[][] betStats;
	private int betBankroll = 0;

	public Game() {
		gameShoe = new Shoe();
		gameIndex = -1;
		gameData = new ArrayList<char[]>();
		gameDataExclTie = new ArrayList<char[]>();
		gameBets = new ArrayList<int[][]>();
		gameStats = new ArrayList<int[]>();
		patternDataExclTie = new HashMap<String, Integer>();

		streakData = new int[3][35];
		for (int i = 0; i < 35; i++)
			streakData[0][i] = streakData[1][i] = streakData[2][i] = 0;
		betStats = new int[4][5];
		for (int i = 0; i < 5; i++)
			betStats[0][i] = betStats[1][i] = betStats[2][i] = 0;
	}

	public void prepare() {
		gameIndex++;
		gameShoe.prepareNewShoe();
		gameShoe.printCardsLeft();
		handIndex = handIndexExclTie = 0;

		gameData.add(new char[104]);
		gameDataExclTie.add(new char[104]);
		for (int i = 0; i < 104; i++) {
			gameData.get(gameIndex)[i] = 'X';
			gameDataExclTie.get(gameIndex)[i] = 'X';
		}

		gameStats.add(new int[7]);
		pstreak = bstreak = fstreak = 0;

		// [lastWinner,lastLoser,alternating,tbd][nextWinner/initial/min/max]
		gameBets.add(new int[5][9]);
		for (int i = 0; i < 5; i++) {
			gameBets.get(gameIndex)[i][0] = 'B';
			gameBets.get(gameIndex)[i][1] = 0;
			gameBets.get(gameIndex)[i][2] = gameBets.get(gameIndex)[i][3] = gameBets
					.get(gameIndex)[i][4] = gameBets.get(gameIndex)[i][5] = gameBets.get(gameIndex)[i][6] = betBankroll;
		}
		gameBets.get(gameIndex)[3][0] = 'X';
		gameBets.get(gameIndex)[4][0] = 'X';
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

		// LinkedHashMap will keep the keys in the order they are inserted
		// which is currently sorted on natural ordering
		Map<K, V> sortedMap = new LinkedHashMap<K, V>();

		for (Map.Entry<K, V> entry : entries) {
			sortedMap.put(entry.getKey(), entry.getValue());
		}

		return sortedMap;
	}
	// Read more:
	// http://javarevisited.blogspot.com/2012/12/how-to-sort-hashmap-java-by-key-and-value.html#ixzz358HOUXhN

	private void addStreakData(int streakp, int streakb, int streakf) {
		if (streakp > 0) {
			streakData[0][0]++;
			streakData[0][Math.min(streakp, streakData[0].length - 1)]++;
		}
		if (streakb > 0) {
			streakData[1][0]++;
			streakData[1][Math.min(streakb, streakData[1].length - 1)]++;
		}
		if (streakf > 0) {
			streakData[2][0]++;
			streakData[2][Math.min(streakf, streakData[2].length - 1)]++;
		}
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

		if (!(BaccaratRules.isNatural(player_score) || BaccaratRules.isNatural(banker_score))) {
			if (BaccaratRules.playerDrawsThirdCard(player_score)) {
				temp = gameShoe.draw();
				player_score += temp.getRankValue();

				if (BaccaratRules.bankerDrawsAfterPlayerThirdCard(temp.getRankValue(), banker_score)) {
					banker_score += gameShoe.draw().getRankValue();
				}
			} else {
				if (BaccaratRules.bankerDrawsWhenPlayerStood(banker_score)) {
					banker_score += gameShoe.draw().getRankValue();
				}
			}
		}
		player_score = player_score % 10;
		banker_score = banker_score % 10;

		char winner;
		if (player_score > banker_score) {
			winner = 'P';
		} else if (player_score < banker_score) {
			winner = 'B';
		} else {
			winner = 'T';
		}

		return (winner);
	}

	public void playShoe(int min) {
		char curr = 'X';

		System.out.print("GAME: ");
		while (gameShoe.cardsLeft() >= min) {

			curr = playHand();
			gameData.get(gameIndex)[handIndex] = curr;

			if (curr == 'T') {
				gameStats.get(gameIndex)[4]++;
			} else {
				if (curr == 'P') {
					gameStats.get(gameIndex)[0]++;
					gameStats.get(gameIndex)[1] = Math.max(++pstreak, gameStats.get(gameIndex)[1]);
					gameDataExclTie.get(gameIndex)[handIndexExclTie] = curr;
					if (bstreak != 0) {
						System.out.print(" ");
						addStreakData(0, bstreak, 0);
						bstreak = 0;
						gameStats.get(gameIndex)[5]++;
						fstreak++;
					} else {
						addStreakData(0, 0, fstreak);
						fstreak = 0;
					}
				} else if (curr == 'B') {
					gameStats.get(gameIndex)[2]++;
					gameStats.get(gameIndex)[3] = Math.max(++bstreak, gameStats.get(gameIndex)[3]);
					gameDataExclTie.get(gameIndex)[handIndexExclTie] = curr;
					if (pstreak != 0) {
						System.out.print(" ");
						addStreakData(pstreak, 0, 0);
						pstreak = 0;
						gameStats.get(gameIndex)[5]++;
						fstreak++;
					} else {
						addStreakData(0, 0, fstreak);
						fstreak = 0;
					}
				}
				gameStats.get(gameIndex)[6] = Math.max(fstreak, gameStats.get(gameIndex)[6]);

				String patternExclTie = "";
				for (int i = 1; i <= patternMaxLength; i++) {
					if ((handIndexExclTie - i + 1) >= 0) {
						patternExclTie = String.copyValueOf(gameDataExclTie.get(gameIndex), handIndexExclTie - i + 1,
								i);
						if (!patternDataExclTie.containsKey(patternExclTie)) {
							patternDataExclTie.put(patternExclTie, 1);
						} else {
							patternDataExclTie.put(patternExclTie, patternDataExclTie.get(patternExclTie) + 1);
						}
						if (!patternDataExclTie.containsKey(String.valueOf(i))) {
							patternDataExclTie.put(String.valueOf(i), 1);
						} else {
							patternDataExclTie.put(String.valueOf(i), patternDataExclTie.get(String.valueOf(i)) + 1);
						}
					}
				}
			}

			/*
			 * if (curr != 'T') { for (int i = 0; i < 1; i++) {
			 * 
			 * if (gameBets.get(gameIndex)[i][0] != 'X') { if (gameBets.get(gameIndex)[i][0]
			 * == curr) { gameBets.get(gameIndex)[i][2] += betUnit;
			 * gameBets.get(gameIndex)[i][4] +=
			 * (int)(betUnit*Math.pow(2,gameBets.get(gameIndex)[i][1]));
			 * gameBets.get(gameIndex)[i][1] = 0; gameBets.get(gameIndex)[i][7]++; } else {
			 * gameBets.get(gameIndex)[i][2] -= betUnit; gameBets.get(gameIndex)[i][4] -=
			 * (int)(betUnit*Math.pow(2,gameBets.get(gameIndex)[i][1]++));
			 * gameBets.get(gameIndex)[i][7] = 0; }
			 * 
			 * gameBets.get(gameIndex)[i][3] =
			 * Math.min(gameBets.get(gameIndex)[i][2],gameBets.get(gameIndex)[i][3]);
			 * gameBets.get(gameIndex)[i][5] =
			 * Math.min(gameBets.get(gameIndex)[i][4],gameBets.get(gameIndex)[i][5]);
			 * gameBets.get(gameIndex)[i][6] =
			 * Math.max(gameBets.get(gameIndex)[i][1],gameBets.get(gameIndex)[i][6]);
			 * gameBets.get(gameIndex)[i][8] =
			 * Math.max(gameBets.get(gameIndex)[i][7],gameBets.get(gameIndex)[i][8]); } }
			 * 
			 * // Follow winner gameBets.get(gameIndex)[0][0]=curr; // Follow loser if (curr
			 * == 'B') { gameBets.get(gameIndex)[1][0]='P'; } else if (curr == 'P'){
			 * gameBets.get(gameIndex)[1][0]='B'; } // Alternate if no tie if
			 * (gameBets.get(gameIndex)[2][0] == 'B') { gameBets.get(gameIndex)[2][0]='P'; }
			 * else { gameBets.get(gameIndex)[2][0]='B'; } // After consecutive
			 * banker/player wins if (bstreak == 2 || pstreak == 2) { if (curr == 'P') {
			 * gameBets.get(gameIndex)[3][0]='P'; gameBets.get(gameIndex)[4][0]='B'; } else
			 * { gameBets.get(gameIndex)[3][0]='B'; gameBets.get(gameIndex)[4][0]='P'; } }
			 * else { gameBets.get(gameIndex)[3][0]='X'; gameBets.get(gameIndex)[4][0]='X';
			 * } }
			 */
			System.out.print(curr);
			handIndex++;
			if (curr != 'T')
				handIndexExclTie++;
		}
		addStreakData(pstreak, bstreak, gameStats.get(gameIndex)[6]);
		/*
		 * String printStr = ""; int maxProfit = 0; int leastCost = 0; int losingStreak
		 * = 0; int winningStreak = 0; for (int i = 0; i < 5; i++) { printStr += " " +
		 * gameBets.get(gameIndex)[i][2] + "/" + gameBets.get(gameIndex)[i][3] + "/" +
		 * gameBets.get(gameIndex)[i][4] + "/" + gameBets.get(gameIndex)[i][5] + "/" +
		 * gameBets.get(gameIndex)[i][6] + "/" + gameBets.get(gameIndex)[i][8]; if
		 * (gameBets.get(gameIndex)[i][2] > gameBets.get(gameIndex)[maxProfit][2]) {
		 * maxProfit = i; } if (gameBets.get(gameIndex)[i][3] >
		 * gameBets.get(gameIndex)[leastCost][3]) { leastCost = i; } if
		 * (gameBets.get(gameIndex)[i][6] < gameBets.get(gameIndex)[losingStreak][6]) {
		 * losingStreak = i; } if (gameBets.get(gameIndex)[i][8] >
		 * gameBets.get(gameIndex)[winningStreak][8]) { winningStreak = i; } }
		 * betStats[0][maxProfit]++; betStats[1][leastCost]++;
		 * betStats[2][losingStreak]++; betStats[3][winningStreak]++;
		 */
		System.out.println("\n-> P=" + gameStats.get(gameIndex)[0] + " PMAX=" + gameStats.get(gameIndex)[1] + " B="
				+ gameStats.get(gameIndex)[2] + " BMAX=" + gameStats.get(gameIndex)[3] + " T="
				+ gameStats.get(gameIndex)[4] + " FLIP=" + gameStats.get(gameIndex)[5] + " FLIPMAX="
				+ gameStats.get(gameIndex)[6] + " HANDS=" + handIndex);
//			+ printStr);
	}

	public void printStats() {
		/*
		 * System.out.println("\n-> " + " M.PROFIT=" + betStats[0][0] + "," +
		 * betStats[0][1] + "," + betStats[0][2] + "," + betStats[0][3] + "," +
		 * betStats[0][4] + " L.COST=" + betStats[1][0] + "," + betStats[1][1] + "," +
		 * betStats[1][2] + "," + betStats[1][3] + "," + betStats[1][4] + " L.STREAK=" +
		 * betStats[2][0] + "," + betStats[2][1] + "," + betStats[2][2] + "," +
		 * betStats[2][3] + "," + betStats[2][4] + " W.STREAK=" + betStats[3][0] + "," +
		 * betStats[3][1] + "," + betStats[3][2] + "," + betStats[3][3] + "," +
		 * betStats[3][4]);
		 */
		int streakCount = 0;
		DecimalFormat df = new DecimalFormat();
		df.setMaximumFractionDigits(2);
		System.out.print("\n P.STREAK:");
		for (int i = 1; i < 25; i++) {
			streakCount = streakData[0][i];
			if (streakCount != 0)
				System.out.print(" " + i + "=" + streakCount + "("
						+ df.format((float) 100 * streakCount / streakData[0][0]) + "%)");
		}
		System.out.print("\n B.STREAK:");
		for (int i = 1; i < 25; i++) {
			streakCount = streakData[1][i];
			if (streakCount != 0)
				System.out.print(" " + i + "=" + streakCount + "("
						+ df.format((double) 100 * streakCount / streakData[1][0]) + "%)");
		}
		System.out.print("\n FLIP.STREAK:");
		for (int i = 1; i < 25; i++) {
			streakCount = streakData[2][i];
			if (streakCount != 0)
				System.out.print(" " + i + "=" + streakCount + "("
						+ df.format((double) 100 * streakCount / streakData[2][0]) + "%)");
		}

		String printStr;
		Map<String, Integer> sortedPatternStatsExclTie = sortByValues(patternDataExclTie);
		for (int i = 0; i < patternMaxLength; i++) {
			printStr = "";
			System.out.println();
			Iterator<String> patternsExclTie = sortedPatternStatsExclTie.keySet().iterator();
			while (patternsExclTie.hasNext()) {
				String patternExclTie = patternsExclTie.next();
				if (patternExclTie.length() == (i + 1)
						&& (patternExclTie.startsWith("P") || patternExclTie.startsWith("B"))) {
					printStr = " " + patternExclTie + "=" + patternDataExclTie.get(patternExclTie) + "("
							+ df.format((double) 100 * patternDataExclTie.get(patternExclTie)
									/ patternDataExclTie.get(String.valueOf(i + 1)))
							+ "%)" + printStr;
				}
			}
			System.out.print(printStr);
		}
	}

	public void playShoes() {
		for (int i = 0; i < 1; i++) {
			prepare();
			playShoe(6);
		}
		printStats();
	}

	public static void main(String[] args) {
		Game game = new Game();
		game.playShoes();
	}
}
