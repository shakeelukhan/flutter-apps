import 'dart:math';

class GameHelper {
  int _betLoseProbability, _minBetSize;
  String results;
  bool isProcessing;
  var rng;

  // Constructor
  GameHelper(int betLoseProbability, int minBetSize) {
    _betLoseProbability = betLoseProbability;
    _minBetSize = minBetSize;
    results = "";
    isProcessing = false;
    rng = new Random();
  }

  simulate(String system, bool printGame, int balance, int goal,
      int simulationCount, int parts) {
    isProcessing = true;
    String resultsPartial = results;
    for (int unitSize = _minBetSize; unitSize <= balance; unitSize += 5) {
      String resultsRow = "";
      int winCount = 0;
      int totalWinBetCount = 0;
      String gameRow = "";
      for (int i = 0; i < simulationCount; i++) {
        int gameBalance = balance;
        int betCount = 0;
        int nextBetSize;
        int loseStreakValue = 0;
        results = resultsPartial + resultsRow + gameRow;

        if (printGame == true) {
          gameRow += "*";
        }
        while (_minBetSize <= gameBalance && gameBalance < goal) {
          if (system.toLowerCase() == "flat") {
            nextBetSize = unitSize;
          } else if (system.toLowerCase() == "mart") {
            nextBetSize = (loseStreakValue > 0) ? loseStreakValue : unitSize;
          } else if (system.toLowerCase() == "mart2") {
            nextBetSize = (loseStreakValue > 0) ? loseStreakValue : unitSize;
            double surplusExcludingBet =
                (gameBalance - nextBetSize - balance) / 1;
            surplusExcludingBet = surplusExcludingBet / parts;
            surplusExcludingBet -= surplusExcludingBet % 5;
            surplusExcludingBet =
                (surplusExcludingBet > 0) ? surplusExcludingBet : 0;
            nextBetSize += surplusExcludingBet.toInt();
          }
          //int balanceToGoal = goal - gameBalance;
          //nextBetSize = (nextBetSize > balanceToGoal) ? balanceToGoal : nextBetSize;
          nextBetSize = (nextBetSize > gameBalance) ? gameBalance : nextBetSize;
          if (nextBetSize < _minBetSize) {
            break;
          }

          int betWinStatus = (rng.nextInt(100) < _betLoseProbability) ? -1 : 1;
          gameBalance += betWinStatus * nextBetSize;
          if (betWinStatus < 0) {
            loseStreakValue += nextBetSize;
          } else {
            loseStreakValue = 0;
          }
          if (printGame == true) {
            gameRow += (nextBetSize * betWinStatus).toString() +
                "/" +
                gameBalance.toString() +
                " ";
          }
          betCount++;
        }
        winCount += (gameBalance >= goal) ? 1 : 0;
        totalWinBetCount += (gameBalance >= goal) ? betCount : 0;
        if (printGame == true) {
          gameRow += "\n";
        }
      }
      resultsRow = system.toUpperCase() +
          ": U\$=" +
          unitSize.toString() +
          " W=" +
          winCount.toString() +
          "(" +
          (100 * winCount / simulationCount).toStringAsPrecision(2) +
          "%) B#=" +
          (totalWinBetCount / winCount).toStringAsPrecision(2) +
          "\n";
      resultsPartial += resultsRow + gameRow;
    }
    isProcessing = false;
  }
}
