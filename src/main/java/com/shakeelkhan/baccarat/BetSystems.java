package com.shakeelkhan.baccarat;

import java.util.Arrays;
import java.util.concurrent.ThreadLocalRandom;
import java.text.DecimalFormat;

public class BetSystems {
	int betLoseProbablyPercent;
	DecimalFormat df2;

	public BetSystems() {
		betLoseProbablyPercent = 53;
		df2 = new DecimalFormat("#.##");
	}

	public int makeBet() {
		if (ThreadLocalRandom.current().nextInt(100) < betLoseProbablyPercent) {
			return 0;
		} else {
			return 1;
		}
	}

	public void simulate(int numBets) {
		int betWinCount = 0, betLoseCount = 0;
		int streakCount = 0;
		int lastWinStatus = -1;
		int winStreak[] = new int[100];
		int loseStreak[] = new int[100];

		for (int i = 0; i < numBets; i++) {
			int bet = makeBet();
			if (bet == 1) {
				betWinCount += 1;
			} else {
				betLoseCount += 1;
			}
			if (lastWinStatus == -1) {
				// First bet has no prior outcome to compare against -- without
				// this, it always took the "streak changed" branch below and
				// logged a phantom length-1 streak for whichever outcome did
				// NOT happen on the first bet.
				lastWinStatus = bet;
			}
			if (lastWinStatus == bet) {
				streakCount++;
			} else {
				if (bet == 1) {
					loseStreak[streakCount]++;
				} else if (bet == 0) {
					winStreak[streakCount]++;
				}
				streakCount = 0;
			}
			lastWinStatus = bet;
		}
		System.out.println("CONSECUTIVE BETS (COUNT=" + numBets + ")");
		System.out.println("W=" + betWinCount + " L=" + betLoseCount + " betCount=" + (betWinCount + betLoseCount));
		for (int i = 0; i < 100; i++) {
			if (winStreak[i] != 0) {
				System.out.print("W" + (i + 1) + "=" + winStreak[i] + "("
						+ df2.format(100 * ((double) winStreak[i] / (double) (betWinCount + betLoseCount))) + "%) ");
			}
			if (loseStreak[i] != 0) {
				System.out.print("L" + (i + 1) + "=" + loseStreak[i] + "("
						+ df2.format(100 * ((double) loseStreak[i] / (double) (betWinCount + betLoseCount))) + "%) ");
			}
		}
		System.out.println();
	}

	public void system(String bettingSystem, int startingBalance, int minBet, int sessionCount, int target,
			int unitSize, boolean showGame, int parts, int[] betArray) {
		int totalWinStreak[] = new int[100];
		int totalLoseStreak[] = new int[100];

		int totalHitTargetSessionCount = 0;
		int totalHitTargetBetWinCount = 0;
		int totalHitTargetBetLoseCount = 0;
		int totalHitTargetBetAmount = 0;

		int totalMissTargetSessionCount = 0;
		int totalMissTargetBetWinCount = 0;
		int totalMissTargetBetLoseCount = 0;
		int totalMissTargetBetAmount = 0;

		int origBetArray[] = betArray;

		for (int i = 0; i < sessionCount; i++) {
			int betWinCount = 0;
			int betLoseCount = 0;
			int balance = startingBalance;
			int betAmount = -1;
			int lossValue = 0;
			int maxBalance = startingBalance;
			int lastWinStatus = -1;
			int streakCount = 0;
			int totalBetAmount = 0;
			betArray = origBetArray;

			if (showGame == true) {
				System.out.println();
			}

			while (balance >= minBet && balance < target) {
				if (bettingSystem.equalsIgnoreCase("martindale")) {
					if (lossValue == 0) {
						betAmount = unitSize;
					} else {
						if (lossValue <= balance) {
							betAmount = lossValue;
						} else {
							betAmount = balance;
						}
					}
				} else if (bettingSystem.equalsIgnoreCase("martindale2")) {
					if (lossValue == 0) {
						betAmount = unitSize;
					} else {
						if (lossValue <= balance) {
							betAmount = lossValue;
						} else {
							betAmount = balance;
						}
					}
					int surplus = balance - startingBalance;
					if (surplus > 0) {
						betAmount += surplus / parts;
						betAmount -= betAmount % 5;
					}
				} else if (bettingSystem.equalsIgnoreCase("betArray")) {
					int betIndex;
					if (lossValue > 0) {
						betIndex = 0;
					} else {
						betIndex = streakCount % betArray.length;
					}
					betAmount = unitSize * betArray[betIndex];
				} else if (bettingSystem.equalsIgnoreCase("labouchere")) {
					if (lastWinStatus == 1) {
						if (betArray.length <= 2) {
							betArray = origBetArray;
						} else {
							betArray = Arrays.copyOfRange(betArray, 1, (betArray.length - 1));
						}
					} else if (lastWinStatus == 0) {
						betArray = Arrays.copyOf(betArray, betArray.length + 1);
						int sum;
						if (betArray.length == 2) {
							sum = betArray[0];
						} else {
							sum = betArray[0] + betArray[betArray.length - 2];
						}
						betArray[betArray.length - 1] = sum;
					}
					if (betArray.length == 1) {
						betAmount = betArray[0];
					} else {
						betAmount = betArray[0] + betArray[betArray.length - 1];
					}
					betAmount = betAmount * unitSize;
					if (betAmount > balance) {
						betAmount = balance;
					}
				} else if (bettingSystem.equalsIgnoreCase("proportional")) {
					betAmount = (balance / parts);
					betAmount -= betAmount % 5;
					if (betAmount < minBet) {
						betAmount = minBet;
					}
				}
				if (balance < minBet) {
					break;
				}
				int bet = makeBet();
				if (bet == 1) {
					betWinCount += 1;
					balance += betAmount;
					lossValue = 0;
					if (showGame == true) {
						System.out.print("WIN-" + betAmount + "[" + balance + "] ");
					}
				} else {
					betLoseCount += 1;
					balance -= betAmount;
					lossValue += betAmount;
					if (showGame == true) {
						System.out.print("LOST-" + betAmount + "[" + balance + "] ");
					}
				}
				totalBetAmount += betAmount;
				if (balance > maxBalance) {
					maxBalance = balance;
				}
				if (lastWinStatus == -1) {
					lastWinStatus = bet;
				}
				if (lastWinStatus == bet) {
					streakCount++;
					if (!(balance >= minBet && balance < target)) {
						if (bet == 0) {
							totalLoseStreak[streakCount]++;
						} else if (bet == 1) {
							totalWinStreak[streakCount]++;
						}
					}
				} else {
					if (bet == 1) {
						totalLoseStreak[streakCount]++;
					} else if (bet == 0) {
						totalWinStreak[streakCount]++;
					}
					streakCount = 1;
				}
				lastWinStatus = bet;
			}
			if (balance >= target) {
				totalHitTargetSessionCount++;
				totalHitTargetBetWinCount += betWinCount;
				totalHitTargetBetLoseCount += betLoseCount;
				totalHitTargetBetAmount += totalBetAmount;
			} else {
				totalMissTargetSessionCount++;
				totalMissTargetBetWinCount += betWinCount;
				totalMissTargetBetLoseCount += betLoseCount;
				totalMissTargetBetAmount += totalBetAmount;
			}
		}
		int totalHitTargetBetCount = totalHitTargetBetWinCount + totalHitTargetBetLoseCount;
		int totalMissTargetBetCount = totalMissTargetBetWinCount + totalMissTargetBetLoseCount;
		System.out.println("\n" + bettingSystem.toUpperCase() + ": startingBalance=$" + startingBalance + " minBet=$"
				+ minBet + " sessions=" + sessionCount + " target=$" + target + " unitSize=$" + unitSize + " parts="
				+ parts + " betArray=" + Arrays.toString(origBetArray));
		if (totalHitTargetSessionCount != 0) {
			// A session can hit target with zero bets placed (e.g.
			// startingBalance already >= target), so totalHitTargetBetCount
			// can be 0 even though totalHitTargetSessionCount isn't.
			String avgBetAmount = totalHitTargetBetCount != 0
					? df2.format((totalHitTargetBetAmount / totalHitTargetBetCount))
					: "n/a";
			System.out.println("HitTarget: sessionCount=" + totalHitTargetSessionCount + "("
					+ df2.format(100 * ((double) totalHitTargetSessionCount / (double) sessionCount))
					+ "%) avgBetCount=" + df2.format((totalHitTargetBetCount / totalHitTargetSessionCount))
					+ " avgBetAmount=$" + avgBetAmount);
		}
		if (totalMissTargetSessionCount != 0) {
			String avgBetAmount = totalMissTargetBetCount != 0
					? String.valueOf(totalMissTargetBetAmount / totalMissTargetBetCount)
					: "n/a";
			System.out.println("MissTarget: sessionCount=" + totalMissTargetSessionCount + "("
					+ df2.format(100 * ((double) totalMissTargetSessionCount / (double) sessionCount))
					+ "%) avgBetCount=" + df2.format((totalMissTargetBetCount / totalMissTargetSessionCount))
					+ " avgBetAmount=$" + avgBetAmount);
		}
		int totalStreakCount = 0;
		for (int j = 0; j < 100; j++) {
			totalStreakCount += totalWinStreak[j];
			totalStreakCount += totalLoseStreak[j];
		}
		for (int j = 0; j < 100; j++) {
			if (totalWinStreak[j] != 0) {
				System.out.print("W" + j + "=" + totalWinStreak[j] + "("
						+ df2.format(100 * ((double) totalWinStreak[j] / (double) (totalStreakCount))) + "%) ");
			}
			if (totalLoseStreak[j] != 0) {
				System.out.print("L" + j + "=" + totalLoseStreak[j] + "("
						+ df2.format(100 * ((double) totalLoseStreak[j] / (double) (totalStreakCount))) + "%) ");
			}
		}
		System.out.println();
	}

	public void system(String bettingSystem, int startingBalance, int minBet, int sessionCount, int target,
			int unitSize, boolean showGame) {
		this.system(bettingSystem, startingBalance, minBet, sessionCount, target, unitSize, showGame, -1,
				new int[] { -1 });
	}

	public void system(String bettingSystem, int startingBalance, int minBet, int sessionCount, int target,
			int unitSize, boolean showGame, int parts) {
		this.system(bettingSystem, startingBalance, minBet, sessionCount, target, unitSize, showGame, parts,
				new int[] { -1 });
	}

	public void system(String bettingSystem, int startingBalance, int minBet, int sessionCount, int target,
			int unitSize, boolean showGame, int[] betArray) {
		this.system(bettingSystem, startingBalance, minBet, sessionCount, target, unitSize, showGame, -1, betArray);
	}

	public static void main(String[] args) {
		BetSystems betSystems = new BetSystems();
//        betSystems.simulate(100000)
		betSystems.system("martindale", 280, 10, 10000, 500, 10, false);
		betSystems.system("martindale", 280, 10, 10000, 500, 15, false);
		betSystems.system("martindale", 280, 10, 10000, 500, 20, false);
		betSystems.system("martindale", 280, 10, 10000, 500, 25, false);
		betSystems.system("martindale2", 280, 10, 10000, 500, 10, false, 4);
		betSystems.system("martindale2", 280, 10, 10000, 500, 15, false, 4);
		betSystems.system("martindale2", 280, 10, 10000, 500, 20, false, 4);
		betSystems.system("martindale2", 280, 10, 10000, 500, 25, false, 4);
		betSystems.system("betArray", 280, 10, 10000, 500, 10, false, -1, new int[] { 1, 3, 2, 4 });
		betSystems.system("betArray", 280, 10, 10000, 500, 15, false, -1, new int[] { 1, 3, 2, 4 });
		betSystems.system("betArray", 280, 10, 10000, 500, 20, false, -1, new int[] { 1, 3, 2, 4 });
		betSystems.system("betArray", 280, 10, 10000, 500, 25, false, -1, new int[] { 1, 3, 2, 4 });
		betSystems.system("betArray", 280, 10, 10000, 500, 10, false, -1, new int[] { 1, 3, 2, 6 });
		betSystems.system("betArray", 280, 10, 10000, 500, 15, false, -1, new int[] { 1, 3, 2, 6 });
		betSystems.system("betArray", 280, 10, 10000, 500, 20, false, -1, new int[] { 1, 3, 2, 6 });
		betSystems.system("betArray", 280, 10, 10000, 500, 25, false, -1, new int[] { 1, 3, 2, 6 });
		betSystems.system("labouchere", 280, 10, 10000, 500, 5, false, new int[] { 1, 1, 1, 1, 1, 1, 1 });
		betSystems.system("labouchere", 280, 10, 10000, 500, 5, false,
				new int[] { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 });
		betSystems.system("labouchere", 280, 10, 10000, 500, 10, false, new int[] { 1, 1, 2, 1, 1, 3, 1, 1, 1, 1 });
		betSystems.system("labouchere", 280, 10, 10000, 500, 20, false,
				new int[] { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 });
		betSystems.system("labouchere", 280, 10, 10000, 500, 10, false,
				new int[] { 3, 2, 2, 3, 1, 2, 1, 2, 2, 2, 1, 3, 2 });
		betSystems.system("labouchere", 280, 10, 10000, 500, 15, false,
				new int[] { 3, 2, 2, 3, 1, 2, 1, 2, 2, 2, 1, 3, 2 });
		betSystems.system("labouchere", 280, 10, 10000, 1000, 15, false,
				new int[] { 3, 2, 2, 3, 1, 2, 1, 2, 2, 2, 1, 3, 2 });
	}
}
