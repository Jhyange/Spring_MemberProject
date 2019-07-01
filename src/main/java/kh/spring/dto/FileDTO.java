package kh.spring.dto;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileDTO {
private int seq;
private String imgpath;
private MultipartFile image;
public FileDTO(int seq, String imgpath, MultipartFile image) {
	super();
	this.seq = seq;
	this.imgpath = imgpath;
	this.image = image;
}
public FileDTO() {
	super();
}
public FileDTO(int seq, String imgpath) {
	super();
	this.seq = seq;
	this.imgpath = imgpath;
}
public int getSeq() {
	return seq;
}
public void setSeq(int seq) {
	this.seq = seq;
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
