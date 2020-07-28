package it.rt.corso.algoritmi;

public class Levnstein3 extends Levnstein{
	
	public Levnstein3() {
	}

	public boolean check(String input, String standard) {
		return (countDistance(input, standard) <= 3 ? true : false);

	}
}
