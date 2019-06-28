package kh.spring.dao;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import kh.spring.dto.BoardDTO;
import kh.spring.dto.MemberDTO;



@Component
public class MemberDAO {
@Autowired
private JdbcTemplate template;

@Autowired
private SqlSessionTemplate  sst;


//-----------------------비밀번호 -------------------------------------------
public static String testSHA256(String str){
	String SHA = ""; 
	try{
		MessageDigest sh = MessageDigest.getInstance("SHA-256"); 
		sh.update(str.getBytes()); 
		byte byteData[] = sh.digest();
		StringBuffer sb = new StringBuffer(); 
		for(int i = 0 ; i < byteData.length ; i++){
			sb.append(Integer.toString((byteData[i]&0xff) + 0x100, 16).substring(1));
		}
		SHA = sb.toString();
	}catch(NoSuchAlgorithmException e){
		e.printStackTrace(); 
		SHA = null; 
	}
	return SHA;
}

//  ----------------------JDBC -------------------------------------------

public int logincheck(String id, String pw) {
	String sql="select count(*)as id  from member where id=? and pw=?";
	//int result=template.update(sql,id,pw);
	int result=template.queryForObject(sql,new Object[]{id,testSHA256(pw)},Integer.class);
	return result;
}
public boolean SelectId(String id) {
	String sql="select count(*)as id from member where id=?";
	int result=template.queryForObject(sql,new Object[] {id},Integer.class);
	if(result==1) {return true;}
	return false;
}

public int Insertmember(MemberDTO dto) {
	String sql="insert into member values(?,?,?,?,?,?,?,?,?,?,?)";
	int result=template.update(sql,dto.getId(),testSHA256(dto.getPw()),dto.getName(),dto.getPhone(),dto.getPhone1(),dto.getPhone2(),dto.getEmail(),dto.getPost(),dto.getAddress1(),dto.getAddress2(),dto.getImagepath());
	return result;
}

public MemberDTO selectAll(String id){
	String sql="select id,name,phone,phone1,phone2,email,post,address1,address2,img from member where id=?";
	
	MemberDTO dto= template.queryForObject(sql,new Object[]{id},new RowMapper<MemberDTO>() {
		
		@Override
		public MemberDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
		MemberDTO dto =new MemberDTO();
			dto.setId(rs.getString(1));
			dto.setName(rs.getString(2));
			dto.setPhone(rs.getString(3));
			dto.setPhone1(rs.getString(4));
			dto.setPhone2(rs.getString(5));
			dto.setEmail(rs.getString(6));
			dto.setPost(rs.getString(7));
			dto.setAddress1(rs.getString(8));
			dto.setAddress2(rs.getString(9));
			dto.setImagepath(rs.getString(10));
			return dto;
		}
		} );
		
	
	return dto;
}	

//-----------------------Mybatis -------------------------------------------
public int update(MemberDTO dto) {  
	dto.setPw(this.testSHA256(dto.getPw()));
	return sst.update("memberDAO.update",dto);
}




}
