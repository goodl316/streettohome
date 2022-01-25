package egovframework.sth.global.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

import egovframework.sth.domain.member.domain.MemberDTO;

public class AdminInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        MemberDTO loginMember = (MemberDTO) request.getSession().getAttribute("loginMember");
        
        if (loginMember != null && loginMember.getM_authstate() == 999) {
            
        	return true;
        
        }
        
        response.sendRedirect("/member/login");
        
        return false;
    }

}
 