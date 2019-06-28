package kh.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.spring.dao.BoardDAO;
import kh.spring.dto.BoardDTO;


@Service("Service")
public class BoardService {
	@Autowired
	private BoardDAO dao;
	@Autowired
	private BoardDTO dto;
	
	    public List<BoardDTO> board() {
	    	
	    	return dao.selectboard();
	    	
	    }
	 
	    public boolean transactionwrite(BoardDTO dto) {
	    
	    	dao.insertboard(dto);
	    
	    	return true;
	    }
	    
   public BoardDTO selcontext(String seq) {
	    	
	    	return dao.selectcontext(seq);
	    	
	    }
   public int delcontext(String seq) {
   	
   	return dao.deletecontext(seq);
   	
   }
}
