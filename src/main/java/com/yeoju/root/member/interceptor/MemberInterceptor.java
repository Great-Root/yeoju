package com.yeoju.root.member.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.yeoju.root.common.components.Components;
import com.yeoju.root.member.session_name.MemberSessionName;



public class MemberInterceptor extends HandlerInterceptorAdapter
										implements MemberSessionName{
	@Autowired Components comp;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("로그인 유무 체크 인터셉터");
		HttpSession session = request.getSession();
		if(session.getAttribute(LOGIN) == null) {
			comp.sendAlertAndHref(response, "로그인 하세요~", request.getContextPath()+"/member/login");
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