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
import java.time.temporal.ChronoUnit;
import java.time.temporal.TemporalAdjusters;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.ss.util.CellUtil;
import org.apache.poi.ss.util.RegionUtil;
import org.apache.poi.xssf.usermodel.DefaultIndexedColorMap;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFColor;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import it.rt.corso.beans.Task;

/**
 * 
 * Utility class that creates Excel files and builds HTTP reponses containing
 * said files in order to let the client download them.
 * 
 */
public abstract class CreateGanttExcel {

	private static LocalDate startingDate;
	private static LocalDate finishingDate;
	private static long daysBetween;

	/**
	 * 
	 * Build <code>Task</code> type objects from a given String.
	 * 
	 * @param data String that have to be worked in order to obtain the
	 *             <code>Task</code> objects
	 * 
	 * @return A List of <code>Task</code> type objects.
	 * 
	 */
	private static List<Task> buildDataExcel(List<String> data) throws ParseException {

		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		DateTimeFormatter newFormatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");

		List<Task> taskList = new ArrayList<Task>();

		for (int i = 0; i < data.size(); i++) {
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

			getTimeLine(dataInizio, dataFine);

			taskList.add(task);
		}

		return taskList;
	}

	/**
	 * 
	 * Set startingDate and finishingDate dates based on the lower value for
	 * dataInizio and greater value for dataFine got by the List of
	 * <code>Task</code> type objects.
	 * 
	 * @param dataInizio dataInizio parameter from the current task.
	 * @param dataFine   dataFine parameter from the current task.
	 * 
	 */
	private static void getTimeLine(LocalDate dataInizio, LocalDate dataFine) {
		if (startingDate == null && finishingDate == null) {
			startingDate = dataInizio;
			finishingDate = dataFine;
		} else {
			if (dataInizio.compareTo(startingDate) < 0) {
				startingDate = dataInizio;
			} else if (dataFine.compareTo(finishingDate) > 0) {
				finishingDate = dataFine;
			}
		}
	}

	/**
	 * 
	 * Creates and modify an <code>XSSFworkbook</code> type object from a given
	 * <code>XSSFWorkbook</code> type object.
	 * 
	 * @param workbook the given <code>XSSFWorkbook</code> that will be written on.
	 * @param data     String that have to be worked in order to obtain the
	 *                 <code>Task</code> objects
	 * 
	 * @return the written workbook.
	 * @throws ParseException
	 * 
	 */
	public static XSSFWorkbook createWorkbook(XSSFWorkbook workbook, List<String> data)
			throws IOException, ParseException {

		List<Task> taskList = buildDataExcel(data);

		XSSFSheet sheet = workbook.createSheet();

		sheet.createFreezePane(5, 0, 5, 0);

		writeHeadersGantt(workbook, sheet, taskList);

		return workbook;

	}

	/**
	 * 
	 * Write the top part of the Excel sheet into the given
	 * <code>XSSFWorkbook</code>.
	 * 
	 * @param workbook the given <code>XSSFWorkbook</code> that will be written on.
	 * @param sheet    the sheet contained in the given workbook, instantiated in
	 *                 {@link #createWorkbook(workbook, data) createWorkbook}
	 * @param taskList A List of <code>Task</code> type objects.
	 * 
	 * 
	 */
	private static void writeHeadersGantt(XSSFWorkbook workbook, XSSFSheet sheet, List<Task> taskList) {
		XSSFRow header = sheet.createRow(0);
		XSSFRow headerMonth = sheet.createRow(1);
		XSSFRow headerDates = sheet.createRow(2);
		XSSFCell headerCell = header.createCell(0);

		sheet.setColumnWidth(1, 1000);
		sheet.setColumnWidth(1, 10000);
		sheet.setColumnWidth(2, 3000);
		sheet.setColumnWidth(3, 3000);

		XSSFCellStyle cellStyle = workbook.createCellStyle();

		cellStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
		cellStyle.setFillForegroundColor(IndexedColors.AQUA.getIndex());
		cellStyle.setFillBackgroundColor(IndexedColors.AQUA.getIndex());
		cellStyle.setAlignment(HorizontalAlignment.CENTER);
		cellStyle.setVerticalAlignment(VerticalAlignment.CENTER);
		cellStyle.setLocked(true);

		headerCell.setCellValue("WB");
		headerCell.setCellStyle(cellStyle);

		sheet.addMergedRegion(new CellRangeAddress(0, 2, 0, 0));

		headerCell = header.createCell(1);
		headerCell.setCellValue("Task Name");
		headerCell.setCellStyle(cellStyle);

		sheet.addMergedRegion(new CellRangeAddress(0, 2, 1, 1));

		headerCell = header.createCell(2);
		headerCell.setCellValue("Start");
		headerCell.setCellStyle(cellStyle);

		sheet.addMergedRegion(new CellRangeAddress(0, 2, 2, 2));

		headerCell = header.createCell(3);
		headerCell.setCellValue("Finish");
		headerCell.setCellStyle(cellStyle);

		sheet.addMergedRegion(new CellRangeAddress(0, 2, 3, 3));

		headerCell = header.createCell(4);
		headerCell.setCellValue("Duration");
		headerCell.setCellStyle(cellStyle);

		sheet.addMergedRegion(new CellRangeAddress(0, 2, 4, 4));

		daysBetween = ChronoUnit.DAYS.between(startingDate, finishingDate);

		XSSFCellStyle dateCellStyle = workbook.createCellStyle();

		dateCellStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
		dateCellStyle.setFillForegroundColor(IndexedColors.LIGHT_YELLOW.getIndex());
		dateCellStyle.setFillBackgroundColor(IndexedColors.LIGHT_YELLOW.getIndex());
		dateCellStyle.setAlignment(HorizontalAlignment.CENTER);
		dateCellStyle.setBorderBottom(BorderStyle.THIN);
		dateCellStyle.setBorderTop(BorderStyle.THIN);
		dateCellStyle.setBorderRight(BorderStyle.THIN);
		dateCellStyle.setBorderLeft(BorderStyle.THIN);

		CreationHelper createHelper = workbook.getCreationHelper();
		dateCellStyle.setDataFormat(createHelper.createDataFormat().getFormat("dd"));

		writeYearsInHeader(workbook, sheet, headerCell, header);

		writeMonthsInHeader(workbook, sheet, headerCell, headerMonth);

		setBordersToMergedCells(workbook, sheet);

		for (int i = 0; i <= daysBetween; i++) {
			sheet.setColumnWidth((5 + i), 800);

			headerCell = headerDates.createCell(5 + i);
			headerCell.setCellValue(startingDate.plusDays(i).getDayOfMonth());
			headerCell.setCellStyle(dateCellStyle);
		} // print days numbers row

		writeDataTableGantt(workbook, sheet, taskList);
		drawTimelineGantt(workbook, sheet, taskList);
	}

	/**
	 * 
	 * Write years numbers in the header over the Timeline starting from the cell
	 * specified by the given <code>XSSFCell</code>.
	 * 
	 * @param workbook   the given <code>XSSFWorkbook</code> that will be written
	 *                   on.
	 * @param sheet      the sheet contained in the given workbook, instantiated in
	 *                   {@link #createWorkbook(workbook, data) createWorkbook}.
	 * @param headerCell the given cell from where the years will be written.
	 * 
	 */
	private static void writeYearsInHeader(XSSFWorkbook workbook, XSSFSheet sheet, XSSFCell headerCell,
			XSSFRow headerYear) {

		XSSFCellStyle dateCellStyle = workbook.createCellStyle();

		dateCellStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
		dateCellStyle.setFillForegroundColor(IndexedColors.YELLOW.getIndex());
		dateCellStyle.setFillBackgroundColor(IndexedColors.YELLOW.getIndex());

		if (startingDate.getYear() != finishingDate.getYear()) {

			Long diffYearsSFDates = ChronoUnit.YEARS.between(startingDate, finishingDate);

			Long diffDaysFromEndYear = ChronoUnit.DAYS.between(startingDate,
					startingDate.with(TemporalAdjusters.lastDayOfYear()));
			headerCell = headerYear.createCell(5);

			headerCell.setCellValue(startingDate.getYear());
			headerCell.setCellStyle(dateCellStyle);

			int lastCell = (int) (diffDaysFromEndYear + 5);

			sheet.addMergedRegion(new CellRangeAddress(0, 0, 5, lastCell));
			CellUtil.setAlignment(headerCell, HorizontalAlignment.LEFT);

			if (diffYearsSFDates > 1) {
				for (long i = 1; i < diffYearsSFDates; i++) {
					lastCell = lastCell + 1;

					headerCell = headerYear.createCell(lastCell);
					headerCell.setCellValue(startingDate.plusYears(i).getYear());
					headerCell.setCellStyle(dateCellStyle);

					sheet.addMergedRegion(new CellRangeAddress(0, 0, lastCell, lastCell + 365));

					CellUtil.setAlignment(headerCell, HorizontalAlignment.LEFT);

					lastCell = lastCell + 365;
				}
			}

			lastCell = lastCell + 1;

			Long diffDaysFromStartYear = ChronoUnit.DAYS.between(finishingDate.with(TemporalAdjusters.firstDayOfYear()),
					finishingDate);

			headerCell = headerYear.createCell(lastCell);
			headerCell.setCellValue(finishingDate.getYear());
			headerCell.setCellStyle(dateCellStyle);

			sheet.addMergedRegion(new CellRangeAddress(0, 0, lastCell, (int) (diffDaysFromStartYear + lastCell)));
			CellUtil.setAlignment(headerCell, HorizontalAlignment.LEFT);

		} else {
			headerCell = headerYear.createCell(5);

			headerCell.setCellValue(startingDate.getYear());
			headerCell.setCellStyle(dateCellStyle);

			sheet.addMergedRegion(new CellRangeAddress(0, 0, 5, (int) (daysBetween + 5)));
			CellUtil.setAlignment(headerCell, HorizontalAlignment.LEFT);
		}

	}

	private static void writeMonthsInHeader(XSSFWorkbook workbook, XSSFSheet sheet, XSSFCell headerCell,
			XSSFRow headerMonth) {

		XSSFCellStyle dateCellStyle = workbook.createCellStyle();

		dateCellStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
		dateCellStyle.setFillForegroundColor(IndexedColors.YELLOW.getIndex());
		dateCellStyle.setFillBackgroundColor(IndexedColors.YELLOW.getIndex());

		if (startingDate.getMonth() != finishingDate.getMonth()) {

			Long diffMonthsSFDates = ChronoUnit.MONTHS.between(startingDate, finishingDate);

			Long diffDaysFromEndOfMonth = ChronoUnit.DAYS.between(startingDate,
					startingDate.with(TemporalAdjusters.lastDayOfMonth()));

			headerCell = headerMonth.createCell(5);
			headerCell.setCellValue(startingDate.getMonth().toString());
			headerCell.setCellStyle(dateCellStyle);

			int lastCell = (int) (diffDaysFromEndOfMonth + 5);

			sheet.addMergedRegion(new CellRangeAddress(1, 1, 5, lastCell));
			CellUtil.setAlignment(headerCell, HorizontalAlignment.CENTER);

			if (diffMonthsSFDates > 1) {
				for (long i = 1; i < diffMonthsSFDates; i++) {
					lastCell = lastCell + 1;

					headerCell = headerMonth.createCell(lastCell);
					headerCell.setCellValue(startingDate.plusMonths(i).getMonth().toString());
					headerCell.setCellStyle(dateCellStyle);

					sheet.addMergedRegion(new CellRangeAddress(1, 1, lastCell,
							(lastCell + startingDate.plusMonths(i).lengthOfMonth()) - 1));
					CellUtil.setAlignment(headerCell, HorizontalAlignment.CENTER);

					lastCell = lastCell + ((startingDate.plusMonths(i).lengthOfMonth()) - 1);
				}
			}

			lastCell = lastCell + 1;

			Long diffDaysFromStartMonth = ChronoUnit.DAYS
					.between(finishingDate.with(TemporalAdjusters.firstDayOfMonth()), finishingDate);

			headerCell = headerMonth.createCell(lastCell);
			headerCell.setCellValue(finishingDate.getMonth().toString());
			headerCell.setCellStyle(dateCellStyle);

			sheet.addMergedRegion(new CellRangeAddress(1, 1, lastCell, (int) (diffDaysFromStartMonth + lastCell)));
			CellUtil.setAlignment(headerCell, HorizontalAlignment.CENTER);

		} else {
			headerCell = headerMonth.createCell(5);
			headerCell.setCellValue(startingDate.getMonth().toString());
			headerCell.setCellStyle(dateCellStyle);

			sheet.addMergedRegion(new CellRangeAddress(1, 1, 5, (int) daysBetween + 5));
			CellUtil.setAlignment(headerCell, HorizontalAlignment.CENTER);
		}

	}

	/**
	 * 
	 * Write the data form the given List of <code>Task</code> type objects on the
	 * left side of the sheets.
	 * 
	 * @param workbook the given <code>XSSFWorkbook</code> that will be written on.
	 * @param sheet    the sheet contained in the given workbook, instantiated in
	 *                 {@link #createWorkbook(workbook, data) createWorkbook}
	 * @param taskList A List of <code>Task</code> type objects.
	 * 
	 */
	private static void writeDataTableGantt(XSSFWorkbook workbook, XSSFSheet sheet, List<Task> taskList) {

		CellStyle cellStyle = workbook.createCellStyle();
		CreationHelper createHelper = workbook.getCreationHelper();
		cellStyle.setDataFormat(createHelper.createDataFormat().getFormat("dd/MM/yyyy"));

		for (Task task : taskList) {
			XSSFRow taskRow = sheet.createRow(taskList.indexOf(task) + 3);
			XSSFCell headerCell = taskRow.createCell(0);
			headerCell.setCellValue(taskList.indexOf(task) + 1);

			headerCell = taskRow.createCell(1);
			headerCell.setCellValue(task.getNomeTask());

			headerCell = taskRow.createCell(2);
			headerCell.setCellValue(task.getDataInizio());
			headerCell.setCellStyle(cellStyle);

			headerCell = taskRow.createCell(3);
			headerCell.setCellValue(task.getDataFine());
			headerCell.setCellStyle(cellStyle);

			headerCell = taskRow.createCell(4);
			int sumIndex = taskList.indexOf(task) + 4;
			String strFormula = "D" + sumIndex + "-C" + sumIndex + "";
			headerCell.setCellFormula(strFormula);
		}

	}

	private static void drawTimelineGantt(XSSFWorkbook workbook, XSSFSheet sheet, List<Task> taskList) {

		CellColorList cellColorList = new CellColorList();

		for (Task task : taskList) {
			XSSFRow taskRow = sheet.getRow(taskList.indexOf(task) + 3);

			LocalDate dataInizio = task.getDataInizio();
			Integer diffDaysFromStart = (int) ChronoUnit.DAYS.between(startingDate, dataInizio);

			LocalDate dataFine = task.getDataFine();
			Integer diffDaysTask = (int) ChronoUnit.DAYS.between(dataInizio, dataFine);

			Random rand = new Random();

			// Generate random integers in range 0 to 255
			int randomRGB1 = rand.nextInt(255);
			int randomRGB2 = rand.nextInt(255);
			int randomRGB3 = rand.nextInt(255);
			byte[] rgb = new byte[3];
			rgb[0] = (byte) randomRGB1; // red
			rgb[1] = (byte) randomRGB2; // green
			rgb[2] = (byte) randomRGB3; // blue
			// create XSSFColor
			XSSFColor color = new XSSFColor(rgb, new DefaultIndexedColorMap());

			for (int i = 0; i <= diffDaysTask; i++) {

				XSSFCell headerCell = taskRow.createCell(diffDaysFromStart + 5 + i);
				XSSFCellStyle cellStyle = workbook.createCellStyle();
				cellStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
				// cellStyle.setFillForegroundColor(cellColorList.getColorFromList(taskList.indexOf(task)));
				cellStyle.setFillForegroundColor(color);

				headerCell.setCellStyle(cellStyle);

			}

		}
	}

	private static void setBordersToMergedCells(XSSFWorkbook workBook, XSSFSheet sheet) {
		int numMerged = sheet.getNumMergedRegions();

		for (int i = 0; i < numMerged; i++) {
			CellRangeAddress mergedRegions = sheet.getMergedRegion(i);
			RegionUtil.setBorderTop(BorderStyle.THIN, mergedRegions, sheet);
			RegionUtil.setBorderLeft(BorderStyle.THIN, mergedRegions, sheet);
			RegionUtil.setBorderRight(BorderStyle.THIN, mergedRegions, sheet);
			RegionUtil.setBorderBottom(BorderStyle.THIN, mergedRegions, sheet);
		}

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
	public static void downloadExcel(HttpServletRequest request, HttpServletResponse response, List<String> data)
			throws IOException, ParseException {

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
