package it.rt.corso.utility;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.time.temporal.TemporalAdjusters;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.BorderStyle;
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

import it.rt.corso.beans.Cost;
import it.rt.corso.beans.Task;

/**
 * 
 * Utility class that creates Excel files and builds HTTP reponses containing
 * said files in order to let the client download them.
 * 
 */
public abstract class CreateGanttExcel {

	/**
	 * Saves the lower value among all the <code>dataInizio</code> of every task.
	 * */
	private static LocalDate startingDate;
	/**
	 * Saves the higher value among all the <code>dataFine</code> of every task.
	 * */
	private static LocalDate finishingDate;
	/**
	 * Saves the days between starting and ending dates of a task.
	 * */
	private static long daysBetween;
	/**
	 * Saves the total number of days for all the tasks.
	 */
	private static String totalDays;
	/**
	 * Saves a <code>List</code> of <code>XSSFColor</code> type objects that will be used to color the
	 * timeline.
	 */
	private static List<XSSFColor> colorList = new ArrayList<XSSFColor>();
	/**
	 * Saves a <code>List</code> of <code>XSSFColor</code> type objects that has been used to color the
	 * timeline.
	 */
	private static List<XSSFColor> usedColorList = new ArrayList<XSSFColor>();

	/**
	 * 
	 * Build <code>Task</code> type objects from a given String.
	 * 
	 * @param data String that have to be worked in order to obtain the
	 *             <code>Task</code> objects
	 * 
	 * @return A <code>List</code> of <code>Task</code> type objects.
	 * 
	 */
	private static List<Task> buildTaskList(List<String> data) throws ParseException {

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
	 * Build <code>Cost</code> type objects from a given String.
	 * 
	 * @param costs String that have to be worked in order to obtain the
	 *              <code>Cost</code> objects
	 * 
	 * @return A List of <code>Cost</code> type objects.
	 * 
	 */
	private static List<Cost> buildCostList(List<String> costs) {

		List<Cost> costsList = new ArrayList<Cost>();

		for (int i = 0; i < costs.size(); i++) {
			Cost cost = new Cost();

			cost.setCost(costs.get(i));
			i++;
			cost.setInflation(costs.get(i));
			i++;
			cost.setPrice(costs.get(i));
			i++;
			cost.setPartial(costs.get(i));

			costsList.add(cost);
		}

		return costsList;
	}

	/**
	 * 
	 * Set startingDate and finishingDate dates based on the lower value for
	 * <code>dataInizio</code> and greater value for <code>dataFine</code> got by the List of
	 * <code>Task</code> type objects.
	 * 
	 * @param dataInizio <code>dataInizio</code> parameter from the current task.
	 * @param dataFine   <code>dataFine</code> parameter from the current task.
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
	public static XSSFWorkbook createWorkbook(XSSFWorkbook workbook, List<String> data, List<String> costs)
			throws IOException, ParseException {

		List<Task> taskList = buildTaskList(data);

		XSSFSheet sheet = workbook.createSheet();

		workbook.setSheetName(0, "Gantt");

		sheet.createFreezePane(5, 0, 5, 0);

		List<Cost> costList = buildCostList(costs);

		writeHeadersGantt(workbook, sheet, taskList);

		XSSFSheet sheetCosts = workbook.createSheet();

		workbook.setSheetName(1, "Costs");

		writeCostTable(workbook, sheetCosts, costList, taskList);

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

		sheet.setColumnWidth(0, 1000);
		sheet.setColumnWidth(1, 10000);
		sheet.setColumnWidth(2, 10000);
		sheet.setColumnWidth(3, 3000);
		sheet.setColumnWidth(4, 3000);

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
		headerCell.setCellValue("Resource");
		headerCell.setCellStyle(cellStyle);

		sheet.addMergedRegion(new CellRangeAddress(0, 2, 1, 1));

		headerCell = header.createCell(2);
		headerCell.setCellValue("Task Name");
		headerCell.setCellStyle(cellStyle);

		sheet.addMergedRegion(new CellRangeAddress(0, 2, 2, 2));

		headerCell = header.createCell(3);
		headerCell.setCellValue("Start");
		headerCell.setCellStyle(cellStyle);

		sheet.addMergedRegion(new CellRangeAddress(0, 2, 3, 3));

		headerCell = header.createCell(4);
		headerCell.setCellValue("Finish");
		headerCell.setCellStyle(cellStyle);

		sheet.addMergedRegion(new CellRangeAddress(0, 2, 4, 4));

		headerCell = header.createCell(5);
		headerCell.setCellValue("Duration");
		headerCell.setCellStyle(cellStyle);

		sheet.addMergedRegion(new CellRangeAddress(0, 2, 5, 5));

		daysBetween = ChronoUnit.DAYS.between(startingDate, finishingDate);

		writeYearsInHeader(workbook, sheet, headerCell, header);

		writeMonthsInHeader(workbook, sheet, headerCell, headerMonth);

		setBordersToMergedCells(workbook, sheet);

		writeDaysInHeader(workbook, sheet, headerCell, headerDates);

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
	 * @param headerYear the given row from where the years will be written.
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
			headerCell = headerYear.createCell(6);

			headerCell.setCellValue(startingDate.getYear());
			headerCell.setCellStyle(dateCellStyle);

			int lastCell = (int) (diffDaysFromEndYear + 6);

			sheet.addMergedRegion(new CellRangeAddress(0, 0, 6, lastCell));
			CellUtil.setAlignment(headerCell, HorizontalAlignment.LEFT);

			if (diffYearsSFDates > 1) {
				for (long i = 1; i < diffYearsSFDates; i++) {
					lastCell = lastCell + 1;

					headerCell = headerYear.createCell(lastCell);
					headerCell.setCellValue(startingDate.plusYears(i).getYear());
					headerCell.setCellStyle(dateCellStyle);

					LocalDate firstDay = startingDate.plusYears(i).with(TemporalAdjusters.firstDayOfYear()); // 2015-01-01
					LocalDate lastDay = startingDate.plusYears(i).with(TemporalAdjusters.lastDayOfYear());

					Long daysInYear = ChronoUnit.DAYS.between(firstDay, lastDay);

					sheet.addMergedRegion(new CellRangeAddress(0, 0, lastCell, (int) (lastCell + daysInYear)));

					CellUtil.setAlignment(headerCell, HorizontalAlignment.LEFT);

					lastCell = (int) (lastCell + daysInYear);
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
			headerCell = headerYear.createCell(6);

			headerCell.setCellValue(startingDate.getYear());
			headerCell.setCellStyle(dateCellStyle);

			sheet.addMergedRegion(new CellRangeAddress(0, 0, 6, (int) (daysBetween + 6)));
			CellUtil.setAlignment(headerCell, HorizontalAlignment.LEFT);
		}

	}

	/**
	 * 
	 * Write months names in the header over the Timeline starting from the cell
	 * specified by the given <code>XSSFCell</code>.
	 * 
	 * @param workbook   the given <code>XSSFWorkbook</code> that will be written
	 *                   on.
	 * @param sheet      the sheet contained in the given workbook, instantiated in
	 *                   {@link #createWorkbook(workbook, data) createWorkbook}.
	 * @param headerCell the given cell from where the months will be written.
	 * 
	 * @param headerMonth the given row from where the months will be written.
	 * 
	 */
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

			headerCell = headerMonth.createCell(6);
			headerCell.setCellValue(startingDate.getMonth().toString());
			headerCell.setCellStyle(dateCellStyle);

			int lastCell = (int) (diffDaysFromEndOfMonth + 6);

			sheet.addMergedRegion(new CellRangeAddress(1, 1, 6, lastCell));
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
			headerCell = headerMonth.createCell(6);
			headerCell.setCellValue(startingDate.getMonth().toString());
			headerCell.setCellStyle(dateCellStyle);

			sheet.addMergedRegion(new CellRangeAddress(1, 1, 6, (int) daysBetween + 6));
			CellUtil.setAlignment(headerCell, HorizontalAlignment.CENTER);
		}

	}

	/**
	 * 
	 * Write days numbers in the header over the Timeline starting from the cell
	 * specified by the given <code>XSSFCell</code>.
	 * 
	 * @param workbook   the given <code>XSSFWorkbook</code> that will be written
	 *                   on.
	 * @param sheet      the sheet contained in the given workbook, instantiated in
	 *                   {@link #createWorkbook(workbook, data) createWorkbook}.
	 * @param headerCell the given cell from where the days will be written.
	 * 
	 * @param headerDates the given row from where the days will be written.
	 * 
	 */
	private static void writeDaysInHeader(XSSFWorkbook workbook, XSSFSheet sheet, XSSFCell headerCell,
			XSSFRow headerDates) {

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

		for (int i = 0; i <= daysBetween; i++) {
			sheet.setColumnWidth((6 + i), 800);

			headerCell = headerDates.createCell(6 + i);
			headerCell.setCellValue(startingDate.plusDays(i).getDayOfMonth());
			headerCell.setCellStyle(dateCellStyle);
		} // print days numbers row
	}

	/**
	 * 
	 * Write the data form the given List of <code>Task</code> type objects on the
	 * left side of the sheet.
	 * 
	 * @param workbook the given <code>XSSFWorkbook</code> that will be written on.
	 * @param sheet    the sheet contained in the given workbook, instantiated in
	 *                 {@link #createWorkbook(workbook, data) createWorkbook}
	 * @param taskList A List of <code>Task</code> type objects.
	 * 
	 */
	private static void writeDataTableGantt(XSSFWorkbook workbook, XSSFSheet sheet, List<Task> taskList) {

		XSSFCellStyle dateCell = workbook.createCellStyle();
		CreationHelper createHelper = workbook.getCreationHelper();
		dateCell.setDataFormat(createHelper.createDataFormat().getFormat("dd/MM/yyyy"));
		dateCell.setAlignment(HorizontalAlignment.CENTER);
		dateCell.setBorderBottom(BorderStyle.THIN);
		dateCell.setBorderTop(BorderStyle.THIN);
		dateCell.setBorderRight(BorderStyle.THIN);
		dateCell.setBorderLeft(BorderStyle.THIN);

		XSSFCellStyle dataCellStyle = workbook.createCellStyle();

		dataCellStyle.setAlignment(HorizontalAlignment.CENTER);
		dataCellStyle.setBorderBottom(BorderStyle.THIN);
		dataCellStyle.setBorderTop(BorderStyle.THIN);
		dataCellStyle.setBorderRight(BorderStyle.THIN);
		dataCellStyle.setBorderLeft(BorderStyle.THIN);

		for (Task task : taskList) {
			XSSFRow taskRow = sheet.createRow(taskList.indexOf(task) + 3);
			XSSFCell headerCell = taskRow.createCell(0);
			headerCell.setCellValue(taskList.indexOf(task) + 1);
			headerCell.setCellStyle(dataCellStyle);

			headerCell = taskRow.createCell(1);
			headerCell.setCellValue(task.getNomeCandidiato());
			headerCell.setCellStyle(dataCellStyle);

			headerCell = taskRow.createCell(2);
			headerCell.setCellValue(task.getNomeTask());
			headerCell.setCellStyle(dataCellStyle);

			headerCell = taskRow.createCell(3);
			headerCell.setCellValue(task.getDataInizio());
			headerCell.setCellStyle(dateCell);

			headerCell = taskRow.createCell(4);
			headerCell.setCellValue(task.getDataFine());
			headerCell.setCellStyle(dateCell);

			headerCell = taskRow.createCell(5);
			int sumIndex = taskList.indexOf(task) + 4;
			String strFormula = "E" + sumIndex + "-D" + sumIndex + "";
			headerCell.setCellFormula(strFormula);
			headerCell.setCellStyle(dataCellStyle);

		}

		XSSFRow totalRow = sheet.createRow(taskList.size() + 3);
		XSSFCell totalCell = totalRow.createCell(4);
		totalCell.setCellValue("Total Days");
		totalCell.setCellStyle(dataCellStyle);

		totalCell = totalRow.createCell(5);
		totalCell.setCellValue(new BigDecimal(totalDays).doubleValue());
		totalCell.setCellStyle(dataCellStyle);
	}

	/**
	 * 
	 * Color cells with colors picked from a <code>List</code> of <code>XSSFColors</code> to create a timeline corresponding to
	 * days(cells) for task(rows) in the given workbook
	 * 
	 * @param workbook the given <code>XSSFWorkbook</code> that will be written on.
	 * @param sheet    the sheet contained in the given workbook, instantiated in
	 *                 {@link #createWorkbook(workbook, data) createWorkbook}
	 */
	private static void drawTimelineGantt(XSSFWorkbook workbook, XSSFSheet sheet, List<Task> taskList) {

		byte[] white = new byte[3];
		white[0] = (byte) 255; // red
		white[1] = (byte) 255; // green
		white[2] = (byte) 255; // blue

		XSSFColor borderColor = new XSSFColor(white, new DefaultIndexedColorMap());
		
		int colorListIndex = 0;
		
		if(colorList.isEmpty()) {
			createColorList();
		}

		for (Task task : taskList) {
			XSSFRow taskRow = sheet.getRow(taskList.indexOf(task) + 3);

			LocalDate dataInizio = task.getDataInizio();
			Integer diffDaysFromStart = (int) ChronoUnit.DAYS.between(startingDate, dataInizio);

			LocalDate dataFine = task.getDataFine();
			Integer diffDaysTask = (int) ChronoUnit.DAYS.between(dataInizio, dataFine);	
			
			if(colorListIndex == 10) {
				colorListIndex = 0;
			}
			
			XSSFColor color = colorList.get(colorListIndex);

			colorListIndex++;
			
			usedColorList.add(color);

			for (int i = 0; i <= diffDaysTask; i++) {

				XSSFCell headerCell = taskRow.createCell(diffDaysFromStart + 6 + i);
				XSSFCellStyle cellStyle = workbook.createCellStyle();
				cellStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
				cellStyle.setFillForegroundColor(color);
				
				if(taskList.indexOf(task) > 0) {
					cellStyle.setBorderTop(BorderStyle.MEDIUM);
				}
				
				cellStyle.setBorderBottom(BorderStyle.MEDIUM);

				cellStyle.setTopBorderColor(borderColor);
				cellStyle.setBottomBorderColor(borderColor);

				headerCell.setCellStyle(cellStyle);

			}

		}
	}
	
	
	/**
	 * 
	 * Create a <code>List</code> of <code>XSSFColor</code> that will be used to color the timeline in  {@link #drawTimelineGantt(workbook, sheet, taskList) drawTimelineGantt} metohd.
	 * 
	 * */
	private static void createColorList() {
		
		byte[] rgb = new byte[3];
		rgb[0] = (byte) 220; // red
		rgb[1] = (byte) 42; // green
		rgb[2] = (byte) 42; // blue
		
		XSSFColor color = new XSSFColor(rgb, new DefaultIndexedColorMap());
		
		colorList.add(color);
		
		rgb[0] = (byte) 38; // red
		rgb[1] = (byte) 166; // green
		rgb[2] = (byte) 91; // blue
		
		color = new XSSFColor(rgb, new DefaultIndexedColorMap());
		
		colorList.add(color);
		
		rgb[0] = (byte) 52; // red
		rgb[1] = (byte) 85; // green
		rgb[2] = (byte) 219; // blue
		
		color = new XSSFColor(rgb, new DefaultIndexedColorMap());
		
		colorList.add(color);
		
		rgb[0] = (byte) 220; // red
		rgb[1] = (byte) 42; // green
		rgb[2] = (byte) 42; // blue
		
		color = new XSSFColor(rgb, new DefaultIndexedColorMap());
		
		colorList.add(color);
		
		rgb[0] = (byte) 58; // red
		rgb[1] = (byte) 77; // green
		rgb[2] = (byte) 19; // blue
		
		color = new XSSFColor(rgb, new DefaultIndexedColorMap());
		
		colorList.add(color);
		
		rgb[0] = (byte) 52; // red
		rgb[1] = (byte) 85; // green
		rgb[2] = (byte) 219; // blue

		color = new XSSFColor(rgb, new DefaultIndexedColorMap());

		colorList.add(color);
		
		rgb[0] = (byte) 239; // red
		rgb[1] = (byte) 72; // green
		rgb[2] = (byte) 54; // blue
		
		color = new XSSFColor(rgb, new DefaultIndexedColorMap());
		
		colorList.add(color);
		
		rgb[0] = (byte) 107; // red
		rgb[1] = (byte) 142; // green
		rgb[2] = (byte) 35; // blue
		
		color = new XSSFColor(rgb, new DefaultIndexedColorMap());
		
		colorList.add(color);
		
		rgb[0] = (byte) 204; // red
		rgb[1] = (byte) 0; // green
		rgb[2] = (byte) 102; // blue
		
		color = new XSSFColor(rgb, new DefaultIndexedColorMap());
		
		colorList.add(color);
		
		rgb[0] = (byte) 0; // red
		rgb[1] = (byte) 0; // green
		rgb[2] = (byte) 204; // blue
		
		color = new XSSFColor(rgb, new DefaultIndexedColorMap());
		
		colorList.add(color);
		
	}

	/**
	 * 
	 * Write the header for the costs table in the second sheet of the given
	 * workbook.
	 * 
	 * @param workbook the given <code>XSSFWorkbook</code> that will be written on.
	 * @param sheet    the sheet contained in the given workbook, instantiated in
	 *                 {@link #createWorkbook(workbook, data) createWorkbook}
	 * @param costList <code>List</code> of Cost type objects used to write the
	 *                 table.
	 * @param costList <code>List</code> of Task type objects used to write the
	 *                 table.
	 */
	private static void writeCostTable(XSSFWorkbook workbook, XSSFSheet sheet, List<Cost> costList,
			List<Task> taskList) {
		XSSFRow headerRow = sheet.createRow(0);

		XSSFCellStyle cellStyle = workbook.createCellStyle();

		cellStyle.setAlignment(HorizontalAlignment.CENTER);
		cellStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
		cellStyle.setFillForegroundColor(IndexedColors.AQUA.getIndex());
		cellStyle.setFillBackgroundColor(IndexedColors.AQUA.getIndex());
		cellStyle.setBorderBottom(BorderStyle.THIN);
		cellStyle.setBorderTop(BorderStyle.THIN);
		cellStyle.setBorderRight(BorderStyle.THIN);
		cellStyle.setBorderLeft(BorderStyle.THIN);

		sheet.setColumnWidth(0, 10000);
		XSSFCell headerCell = headerRow.createCell(0);
		headerCell.setCellValue("Task");
		headerCell.setCellStyle(cellStyle);

		sheet.setColumnWidth(1, 10000);
		headerCell = headerRow.createCell(1);
		headerCell.setCellValue("Resource");
		headerCell.setCellStyle(cellStyle);

		sheet.setColumnWidth(2, 6000);
		headerCell = headerRow.createCell(2);
		headerCell.setCellValue("Cost");
		headerCell.setCellStyle(cellStyle);

		sheet.setColumnWidth(3, 4000);
		headerCell = headerRow.createCell(3);
		headerCell.setCellValue("Inflation");
		headerCell.setCellStyle(cellStyle);

		sheet.setColumnWidth(4, 6000);
		headerCell = headerRow.createCell(4);
		headerCell.setCellValue("Price");
		headerCell.setCellStyle(cellStyle);

		sheet.setColumnWidth(5, 6000);
		headerCell = headerRow.createCell(5);
		headerCell.setCellValue("Partial");
		headerCell.setCellStyle(cellStyle);

		writeCostTableData(workbook, sheet, costList, taskList);
	}

	/**
	 * 
	 * Write the data for the costs table in the second sheet of the given
	 * workbook.The list of <code>XSSFColor</code> {@link #usedColorList} is used in
	 * this method to set the color for cells containing the task name with the
	 * corresponding color used to draw the timeline of that task
	 * 
	 * @param workbook the given <code>XSSFWorkbook</code> that will be written on.
	 * @param sheet    the sheet contained in the given workbook, instantiated in
	 *                 {@link #createWorkbook(workbook, data) createWorkbook}
	 * @param costList <code>List</code> of <code>Cost</code> type objects used to
	 *                 write the table.
	 * @param costList <code>List</code> of <code>Task</code> type objects used to
	 *                 write the table.
	 */
	private static void writeCostTableData(XSSFWorkbook workbook, XSSFSheet sheet, List<Cost> costList,
			List<Task> taskList) {
		float totalCost = 0;

		XSSFCellStyle cellStyle = workbook.createCellStyle();

		cellStyle.setAlignment(HorizontalAlignment.CENTER);
		cellStyle.setBorderBottom(BorderStyle.THIN);
		cellStyle.setBorderTop(BorderStyle.THIN);
		cellStyle.setBorderRight(BorderStyle.THIN);
		cellStyle.setBorderLeft(BorderStyle.THIN);

		for (Cost cost : costList) {
			XSSFRow tableRow = sheet.createRow(costList.indexOf(cost) + 1);

			XSSFCellStyle taskCellStyle = workbook.createCellStyle();

			taskCellStyle.setAlignment(HorizontalAlignment.CENTER);
			taskCellStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
			taskCellStyle.setFillForegroundColor(usedColorList.get(costList.indexOf(cost)));
			taskCellStyle.setFillBackgroundColor(usedColorList.get(costList.indexOf(cost)));
			taskCellStyle.setBorderBottom(BorderStyle.THIN);
			taskCellStyle.setBorderTop(BorderStyle.THIN);
			taskCellStyle.setBorderRight(BorderStyle.THIN);
			taskCellStyle.setBorderLeft(BorderStyle.THIN);

			XSSFCell headerCell = tableRow.createCell(0);
			headerCell.setCellValue(taskList.get(costList.indexOf(cost)).getNomeTask());
			headerCell.setCellStyle(taskCellStyle);

			headerCell = tableRow.createCell(1);
			headerCell.setCellValue(taskList.get(costList.indexOf(cost)).getNomeCandidiato());
			headerCell.setCellStyle(cellStyle);

			headerCell = tableRow.createCell(2);
			headerCell.setCellValue(new BigDecimal(cost.getCost()).doubleValue() + "€");
			headerCell.setCellStyle(cellStyle);

			headerCell = tableRow.createCell(3);
			headerCell.setCellValue(new BigDecimal(cost.getInflation().replaceAll("%", "")).doubleValue() + "%");
			headerCell.setCellStyle(cellStyle);

			headerCell = tableRow.createCell(4);
			headerCell.setCellValue(new BigDecimal(cost.getPrice()).doubleValue() + "€");
			headerCell.setCellStyle(cellStyle);

			headerCell = tableRow.createCell(5);
			headerCell.setCellValue(new BigDecimal(cost.getPartial()).doubleValue() + "€");
			headerCell.setCellStyle(cellStyle);

			totalCost = totalCost + Float.parseFloat(cost.getPartial());
		}

		XSSFRow totalTableRow = sheet.createRow(costList.size() + 2);

		XSSFCell headerCell = totalTableRow.createCell(4);
		headerCell.setCellValue("Total cost");
		headerCell.setCellStyle(cellStyle);

		headerCell = totalTableRow.createCell(5);
		headerCell.setCellValue(new BigDecimal(totalCost).doubleValue() + "€");
		headerCell.setCellStyle(cellStyle);

	}

	/**
	 * Draw borders on merged region cells contained in the given workbook
	 * 
	 * @param workbook the given <code>XSSFWorkbook</code> that will be written on.
	 * @param sheet    the sheet contained in the given workbook, instantiated in
	 *                 {@link #createWorkbook(workbook, data) createWorkbook}
	 * 
	 */
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
	 * @param days
	 * @throws ParseException
	 */
	public static void downloadExcel(HttpServletRequest request, HttpServletResponse response, List<String> data,
			List<String> costs, String days) throws IOException, ParseException {

		File file = new File(System.getProperty("upload.location"), getFileName() + ".xlsx");

		XSSFWorkbook workbook = new XSSFWorkbook();

		totalDays = days;

		workbook = CreateGanttExcel.createWorkbook(workbook, data, costs);

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
			startingDate = null;
			finishingDate = null;
			usedColorList.clear();
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
