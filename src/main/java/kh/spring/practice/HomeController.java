package kh.spring.practice;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.dao.BoardDAO;
import kh.spring.dao.MemberDAO;
import kh.spring.dto.BoardDTO;
import kh.spring.dto.MemberDTO;
import kh.spring.service.BoardService;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	/*	@Autowired
	private MemberService service;*/
	@Autowired 
	private HttpSession session;
	@Autowired 
	HttpServletRequest request;
	@Autowired
	private MemberDAO dao;




	//index
	@RequestMapping("/")
	public String index() {
		return "index"; 
	}
	////----------------------------Member------------------------------------------------------
	@RequestMapping("/login")
	public String login(String id,String pw ) {
		int result=dao.logincheck(id, pw);
		if(result==1) {
			session.setAttribute("id",id);
			session.setAttribute("pw", pw);
			return "index";
		}
		return "redirect:/";
	}

	@RequestMapping("/joinform")
	public String Joinform() {
		return "joinform";
	}

	@ResponseBody
	@RequestMapping("/idajax.do")
	public String idajax(HttpServletRequest request) {
		boolean idcheck=dao.SelectId(request.getParameter("id"));
		if(idcheck)
		{return "true";}
		else return "false";
	}


	@RequestMapping("/IdDubleCheck")
	public String IdDubleCheck(HttpServletRequest request,HttpServletResponse response) throws IOException{
		String id=request.getParameter("id");
		try {
			boolean idcheck = dao.SelectId(id);
			System.out.print(id);
			request.setAttribute("idcheck",idcheck);
			request.setAttribute("id",id);
			return "IdDubleCheck";			

		} catch (Exception e) {
			e.printStackTrace();
			return null;}	
	}

	/*@RequestMapping("/Joinproc")
	public String JoinProc(HttpServletRequest request) {
		String resourcePath = session.getServletContext().getRealPath("/resources");
			System.out.println(resourcePath);
			int maxSize=10*1024*1024; //10메가 
	try {
				MultipartRequest multi = new MultipartRequest(request,resourcePath,maxSize,"utf-8", new DefaultFileRenamePolicy());
				String name = multi.getParameter("name");
				File oriFile = multi.getFile("image");
				FileUtils.moveFile(oriFile,new File(resourcePath+"/"+multi.getParameter("id")+"_profile.png"));


				System.out.println(multi.getParameter("name"));
				dao.Insertmember(new MemberDTO(
						multi.getParameter("id"),
						multi.getParameter("pw"),
						multi.getParameter("name"),
							Integer.parseInt(multi.getParameter("phone")),
						Integer.parseInt(multi.getParameter("phone1")),
								Integer.parseInt(multi.getParameter("phone2")),
								multi.getParameter("email"),
								multi.getParameter("post"),
								multi.getParameter("address1"),
								multi.getParameter("address2")
								));

			}catch(Exception e) {
				e.printStackTrace();
			}


		return "redirect:/";
	}*/
	@RequestMapping("/Joinproc1")
	public String JoinProc1(MemberDTO dto) {
		System.out.println(dto.getName()); 
		System.out.println(dto.getImage());
		String uploadpath=session.getServletContext().getRealPath("/resources");
		System.out.println(uploadpath);
		try {
			dto.getImage().transferTo(new File(uploadpath+"/"+dto.getId()+"profile.png"));
			dto.setImagepath(dto.getId()+"profile.png");
			dao.Insertmember(dto);
		} catch (IOException e) {
			e.printStackTrace();
		}


		return "redirect:/";
	}
	@RequestMapping("/logout")
	public String logout() {
		session.invalidate();
		return  "redirect:/";
	}
	@RequestMapping("/mypage")
	public ModelAndView mypage(HttpServletRequest request) {

		MemberDTO dto=dao.selectAll((String)session.getAttribute("id"));

		System.out.println(dto.getImagepath());


		//	request.setAttribute("dto",dto);
		ModelAndView mav=new ModelAndView();
		mav.addObject("dto",dto);
		mav.setViewName("mypage");
		return mav;

	}
	//String으로 받기 
	@RequestMapping("/myPageForm")
	public String mypageForm(HttpServletRequest request) {
		String id = (String)session.getAttribute("id");
		MemberDTO dto = dao.selectAll(id);

		request.setAttribute("result", dto);
		return "mypage";
	}

	@RequestMapping("/update")
	public String Update(HttpServletRequest request){
		String id = (String)session.getAttribute("id");
		MemberDTO dto = dao.selectAll(id);

		request.setAttribute("result", dto);
		return "update";
	}

	@RequestMapping("/updateform")
	public String Updateform(MemberDTO dto){

		dao.update(dto);


		return "redirect:/";
	}


	

	








}
