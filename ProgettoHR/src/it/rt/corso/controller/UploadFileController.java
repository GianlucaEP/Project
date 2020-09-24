package it.rt.corso.controller;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import it.rt.corso.DAO.CandidatoDAO;
import it.rt.corso.DAO.UploadFileDAO;
import it.rt.corso.beans.Candidato;
import it.rt.corso.beans.UploadFile;

@Controller
public class UploadFileController {

	ApplicationContext factory = new ClassPathXmlApplicationContext("bean.xml");

	UploadFileDAO uploadFileDAO = (UploadFileDAO) factory.getBean("uploadFileDAO");
	CandidatoDAO candidatoDAO = (CandidatoDAO) factory.getBean("candidatoDAO");

	@RequestMapping(value = "/doUpload/{businessUnit}/{id}", method = RequestMethod.POST)
	public String handleFileUpload(HttpServletRequest request, @RequestParam MultipartFile fileUpload,
			@PathVariable int id, @PathVariable String businessUnit) throws Exception {

		Candidato c = candidatoDAO.get(id);

		if (fileUpload != null) {
			
				if (fileUpload.getOriginalFilename().equalsIgnoreCase("")) {
					return "redirect:/Candidato/{businessUnit}/{id}";
				}

				UploadFile uploadFile = new UploadFile();
				uploadFile.setNomeFile(fileUpload.getOriginalFilename());
				uploadFile.setTipo(fileUpload.getContentType());
				uploadFile.setFileData(fileUpload.getBytes());
				uploadFile.setCandidato(c);
				uploadFileDAO.inserisci(uploadFile);
			}
		

		return "redirect:/Candidato/{businessUnit}/{id}";
	}

	@RequestMapping(value = "/download/{businessUnit}/{candidatoId}/{fileId}", method = RequestMethod.GET)
	public String downloadDocument(@PathVariable int candidatoId, @PathVariable int fileId, @PathVariable String businessUnit,
			HttpServletResponse response) throws IOException {
		UploadFile file = uploadFileDAO.get(fileId);
		response.setContentType(file.getTipo());
		response.setContentLength(file.getFileData().length);
		response.setHeader("Content-Disposition", "attachment; filename=\"" + file.getNomeFile() + "\"");

		FileCopyUtils.copy(file.getFileData(), response.getOutputStream());

		return "redirect:/Candidato/{businessUnit}/{candidatoId}";

	}

	@RequestMapping(value = { "/delete/{businessUnit}/{candidatoId}" }, method = RequestMethod.GET)
	public String deleteDocument(@PathVariable int candidatoId, @PathVariable String businessUnit, @RequestParam(name = "idAllegato") int idAllegato) {
		
		
		UploadFile file = uploadFileDAO.get(idAllegato);
		uploadFileDAO.cancella(file);
		return "redirect:/Candidato/{businessUnit}/{candidatoId}";
	}

}
