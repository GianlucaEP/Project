package it.rt.corso.algoritmi;

import it.rt.corso.checkstring.CheckString;
import it.rt.corso.checkstring.CheckWithList;

public class Contained extends CheckWithList{
	
	public Contained(CheckString next) {
		super(next);
	}
	
	public Contained() {
		super();
	}

	public boolean check(String input, String standard) {
		return input.contains(standard);
	}
		
}
