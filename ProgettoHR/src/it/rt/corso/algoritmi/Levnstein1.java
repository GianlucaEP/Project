package it.rt.corso.algoritmi;

import it.rt.corso.checkstring.CheckString;

public class Levnstein1 extends Levnstein{
	
	public Levnstein1(CheckString next) {
		super(next);
	}
	
	public Levnstein1() {
		super();
	}

	public boolean check(String input, String standard) {
		return (countDistance(input, standard) <= 1 ? true : false);

	}
}
