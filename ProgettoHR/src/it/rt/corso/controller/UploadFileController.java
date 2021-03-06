package it.rt.corso.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import it.rt.corso.DAO.CandidatoDAO;
import it.rt.corso.DAO.UploadFileDAO;
import it.rt.corso.beans.Candidato;
import it.rt.corso.beans.UploadFile;

@Controller
public class UploadFileController {
	//private static final String UPLOAD_DIRECTORY = "C:\\Program Files (x86)\\Apache Software Foundation\\Tomcat 9.0\\webapps\\data";

	private ApplicationContext factory = new ClassPathXmlApplicationContext("bean.xml");

	private UploadFileDAO uploadFileDAO = (UploadFileDAO) factory.getBean("uploadFileDAO");
	private CandidatoDAO candidatoDAO = (CandidatoDAO) factory.getBean("candidatoDAO");

	/**
	 * Load a File to database.
	 * 
	 * @param request an <code>HttpServletRequest</code> object used to set the file into it.
	 * @param businessUnit business unit String obtained from the URL.
	 * @param id of the Candidato to which we will assign the file uploaded in database.
	 * 
	 * @return JSP URL.
	 * */
	@RequestMapping(value = "/doUpload/{businessUnit}/{id}", method = RequestMethod.POST)
	public String handleFileUpload(HttpServletRequest request, @RequestParam MultipartFile fileUpload,
			@PathVariable int id, @PathVariable String businessUnit, HttpSession session) throws Exception {

		if (fileUpload != null) {

			if (fileUpload.getOriginalFilename().equalsIgnoreCase("")) {
				return "redirect:/Candidato/{businessUnit}/{id}";
			}

			//soluzione nel caso volessimo salvare i file su server
//			ServletContext context = session.getServletContext();
//			String path = UPLOAD_DIRECTORY;
//			String filename = fileUpload.getOriginalFilename();
//
//			byte[] bytes = fileUpload.getBytes();
//			BufferedOutputStream stream = new BufferedOutputStream(
//					new FileOutputStream(new File(path + File.separator + filename)));
//			stream.write(bytes);
//			stream.flush();
//			stream.close();

			Candidato c = candidatoDAO.get(id);

			UploadFile uploadFile = new UploadFile();
			uploadFile.setNomeFile(fileUpload.getOriginalFilename());
			//uploadFile.setUrl(path + "\\" + fileUpload.getOriginalFilename());
			 uploadFile.setTipo(fileUpload.getContentType());
			 uploadFile.setFileData(fileUpload.getBytes());
			uploadFile.setCandidato(c);
			uploadFileDAO.inserisci(uploadFile);
		}

		return "redirect:/Candidato/{businessUnit}/{id}";
	}

	/**
	 * Download a file from database.
	 * 
	 * @param response an <code>HttpServletResponse</code> object used to set the file into it.
	 * @param businessUnit business unit String obtained from the URL.
	 * @param candidatoId written in the URL in order to be used to load the Candidato in JSP.
	 * @param fileId id used to select the file from database.
	 * 
	 * @return JSP URL.
	 * */
	@RequestMapping(value = "/download/{businessUnit}/{candidatoId}/{fileId}", method = RequestMethod.GET)
	public String downloadDocument(@PathVariable int candidatoId, @PathVariable int fileId,
			@PathVariable String businessUnit, HttpServletResponse response) throws IOException {
		UploadFile file = uploadFileDAO.get(fileId);
		
		//String path = "file:///" + file.getUrl();
		//BufferedInputStream in = new BufferedInputStream(new URL(path).openStream());

		 response.setContentType(file.getTipo());
		 response.setContentLength(file.getFileData().length);
		response.setHeader("Content-Disposition", "attachment; filename=\"" + file.getNomeFile() + "\"");

		//FileCopyUtils.copy(in, response.getOutputStream());
		FileCopyUtils.copy(file.getFileData(), response.getOutputStream());

		return "redirect:/Candidato/{businessUnit}/{candidatoId}";

	}

	/**
	 * Delete a file from database.
	 * 
	 * @param businessUnit business unit String obtained from the URL.
	 * @param candidatoId written in the URL in order to be used to load the Candidato in JSP.
	 * @param idAllegato id used to select the file from database.
	 * 
	 * @return JSP URL.
	 * */
	@RequestMapping(value = { "/delete/{businessUnit}/{candidatoId}" }, method = RequestMethod.GET)
	public String deleteDocument(@PathVariable int candidatoId, @PathVariable String businessUnit,
			@RequestParam(name = "idAllegato") int idAllegato) throws IOException {

		UploadFile file = uploadFileDAO.get(idAllegato);
		uploadFileDAO.cancella(file);

//		Path fileToDeletePath = Paths.get(file.getUrl());
//		Files.delete(fileToDeletePath);

		return "redirect:/Candidato/{businessUnit}/{candidatoId}";
	}

}
