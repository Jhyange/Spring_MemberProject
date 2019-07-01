package kh.spring.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kh.spring.dto.BoardDTO;
import kh.spring.dto.FileDTO;
@Component
public class BoardDAO {
	
	@Autowired
	private SqlSessionTemplate  sst;
	
	public List<BoardDTO> selectboard()
	{   
		return sst.selectList("BoardDAO.selectlist");
	}
	
	public int insertboard(BoardDTO dto)
	{   
		return sst.insert("BoardDAO.insert",dto);
		
	}
	public int selectseq()
	{
		return sst.selectOne("BoardDAO.fileseq");
	}
	public int insertimg(FileDTO dto)
	{   
		
		return sst.insert("BoardDAO.insertfile",dto);
		
	}
	
	public BoardDTO selectcontext(String seq)
	{   
		return sst.selectOne("BoardDAO.selectcontext",seq);
		
	}
	
	public int deletecontext(String seq)
	{   
		return sst.delete("BoardDAO.deletecontext",seq);
		
	}
	public int updateviewcount(String seq)
	{   
		return sst.delete("BoardDAO.updateview",seq);
		
	}
	
	@Autowired
	private Configeration cgf;
	
	public int boardselcount(){
		return sst.selectOne("BoardDAO.bordcount");
		
	}
	
	
}
