package kh.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.spring.dao.BoardDAO;
import kh.spring.dto.BoardDTO;
import kh.spring.dto.FileDTO;


@Service("Service")
public class BoardService {
	@Autowired
	private BoardDAO dao;
	@Autowired
	private BoardDTO dto;
	@Autowired
	private FileDTO fdto;
	    public List<BoardDTO> board() {
	    	
	    	return dao.selectboard();
	    	
	    }

	    @Transactional("txManager")  
	    public boolean transactionwrite(BoardDTO dto,FileDTO fdto) {
	       	dao.insertboard(dto);
	        fdto.setSeq( dao.selectseq());
	       
	        dao.insertimg(fdto);
	    	return true;
	    }
	    
	    
	    @Transactional("txManager")    
   public BoardDTO selcontext(String seq) {
	    	dao.updateviewcount(seq);
	    	return dao.selectcontext(seq);
	    	
	    }
   public int delcontext(String seq) {
   	
   	return dao.deletecontext(seq);
   	
   }
}
