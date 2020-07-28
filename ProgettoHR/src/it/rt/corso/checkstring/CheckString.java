package it.rt.corso.checkstring;

import it.rt.corso.DAO.SinonimoDAO;
import it.rt.corso.DAOImpl.SinonimoDAOImpl;
import it.rt.corso.beans.Sinonimo;

public abstract class CheckString {

	protected CheckString next;

	public CheckString(CheckString next) {
		this.next = next;
	}

	public CheckString() {
		this.next = null;
	}

	public final String checkString(String input) {
		SinonimoDAO sinonimoDAO = new SinonimoDAOImpl();

		String standard = checkstringchild(input);
		
		if (standard != null) {
			System.out.println("Parola trovata con l'algoritmo " + this.getClass().getSimpleName());
			return standard;
		}
		
		if (next == null) {
			
			Sinonimo sinonimo = new Sinonimo();
			
			sinonimo.setSinonimo(input);
			sinonimoDAO.inserisci(sinonimo);
			return null;

		} else
			return next.checkString(input);
	}

	public abstract String checkstringchild(String input);
}
