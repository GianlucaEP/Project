package it.rt.corso.algoritmi;

import java.util.Arrays;

import it.rt.corso.checkstring.CheckString;
import it.rt.corso.checkstring.CheckWithList;


public class Levnstein extends CheckWithList {
	
	public Levnstein(CheckString next) {
		super(next);
	}

	public Levnstein() {
		super();
	}

	//Levnstein
	public static int countDistance(String x, String y) {
		int[][] dp = new int[x.length() + 1][y.length() + 1];

		for (int i = 0; i <= x.length(); i++) {
			for (int j = 0; j <= y.length(); j++) {
				if (i == 0) {
					dp[i][j] = j;
				} else if (j == 0) {
					dp[i][j] = i;
				} else {
					dp[i][j] = min(dp[i - 1][j - 1] + costOfSubstitution(x.charAt(i - 1), y.charAt(j - 1)),
							dp[i - 1][j] + 1, dp[i][j - 1] + 1);
				}
			}
		}

		return dp[x.length()][y.length()];
	}

	public static int costOfSubstitution(char a, char b) {
		return a == b ? 0 : 1;
	}
	public static int min(int... numbers) {
		return Arrays.stream(numbers).min().orElse(Integer.MAX_VALUE);
	}
	
	public boolean check(String input, String standard) {
		return standard.contains(input);
	}
}