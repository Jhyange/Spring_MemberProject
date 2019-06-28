package kh.spring.aop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.dto.MemberDTO;

@Component
@Aspect
public class PrefCheckAdvice {

	@Autowired
	HttpSession session;
	@Autowired
	HttpServletRequest request;
	@Around("execution(* kh.spring.practice.HomeController.*(..))")	
  public Object PerfCheck(ProceedingJoinPoint pjp){
		long startTime=System.currentTimeMillis();
		Object retVal=null;
		Signature sign= pjp.getSignature();
				
				
		try {
			
					
					retVal=pjp.proceed();

		}catch(Throwable e)
		{e.printStackTrace();}
		long endTime=System.currentTimeMillis();
		String user=(String) session.getAttribute("id")==null?"익명":(String) session.getAttribute("id");
		System.out.println(user+"님이"+sign.getName()+"메소드를"+(endTime-startTime)/1000.0+"초간 수행하였습니다 ");
		return retVal;
	
	}
	@Around("execution(* kh.spring.practice.HomeController.mypage(..))")
	public Object loginCheck(ProceedingJoinPoint pjp)throws Throwable{
		String id=(String) session.getAttribute("id");
		System.out.println(id);
		if(id==null)
		{
			ModelAndView mav=new ModelAndView();
			mav.addObject("msg","로그인해주세요");
			mav.setViewName("index");
			return mav;
		}
		else {
			return pjp.proceed();
		}
	}
	//String으로 id값 막기 
/*	@Around("execution(* kh.spring.practice.HomeController.mypageForm(..))")
	   public Object loginCheck2(ProceedingJoinPoint pjp ) {
	            
	       String id=(String) session.getAttribute("id");
	      
	      if(id == null) {
	          request.setAttribute("msg", "로그인 진행");
	         return "index";
	      }else {
	         try {
				return pjp.proceed();
			} catch (Throwable e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return "error";
			}
	      }
	   }*/	
	
}