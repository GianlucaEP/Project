package it.rt.corso.filter;

import java.util.Date;

public class InserimentoFromFilter {
	
	private static Date inserimentoFrom;
	
	public static boolean fromIsSelected = false;

	public static Date getInserimentoFrom() {
		return inserimentoFrom;
	}

	public static void setInserimentoFrom(Date inserimentoFrom) {
		InserimentoFromFilter.inserimentoFrom = inserimentoFrom;
	}

	public static boolean isFromIsSelected() {
		return fromIsSelected;
	}

	public static void setFromIsSelected(boolean fromIsSelected) {
		InserimentoFromFilter.fromIsSelected = fromIsSelected;
	}
	
}
