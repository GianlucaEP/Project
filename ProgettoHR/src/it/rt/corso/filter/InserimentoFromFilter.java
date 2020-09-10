package it.rt.corso.filter;

import java.util.Date;

public class InserimentoFromFilter {
	
	private static Date inserimentoFrom;

	public static Date getInserimentoFrom() {
		return inserimentoFrom;
	}

	public static void setInserimentoFrom(Date inserimentoFrom) {
		InserimentoFromFilter.inserimentoFrom = inserimentoFrom;
	}
	
}
