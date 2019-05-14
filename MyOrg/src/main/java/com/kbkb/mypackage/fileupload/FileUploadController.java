package com.kbkb.mypackage.fileupload;

import java.io.File;

import javax.servlet.ServletContext;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.DefaultResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class FileUploadController {
	private static final Logger logger = LoggerFactory.getLogger(FileUploadController.class);
	@Autowired
	SqlSession sqlsession;
	
	@Autowired
	ServletContext sc;

	@RequestMapping(value = "/fileupload", method = RequestMethod.GET)
	public String fileuploadget(Model model) {
		logger.info("get방식 요청");
		model.addAttribute("menu", "fileupload");
		return "fileupload/index";
	}

	@RequestMapping(value = "/fileupload", method = RequestMethod.POST)
	public String fileuploadpost(Model model, MultipartFile pfile) {
		System.out.println("테스트");
		
		String resource_path = sc.getRealPath("/resources/");
		
		System.out.println(resource_path);
		File file = new File(resource_path, "a.jpg");
		System.out.println(file.getAbsolutePath());

		try {
			FileCopyUtils.copy(pfile.getBytes(), file);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("menu", "fileupload");
		model.addAttribute("impath", file.getName());
		return "fileupload/index";
	}
	
	@RequestMapping(value = "/fileupload/ajax", method = RequestMethod.POST)
	public String fileuploadpostAjax(Model model, MultipartFile pfile) {
		System.out.println("테스트");
		
		String resource_path = sc.getRealPath("/resources/");
		
		System.out.println(resource_path);
		File file = new File(resource_path, System.currentTimeMillis()+".jpg");
		System.out.println(file.getAbsolutePath());

		try {
			FileCopyUtils.copy(pfile.getBytes(), file);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("menu", "fileupload");
		model.addAttribute("attribute", file.getName());
		return "fileupload/fileAjax";
	}
}
