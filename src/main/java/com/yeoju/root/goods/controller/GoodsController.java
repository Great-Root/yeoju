package com.yeoju.root.goods.controller;

import java.io.File;
import java.io.FileInputStream;
import java.util.List;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;
import javax.security.cert.X509Certificate;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.fasterxml.jackson.annotation.JsonCreator.Mode;
import com.yeoju.root.category.CategoryService;
import com.yeoju.root.common.dto.CategoryDTO;
import com.yeoju.root.common.dto.GoodsCommentsDTO;
import com.yeoju.root.common.dto.GoodsDTO;
import com.yeoju.root.common.dto.HeartDTO;
import com.yeoju.root.common.url.URL;
import com.yeoju.root.goods.service.GoodsService;
import com.yeoju.root.member.session_name.MemberSessionName;

//import net.sf.json.JSONArray;

@Controller
@RequestMapping("goods")
public class GoodsController extends URL implements MemberSessionName{
	
	@Autowired
	GoodsService gs;
	@Autowired
	CategoryService cs;
	
	//1. 상품 전체 목록 
	@ResponseBody
	@RequestMapping("/list.do")
	public List<GoodsDTO> list(@RequestParam int pageNo) {
		return gs.listGoods(pageNo);
		
	}
//	public ModelAndView list(@RequestParam(defaultValue="goodsName") String searchOption,
//						@RequestParam(defaultValue="")String keyword)throws Exception{
//		List<GoodsDTO> list = gs.listGoods(searchOption,keyword);
//		//갯수
//		int count = gs.countArticle(searchOption,keyword);
//		//뷰
//		ModelAndView mav = new ModelAndView();
//		//데이터 맵에 저장
//		Map<String, Object> map=new HashMap<String,Object >();
//		map.put("list", list); //list
//		map.put("count", count); //레코드 갯수
//		map.put("searchOption", searchOption); //검색옵션
//		map.put("keyword", keyword); //검색키워드
//		mav.addObject("map",map);
//		mav.setViewName("/index");
//		return mav;
//		}
	//2. 상품 상세보기
	@RequestMapping("detail/{goodsId}")
	public String detail(@PathVariable("goodsId")int goodsId, Model model) {
		model.addAttribute("dto",gs.detailGoods(goodsId));
		return "goods/TgoodsDetail";
	}
	//3.상품등록 페이지 매핑
	@RequestMapping("write.do")
	public String write(Model model) throws Exception{ 
		
	List<CategoryDTO> category = null;
	category = cs.category();
	model.addAttribute("category", category);
	
	return "/goods/goodsWrite";	
	}
	//4.상품등록 처리 매핑
	@RequestMapping("insert.do")
	@ResponseBody
	public String insert(GoodsDTO dto, HttpSession session) {
		String url = "";
		//상품 이미지 등록 : 이미지 서버로 POST 요청
		MultipartFile uploadFile = dto.getImgFile();
		System.out.println(uploadFile.getOriginalFilename());
		if (!uploadFile.isEmpty()) {
			try {
				// SSL인증서 오류 처리
				SSLContext sc = SSLContext.getInstance("SSL");
				sc.init(null, dummyTrustManager, new java.security.SecureRandom()); 
				HttpsURLConnection.setDefaultSSLSocketFactory(sc.getSocketFactory());
				// 이미지 업로드 요청
				HttpHeaders headers = new HttpHeaders();
				headers.setContentType(MediaType.MULTIPART_FORM_DATA);
				MultiValueMap<String, Object> body
				= new LinkedMultiValueMap<>();
				body.add("file", uploadFile.getResource());
				HttpEntity<MultiValueMap<String, Object>> requestEntity
				= new HttpEntity<>(body, headers);
				String serverUrl = "https://www.greatroot.net/img/upload";
				RestTemplate restTemplate = new RestTemplate();
				ResponseEntity<String> response = restTemplate
						.postForEntity(serverUrl, requestEntity, String.class);
				String result = response.getBody();
				if(!result.equals("Failed to save")) {
					dto.setImgFileName(result); 
					dto.setUserId((String) session.getAttribute(LOGIN));
					url = gs.insertGoods(dto) ? "/" : "";
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return url;			
	}
	//5. 상품 수정(편집) 페이지 매핑
	@RequestMapping("edit/{goodsId}")
	public String edit(@PathVariable("goodsId")int goodsId,Model model) {
		model.addAttribute("dto", gs.detailGoods(goodsId));
		return "goods/goodsEdit";
	}
	//6.상품 수정(편집) 처리 매핑
	@RequestMapping("update.do")
	public String update(GoodsDTO dto, HttpSession session) {
		String url = "";
		int goodsId = dto.getGoodsId();
		//상품 이미지 등록 : 이미지 서버로 POST 요청
		MultipartFile uploadFile = dto.getImgFile();
		if (!uploadFile.isEmpty()) {
			try {
				// SSL인증서 오류 처리
				SSLContext sc = SSLContext.getInstance("SSL");
				sc.init(null, dummyTrustManager, new java.security.SecureRandom()); 
				HttpsURLConnection.setDefaultSSLSocketFactory(sc.getSocketFactory());
				// 이미지 업로드 요청
				HttpHeaders headers = new HttpHeaders();
				headers.setContentType(MediaType.MULTIPART_FORM_DATA);
				MultiValueMap<String, Object> body
				= new LinkedMultiValueMap<>();
				// 새로 등록할 이미지 파일
				body.add("file", uploadFile.getResource());
				// 삭제할 기존 이미지 이름
				body.add("delFileName", dto.getImgFileName());
				HttpEntity<MultiValueMap<String, Object>> requestEntity
				= new HttpEntity<>(body, headers);
				String serverUrl = "https://www.greatroot.net/img/modify";
				RestTemplate restTemplate = new RestTemplate();
				ResponseEntity<String> response = restTemplate
						.postForEntity(serverUrl, requestEntity, String.class);
				// 새로 등록된 이미지 이름
				dto.setImgFileName(response.getBody()); 
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		dto.setUserId((String) session.getAttribute(LOGIN));
		url = gs.updateGoods(dto) ? "redirect:/goods/detail/"+goodsId : "redirect:/goods/edit/"+goodsId;
		return url;		
	}
	//7.상품 삭제 처리 매핑
	@RequestMapping("delete.do")
	public String delete(@RequestParam int goodsId) {
		//상품 이미지 정보
		String delFileName = gs.imgFileName(goodsId);
		String path="";
		
		try {
			// SSL인증서 오류 처리
			SSLContext sc = SSLContext.getInstance("SSL");
			sc.init(null, dummyTrustManager, new java.security.SecureRandom()); 
			HttpsURLConnection.setDefaultSSLSocketFactory(sc.getSocketFactory());
			// 이미지 업로드 요청
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.MULTIPART_FORM_DATA);
			MultiValueMap<String, Object> body
			= new LinkedMultiValueMap<>();
			// 삭제할 기존 이미지 이름
			body.add("delFileName", delFileName);
			HttpEntity<MultiValueMap<String, Object>> requestEntity
			= new HttpEntity<>(body, headers);
			//상품 이미지 삭제 요청
			String serverUrl = "https://www.greatroot.net/img/delete";
			RestTemplate restTemplate = new RestTemplate();
			ResponseEntity<String> response = restTemplate
					.postForEntity(serverUrl, requestEntity, String.class);
			//레코드 삭제
			gs.deleteGoods(goodsId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/";
	}

	
	
	//8.상품 이미지 출력
	@GetMapping("img/{userId}")
	public void img(@PathVariable String userId,@RequestParam String fileName,
			HttpServletResponse response) throws Exception {
	response.addHeader("Content-disposition", "attachment; fileName="+fileName);
	String path = getImgURL(userId, fileName);
	File file = new File(path);
	FileInputStream in = new FileInputStream(file);
	FileCopyUtils.copy(in, response.getOutputStream());
	in.close();
	}
	
	//9.상품 찜버튼 클릭시
	@GetMapping("heart.do")
	@ResponseBody
	public boolean heart(int goodsId,HttpSession session) {
		String loginUser = (String)session.getAttribute(LOGIN);
		return loginUser == null ? false : gs.heart(new HeartDTO(loginUser, goodsId));
	}
	
	// 해당 상품 찜갯수 확인
	@GetMapping("heartNum.do/{goodsId}")
	@ResponseBody
	public int heartNum(@PathVariable int goodsId) {
		return gs.heartTotalCnt(goodsId);
	}
	
	// 상품 찜 활성화 확인
	@GetMapping("isheart.do/{goodsId}")
	@ResponseBody
	public boolean isheartNum(@PathVariable int goodsId, HttpSession session) {
		String loginUser = (String)session.getAttribute(LOGIN);
		return loginUser == null ? false : gs.isheart(new HeartDTO(loginUser, goodsId));
	}
	
	
	TrustManager[] dummyTrustManager = new TrustManager[] { new X509TrustManager() { 
	     public java.security.cert.X509Certificate[] getAcceptedIssuers() { 
	     return null; 
	     } 
	 
	     public void checkClientTrusted(X509Certificate[] certs, String authType) { 
	     } 
	 
	     public void checkServerTrusted(X509Certificate[] certs, String authType) { 
	     }

		@Override
		public void checkClientTrusted(java.security.cert.X509Certificate[] chain, String authType)
				throws java.security.cert.CertificateException {
			
		}

		@Override
		public void checkServerTrusted(java.security.cert.X509Certificate[] chain, String authType)
				throws java.security.cert.CertificateException {
			
		} 
	    } }; 
	

}
