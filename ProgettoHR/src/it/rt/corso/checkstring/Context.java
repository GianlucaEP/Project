package it.rt.corso.checkstring;

public class Context {

	private CheckString strategia;

	public Context(CheckString strategia) {
		this.strategia = strategia;
	}

	public String trovaStringa(String input) {
		input = input.toUpperCase();

		return strategia.checkString(input);
	}

}