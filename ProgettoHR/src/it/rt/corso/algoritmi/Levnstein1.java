package it.rt.corso.algoritmi;

public class Levnstein1 extends Levnstein{
	
	public Levnstein1() {
	}

	public boolean check(String input, String standard) {
		return (countDistance(input, standard) <= 1 ? true : false);

	}
}
