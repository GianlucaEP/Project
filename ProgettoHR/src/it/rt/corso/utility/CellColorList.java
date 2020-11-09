package it.rt.corso.utility;

import java.util.List;

import org.apache.poi.ss.usermodel.IndexedColors;

public class CellColorList {
	private static List<Short> cellColorList; 
	
	protected static List<Short> createCellColorList(){
		cellColorList.add(IndexedColors.AQUA.getIndex());
		
		return cellColorList;
	}
}
