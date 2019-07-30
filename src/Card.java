
public class Card {
	public static enum Suit {
		SPADE, HEART, DIAMOND, CLUB
	};

	public static enum Rank {
		ACE(1), TWO(2), THREE(3), FOUR(4), FIVE(5), SIX(6), SEVEN(7), EIGHT(8), NINE(9),
		TEN(10), JACK(10), QUEEN(10), KING(10);

		private final int rankVal;
		Rank(int value) {
			this.rankVal = value;
		}
	};

	private Suit suit;
	private Rank rank;

	public Card (Suit s, Rank r) {
		this.suit = s;
		this.rank = r;
	}

	public Card (int s_index, int r_index) {
		this.suit = Suit.values()[s_index];
		this.rank = Rank.values()[r_index];
	}

	public String getSuit() {
		return(suit.name());
	}

	public String getRank() {
		return(rank.name());
	}

	public int getRankValue() {
		return(rank.rankVal);
	}

	public String getInfo() {
		return (this.getSuit() + "-" + this.getRank() + "-" + this.getRankValue());
	}

	public String getShortInfo() {
		String r_str;
		if (this.rank == Rank.ACE || this.rank == Rank.KING || this.rank == Rank.QUEEN || this.rank == Rank.JACK) {
			r_str = String.valueOf(this.getRank().charAt(0));
		} else if (this.rank == Rank.TEN) {
			r_str = "10";
		} else {
			r_str = String.valueOf(this.getRankValue());
		}
		return (this.getSuit().charAt(0) + r_str);
	}
}