package it.rt.corso.algoritmi;

public class Levnstein2 extends Levnstein{
	
	public Levnstein2() {
	}

	public boolean check(String input, String standard) {
		return (countDistance(input, standard) <= 2 ? true : false);

	}

}
