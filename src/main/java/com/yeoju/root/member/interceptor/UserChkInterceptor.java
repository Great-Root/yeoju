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
import com.yeoju.root.mybatis.GoodsDAO;

public class UserChkInterceptor extends HandlerInterceptorAdapter implements MemberSessionName {

	@Autowired GoodsDAO dao;
	@Autowired Components comp;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("상품 정보와 로그인 정보 일치 확인 인터셉터");
		boolean result = false;
		HttpSession session = request.getSession();
		String loginUser = (String)session.getAttribute(LOGIN);
		String chkUser = dao.getUserId(Integer.parseInt(request.getParameter("goodsId")));
		if (loginUser == null) {
			comp.sendAlertAndHref(response, "로그인 하세요~", request.getContextPath()+"/member/login");
			result = false;
		}else if(!loginUser.equals(chkUser)){
			comp.sendAlertAndHref(response, "잘못된 접근 입니다.", request.getContextPath()+"/");
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