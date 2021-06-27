package com.yeoju.root.member.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.yeoju.root.member.session_name.MemberSessionName;
import com.yeoju.root.mybatis.GoodsDAO;

public class UserChkInterceptor extends HandlerInterceptorAdapter implements MemberSessionName {

	@Autowired GoodsDAO dao;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("상품 정보와 로그인 정보 일치 확인 인터셉터");
		boolean result = false;
		HttpSession session = request.getSession();
		String loginUser = (String)session.getAttribute(LOGIN);
		String chkUser = dao.getUserId(Integer.parseInt(request.getParameter("goodsId")));
		response.setContentType("text/html; charset=utf-8");// 클라이언트로 전달할 타입
		PrintWriter out = response.getWriter();
		if (loginUser == null) {
			out.print("<script>alert('로그인 해라'); location.href='/member/login';</script>");
			result = false;
		}else if(!loginUser.equals(chkUser)){
			out.print("<script>alert('잘못된 접근 입니다.'); location.href='/';</script>");
			result = false;
		}else {
			result = true;
		}
		return result;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println("===인터셉터 실행 컨트롤 후===");
	}

}