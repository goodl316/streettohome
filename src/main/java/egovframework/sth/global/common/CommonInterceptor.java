package egovframework.sth.global.common;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import egovframework.sth.domain.member.domain.MemberDTO;

public class CommonInterceptor implements HandlerInterceptor {
	
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
    	MemberDTO loginMember = new MemberDTO();
        String msg = null;
        loginMember = (MemberDTO) request.getSession().getAttribute("loginMember");
        
        if(loginMember == null) {
        	msg = "로그인 후 이용해주세요.";
        	response.sendRedirect("/member/login?msg=" + urlEncoder(msg));
            return false;
        } else {
        	if (loginMember != null && loginMember.getM_state().equals("3")) {
        		msg = "차단되었습니다. 관리자에게 문의해주세요.";
        		response.sendRedirect("/member/login?msg=" + urlEncoder(msg));
        		return false;
        	} else if (loginMember != null && loginMember.getM_auth().equals("0")) {
        		msg = "미인증 계정입니다. 인증 후 이용해주세요.";
        		response.sendRedirect("/member/login?msg=" + urlEncoder(msg));
        		return false;
        	}
        }
    	return true;
    }
    
    @Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
	}


	public String urlEncoder(String msg) {
    	String result = null;
    	try {
			result = URLEncoder.encode(msg, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
    	return result;
    }

}
