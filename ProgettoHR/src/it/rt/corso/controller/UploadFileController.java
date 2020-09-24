package it.rt.corso.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;

import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
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
	//private static final String UPLOAD_DIRECTORY = "C:\\Program Files (x86)\\Apache Software Foundation\\Tomcat 9.0\\webapps\\data";

	ApplicationContext factory = new ClassPathXmlApplicationContext("bean.xml");

	UploadFileDAO uploadFileDAO = (UploadFileDAO) factory.getBean("uploadFileDAO");
	CandidatoDAO candidatoDAO = (CandidatoDAO) factory.getBean("candidatoDAO");

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
