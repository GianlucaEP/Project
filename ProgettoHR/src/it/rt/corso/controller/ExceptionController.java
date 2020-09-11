package it.rt.corso.controller;

import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.ServletRequestBindingException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.NoHandlerFoundException;
//import org.springframework.web.bind.annotation.ResponseStatus;
//import org.springframework.http.HttpStatus;

@ControllerAdvice              
public class ExceptionController {
//	 @ResponseStatus(HttpStatus.BAD_REQUEST)
	 @ExceptionHandler({ServletRequestBindingException.class, HttpRequestMethodNotSupportedException.class})
		public String sessionClosed(){
			 return "redirect:/Login";
		}
	 
	 @ExceptionHandler({NoHandlerFoundException.class})
	 public String pageNotFound(NoHandlerFoundException  ex) {
	     return "/PageNotFound";
	 }

}
