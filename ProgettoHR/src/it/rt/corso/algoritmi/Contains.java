package it.rt.corso.algoritmi;

import it.rt.corso.checkstring.CheckString;
import it.rt.corso.checkstring.CheckWithList;

public class Contains extends CheckWithList{
	
	public Contains(CheckString next) {
		super(next);
	}
	
	public Contains() {
		super();
	}

	public boolean check(String input, String standard) {
		return standard.contains(input);
	}

}
