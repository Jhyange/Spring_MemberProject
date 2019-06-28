package kh.spring.practice;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.dao.BoardDAO;
import kh.spring.dto.BoardDTO;
import kh.spring.service.BoardService;

@Controller
public class BoardController {
	@Autowired 
	private HttpSession session;
	@Autowired 
	HttpServletRequest request;
	
	@Autowired
	private BoardService bservice;
	
	
	@RequestMapping("/board")
	public String boardform()
	{
		
		List<BoardDTO> list=bservice.board();
		
		request.setAttribute("list", list);
		return "board_main";
}
	@RequestMapping("/Writeboard")
	public String writeform() {
		
		return "board_write";
	}
	@RequestMapping("WriteProc")
	public String writeproc(BoardDTO dto) {
		dto.setWriter( (String)session.getAttribute("id"));
		String uploadpath=session.getServletContext().getRealPath("/resources");
		System.out.println("위치"+uploadpath);
		
		try {
			String filename="/board/"+dto.getWriter()+"/"+System.currentTimeMillis()+"_write.png";
			if(dto.getImage().getSize()==0) {
				dto.setImgpath("null");
			}
			else {
				dto.getImage().transferTo(new File(uploadpath+filename));
				
				dto.setImgpath(filename);
				
			}
			boolean check=bservice.transactionwrite(dto);
			
			if(check==true) {
				return "redirect:/board";
				
				}
			} catch (IOException e) {
			e.printStackTrace();
		}
		
			
		return "redirect:/";
	
	}
	@RequestMapping("/SelcontentProc")
	public String SelcontentProc(String seq) {
		BoardDTO dto=bservice.selcontext(seq);
		if(!dto.getImgpath().equals("null")) {
			if(dto.getContext()==null)
			{
				dto.setContext("<img src='/resources"+dto.getImgpath()+"'width=100% height=100%/><br>");
			}
			else {
		dto.setContext("<img src='/resources"+dto.getImgpath()+"'width=100% height=100%/><br>"+dto.getContext());
		System.out.println(dto.getContext());
			}
			}
		
		request.setAttribute("list", dto);
		return "context";
	}
	
	@RequestMapping("/delboard")
	public String delboard(String seq,String imgpath) {
		String uploadpath=session.getServletContext().getRealPath("/resources");
		int result=bservice.delcontext(seq);
		if(result==1) {
		File file = new File(uploadpath+imgpath);
		boolean check = false;
		if(file.exists()) {
            check = file.delete();
            
        }
		System.out.println("삭제파일결과"+check);
		System.out.println("삭제결과"+result);
		}
		return "redirect:/board";
	
		
	}
	
@RequestMapping("/file")
public String file(String imageInp){
System.out.println("dd");
return "index";
}

	
	
}