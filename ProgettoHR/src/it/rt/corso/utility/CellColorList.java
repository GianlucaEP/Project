package it.rt.corso.utility;

import java.util.List;

import org.apache.poi.ss.usermodel.IndexedColors;

public class CellColorList {
	private static List<Short> cellColorList; 
	
	protected static List<Short> createCellColorList(){
		cellColorList.add(IndexedColors.RED.getIndex());
		cellColorList.add(IndexedColors.GREEN.getIndex());
		cellColorList.add(IndexedColors.BLUE.getIndex());
		cellColorList.add(IndexedColors.ORANGE.getIndex());
		cellColorList.add(IndexedColors.YELLOW.getIndex());
		cellColorList.add(IndexedColors.AQUA.getIndex());
		cellColorList.add(IndexedColors.ROSE.getIndex());
		cellColorList.add(IndexedColors.BRIGHT_GREEN.getIndex());
		cellColorList.add(IndexedColors.LAVENDER.getIndex());
		cellColorList.add(IndexedColors.RED1.getIndex());
		cellColorList.add(IndexedColors.SEA_GREEN.getIndex());
		cellColorList.add(IndexedColors.BLUE1.getIndex());
		cellColorList.add(IndexedColors.BROWN.getIndex());
		cellColorList.add(IndexedColors.BRIGHT_GREEN.getIndex());
		cellColorList.add(IndexedColors.ROYAL_BLUE.getIndex());
		
		return cellColorList;
	}
}
