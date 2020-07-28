package it.rt.corso.checkstring;

public abstract class CheckWithoutList extends CheckString {

	public CheckWithoutList(CheckString next) {
		super(next);
	}

	public CheckWithoutList() {
		super();
	}

	public final String checkstringchild(String input) {

		String standard = check(input);
		if (standard != null) {
			System.out.println("Parola trovata con l'algoritmo " + this.getClass().getSimpleName());
			return standard;
		}

		return null;

	}

	public abstract String check(String input);
}