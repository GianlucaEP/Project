package it.rt.corso.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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

	@RequestMapping(value = "/doUpload/{id}", method = RequestMethod.POST)
	public String handleFileUpload(HttpServletRequest request, @RequestParam CommonsMultipartFile[] fileUpload,
			@PathVariable int id) throws Exception {

		Candidato c = candidatoDAO.get(id);

		if (fileUpload != null && fileUpload.length > 0) {
			for (CommonsMultipartFile aFile : fileUpload) {

				if (aFile.getOriginalFilename().equalsIgnoreCase("")) {
					continue;
				}

				System.out.println("Saving file: " + aFile.getOriginalFilename());

				UploadFile uploadFile = new UploadFile();
				uploadFile.setNomeFile(aFile.getOriginalFilename());
				uploadFile.setTipo(aFile.getContentType());
				uploadFile.setFileData(aFile.getBytes());
				uploadFile.setCandidato(c);
				uploadFileDAO.inserisci(uploadFile);
			}
		}

		return "redirect:/Candidato/{id}";
	}

	@RequestMapping(value = "/download/{candidatoId}/{fileId}", method = RequestMethod.GET)
	public String downloadDocument(@PathVariable int candidatoId, @PathVariable int fileId,
			HttpServletResponse response) throws IOException {
		UploadFile file = uploadFileDAO.get(fileId);
		response.setContentType(file.getTipo());
		response.setContentLength(file.getFileData().length);
		response.setHeader("Content-Disposition", "attachment; filename=\"" + file.getNomeFile() + "\"");

		FileCopyUtils.copy(file.getFileData(), response.getOutputStream());

		return "redirect:/Candidato/{candidatoId}";

	}

	@RequestMapping(value = { "/delete/{candidatoId}" }, method = RequestMethod.GET)
	public String deleteDocument(@PathVariable int candidatoId, @RequestParam(name = "idAllegato") int idAllegato) {
		
		
		UploadFile file = uploadFileDAO.get(idAllegato);
		uploadFileDAO.cancella(file);
		return "redirect:/Candidato/{candidatoId}";
	}

}
