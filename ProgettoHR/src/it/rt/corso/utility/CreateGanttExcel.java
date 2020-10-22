package it.rt.corso.utility;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;


public class CreateGanttExcel {
	
	public static HSSFWorkbook createWorkbook(HSSFWorkbook wb) throws IOException{
		
		
		HSSFSheet sheet = wb.createSheet();
		
		writeHeadersGantt(wb, sheet);
		
		return wb;
		
	}
	
	private static void writeHeadersGantt(HSSFWorkbook workbook, HSSFSheet sheet) {
		HSSFRow header = sheet.createRow(0);
        HSSFCell headerCell = header.createCell(0);
        headerCell.setCellValue("Testing");
	}
	
	/**
	 * 
	 * Create a fileName String appending the today date String to the file name.
	 * 
	 * @return the file name with today date
	 *  
	 *  */
	public static String getFileName() {
		
		String name = "Gantt";
		
		Date todayDate = new Date();
		
		SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd-MM-yyyy");
		String date = DATE_FORMAT.format(todayDate);
		
		date.replaceAll("-", "");
		
		return name.concat(date);
	}
	
}
