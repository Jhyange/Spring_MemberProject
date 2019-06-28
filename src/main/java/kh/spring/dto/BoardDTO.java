package kh.spring.dto;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
@Component
public class BoardDTO {
private int seq;
private String title;
private String writer;
private String context;
private Timestamp now;
private int viewcount;
private String imgpath;
private MultipartFile image;
public BoardDTO(int seq, String title, String writer, String context, Timestamp now, int viewcount, String imgpath,
		MultipartFile image) {
	super();
	this.seq = seq;
	this.title = title;
	this.writer = writer;
	this.context = context;
	this.now = now;
	this.viewcount = viewcount;
	this.imgpath = imgpath;
	this.image = image;
}
public BoardDTO() {
	super();
}
public BoardDTO(int seq, String title, String writer, String context, Timestamp now, int viewcount, String imgpath) {
	super();
	this.seq = seq;
	this.title = title;
	this.writer = writer;
	this.context = context;
	this.now = now;
	this.viewcount = viewcount;
	this.imgpath = imgpath;
}
public int getSeq() {
	return seq;
}
public void setSeq(int seq) {
	this.seq = seq;
}
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public String getWriter() {
	return writer;
}
public void setWriter(String writer) {
	this.writer = writer;
}
public String getContext() {
	return context;
}
public void setContext(String context) {
	this.context = context;
}
public Timestamp getNow() {
	return now;
}
public void setNow(Timestamp now) {
	this.now = now;
}
public int getViewcount() {
	return viewcount;
}
public void setViewcount(int viewcount) {
	this.viewcount = viewcount;
}
public String getImgpath() {
	return imgpath;
}
public void setImgpath(String imgpath) {
	this.imgpath = imgpath;
}
public MultipartFile getImage() {
	return image;
}
public void setImage(MultipartFile image) {
	this.image = image;
}

}
