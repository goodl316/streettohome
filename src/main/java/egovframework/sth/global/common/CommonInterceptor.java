package egovframework.sth.global.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import egovframework.sth.domain.member.domain.MemberDTO;

public class CommonInterceptor implements HandlerInterceptor {
	
	@Autowired
    HttpSession session;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        MemberDTO loginMember = (MemberDTO) request.getSession().getAttribute("loginMember");
        if(loginMember != null && loginMember.getM_state() == "3") {
            request.setAttribute("Msg","차단된 계정입니다. 관리자에게 문의하세요.");
            request.getRequestDispatcher("/member/login").forward(request, response);
            return false;
        } else if (loginMember != null && loginMember.getM_auth() == "0") {
            request.setAttribute("Msg","미인증 계정입니다. 메일 인증을 해주세요.");
            request.getRequestDispatcher("/member/login").forward(request, response);
            return false;
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
    }

}
