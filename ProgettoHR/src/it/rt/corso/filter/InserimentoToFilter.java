package it.rt.corso.filter;

import java.util.Date;

public class InserimentoToFilter{
	private static Date inserimentoTo;

	public static Date getInserimentoTo() {
		return inserimentoTo;
	}

	public static void setInserimentoTo(Date inserimentoTo) {
		InserimentoToFilter.inserimentoTo = inserimentoTo;
	}
}
