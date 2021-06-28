package com.yeoju.root.member.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.yeoju.root.member.session_name.MemberSessionName;



public class LoginChkInterceptor extends HandlerInterceptorAdapter
										implements MemberSessionName{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("로그인 정보와 파라미터 일치 확인 인터셉터");
		HttpSession session = request.getSession();
		if(!session.getAttribute(LOGIN).equals(request.getParameter("userId"))) {
			response.setContentType("text/html; charset=utf-8");//클라이언트로 전달할 타입
			PrintWriter out = response.getWriter();
			out.print("<script>alert('로그인 정보가 다릅니다'); location.href='/';</script>");
			return false;
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println("===인터셉터 실행 컨트롤 후===");
	}

}