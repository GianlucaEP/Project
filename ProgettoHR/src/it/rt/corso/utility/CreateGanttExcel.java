package it.rt.corso.utility;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import it.rt.corso.beans.Task;

/**
 * 
 * Utility class that creates Excel files and builds HTTP reponses containing said files in order to let the client download them.
 * 
 */
public abstract class CreateGanttExcel {
	
	private static List<Task> buildDataExcel(List<String> data) throws ParseException{
		
		  DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		  DateTimeFormatter newFormatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
		
		List<Task> taskList = new ArrayList<Task>();
		
		for(int i = 0;i < data.size();i++) {
			Task task = new Task();
			
			task.setNomeTask(data.get(i));
			i++;
			task.setNomeCandidiato(data.get(i));
			i++;
			LocalDate dataInizio = LocalDate.parse(data.get(i), formatter);
			String dataInizioString = dataInizio.format(newFormatter);
			dataInizio = LocalDate.parse(dataInizioString, newFormatter);
			task.setDataInizio(dataInizio);
			i++;
			LocalDate dataFine = LocalDate.parse(data.get(i), formatter);
			String dataFineString = dataFine.format(newFormatter);
			dataFine = LocalDate.parse(dataFineString, newFormatter);
			task.setDataFine(dataFine);
			i++;
			
			taskList.add(task);
		}
		
		return taskList;
	}

	/**
	 * 
	 * Creates and modify an <code>XSSFworkbook</code> type object from a given
	 * <code>XSSFWorkbook</code> type object.
	 * 
	 * @param workbook the given <code>XSSFWorkbook</code> that will be written on.
	 * @param data 
	 * 
	 * @return the written workbook.
	 * @throws ParseException 
	 * 
	 */
	public static XSSFWorkbook createWorkbook(XSSFWorkbook workbook, List<String> data) throws IOException, ParseException {
		
		List<Task> taskList = buildDataExcel(data);

		XSSFSheet sheet = workbook.createSheet();

		writeHeadersGantt(workbook, sheet, taskList);

		return workbook;

	}

	private static void writeHeadersGantt(XSSFWorkbook workbook, XSSFSheet sheet, List<Task> taskList) {
		XSSFRow header = sheet.createRow(0);
		XSSFCell headerCell = header.createCell(0);
		headerCell.setCellValue("Task name");
		
		headerCell = header.createCell(1);
		headerCell.setCellValue("Start");
		
		headerCell = header.createCell(2);
		headerCell.setCellValue("Finish");
		
		headerCell = header.createCell(3);
		headerCell.setCellValue("Duration");
		
		writeBodyGantt(workbook,sheet,taskList);
	}
	
	private static void writeBodyGantt(XSSFWorkbook workbook, XSSFSheet sheet, List<Task> taskList) {
		
		CellStyle cellStyle = workbook.createCellStyle();
		CreationHelper createHelper = workbook.getCreationHelper();
		cellStyle.setDataFormat(
		    createHelper.createDataFormat().getFormat("dd/MM/yyyy"));
		
		XSSFRow taskRow = sheet.createRow(1);
		XSSFCell headerCell = taskRow.createCell(0);		
		headerCell.setCellValue(taskList.get(0).getNomeTask());
		
		headerCell = taskRow.createCell(1);
		headerCell.setCellValue(taskList.get(0).getDataInizio());
		headerCell.setCellStyle(cellStyle);
		
		headerCell = taskRow.createCell(2);
		headerCell.setCellValue(taskList.get(0).getDataFine());
		headerCell.setCellStyle(cellStyle);
		
	}

	/**
	 * 
	 * Creates a fileName <code>String</code> appending the today date
	 * <code>String</code> to the file name.
	 * 
	 * @return the file name with today date.
	 * 
	 */
	public static String getFileName() {

		String name = "Gantt";

		Date todayDate = new Date();

		SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd-MM-yyyy");
		String date = DATE_FORMAT.format(todayDate);

		date = date.replaceAll("-", "");

		return name.concat(date);
	}

	/**
	 * 
	 * Instatiates a workbook and calls the
	 * {@link #downloadFile(File, HttpServletResponse) downloadFile} method to
	 * create an HTTP response with the excel file inside.
	 * 
	 * @param request  {@link HttpServletRequest HttpServletRequest} type parameter.
	 * 
	 * @param response {@link HttpServletResponse HttpServletResponse} type
	 *                 parameter.
	 * 
	 * @author s.schiavone
	 * @throws ParseException 
	 */
	public static void downloadExcel(HttpServletRequest request, HttpServletResponse response, List<String> data) throws IOException, ParseException {

		File file = new File(System.getProperty("upload.location"), getFileName() + ".xlsx");

		XSSFWorkbook workbook = new XSSFWorkbook();

		workbook = CreateGanttExcel.createWorkbook(workbook, data);

		FileOutputStream out = new FileOutputStream(file);
		workbook.write(out);
		downloadFile(file, response);
		out.close();
		workbook.close();

	}

	/**
	 * 
	 * Builds an HTTP response containing the gwiven Excel file UwU
	 * 
	 * @param file     the given Excel file to be included in the response
	 * 
	 * @param response {@link HttpServletResponse HttpServletResponse} type
	 *                 parameter
	 * 
	 */
	public static void downloadFile(File file, HttpServletResponse response) {
		try {
			response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
			response.addHeader("content-disposition", "attachment; filename=" + getFileName() + ".xlsx");
			response.setHeader("Pragma", "public");
			response.setHeader("Cache-Control", "no-store");
			response.addHeader("Cache-Control", "max-age=0");
			FileInputStream fin = null;
			try {
				fin = new FileInputStream(file);
			} catch (final FileNotFoundException e) {
				e.printStackTrace();
			}
			final int size = 1024;
			try {
				response.setContentLength(fin.available());
				final byte[] buffer = new byte[size];
				ServletOutputStream outputStream = null;

				outputStream = response.getOutputStream();
				int length = 0;
				while ((length = fin.read(buffer)) != -1) {
					outputStream.write(buffer, 0, length);
				}
				fin.close();
				outputStream.flush();
				outputStream.close();
			} catch (final IOException e) {
				e.printStackTrace();
			}
		} catch (final Exception ex) {
			ex.printStackTrace();
		}
	}

}
