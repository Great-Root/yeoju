package com.yeoju.root.mypage.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.yeoju.root.common.dto.GoodsDTO;
import com.yeoju.root.common.dto.MemberDTO;
import com.yeoju.root.common.dto.ProfileDTO;
import com.yeoju.root.member.session_name.MemberSessionName;
import com.yeoju.root.mypage.service.MyPageService;

@Controller
@RequestMapping("mypage")
public class MyPageController implements MemberSessionName{
	
	@Autowired MyPageService mps;

	@ResponseBody
	@GetMapping(value="/sellGoods", produces = "application/json; charset=utf-8")
	public ArrayList<GoodsDTO> sellGoods(@RequestParam int pageNo, HttpSession session){
		return mps.sellGoods((String)session.getAttribute(LOGIN),pageNo);
	}
	@ResponseBody
	@GetMapping(value="/heartPage", produces = "application/json; charset=utf-8")
	public ArrayList<GoodsDTO> heartPage(@RequestParam int pageNo, HttpSession session){
		return mps.heartPage((String)session.getAttribute(LOGIN),pageNo);
	}
	@GetMapping("/memberModify")
	public String memebrModify(@RequestParam String userId, Model model) {
		MemberDTO dto = mps.getUserInfo(userId);
		dto.toString();
		model.addAttribute("modifyInfo", dto);
		return "mypage/memberModifyForm";
	}
	@PostMapping("/modify")
	public void modifyMember(MemberDTO dto, HttpServletResponse response, HttpServletRequest request) throws Exception{
		mps.modify(dto, response, request);
	}
	@GetMapping("/delete/{userId}")
	public String delete(@PathVariable String userId, Model model) {
		model.addAttribute("deleteInfo", mps.getUserInfo(userId));
		return "mypage/deleteForm";
	}
	@PostMapping("/delete.do")
	public void delete(@RequestParam String pw , HttpServletRequest request, HttpServletResponse response) throws Exception{
		mps.delete(pw, response, request);
	}
	
	@PostMapping("profileUpload")
	@ResponseBody
	public void profileUpload(@RequestParam MultipartFile avatar,HttpSession session) {
		mps.setProfileImg(avatar, session);
	}
	
	@GetMapping("profileDownload/{userId}")
	public void img(@PathVariable String userId, HttpSession session ,HttpServletResponse response) throws Exception {
		File file = mps.getProfileImg(userId);
		if(file == null) {
			file = new File(session.getServletContext().getRealPath("/")+"resources/img/default.jpg");
		}
		FileInputStream in = new FileInputStream(file);
		response.addHeader("Content-disposition", "attachment; fileName="+file.getName());
		FileCopyUtils.copy(in, response.getOutputStream());
		in.close();
	}
	
	@GetMapping("setDefaultImg")
	@ResponseBody
	public void setDefaultImg(HttpSession session) {
		File file = new File(session.getServletContext().getRealPath("/")+"resources/img/default.jpg");
		MultipartFile multipartFile = null;
		try {
			DiskFileItem fileItem = 
					new DiskFileItem("file", Files.probeContentType(file.toPath()), false, 
										file.getName(), (int) file.length() , file.getParentFile());
			InputStream input = new FileInputStream(file);
			OutputStream os = fileItem.getOutputStream();
			IOUtils.copy(input, os);
			multipartFile = new CommonsMultipartFile(fileItem);
		} catch (IOException e) {
			e.printStackTrace();
		}
		mps.setProfileImg(multipartFile, session);
	}
	
	@ResponseBody
	@GetMapping(value="/soldoutGoods", produces = "application/json; charset=utf-8")
	public ArrayList<GoodsDTO> soldoutGoods(@RequestParam int pageNo, HttpSession session){
		return mps.soldoutGoods((String)session.getAttribute(LOGIN),pageNo);
	}
	
}
