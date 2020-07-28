package it.rt.corso.algoritmi;

import it.rt.corso.checkstring.CheckString;

public class Levnstein3 extends Levnstein{
	
	public Levnstein3(CheckString next) {
		super(next);
	}

	public Levnstein3() {
		super();
	}

	public boolean check(String input, String standard) {
		return (countDistance(input, standard) <= 3 ? true : false);

	}
}
