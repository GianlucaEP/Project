package it.rt.corso.algoritmi;

import it.rt.corso.checkstring.CheckString;

public class Levnstein2 extends Levnstein{
	
	public Levnstein2(CheckString next) {
		super(next);
	}
	
	public Levnstein2() {
		super();
	}

	public boolean check(String input, String standard) {
		return (countDistance(input, standard) <= 2 ? true : false);

	}

}
