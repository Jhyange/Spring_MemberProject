package kh.spring.dto;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class MemberDTO {

private String id;
private String pw;
private String name;
private String phone;
private String phone1;
private String phone2;
private String email;
private String post;
private String address1;
private String address2;
private MultipartFile image;
private String imagepath;
public MemberDTO(String id, String pw, String name, String phone, String phone1, String phone2, String email,
		String post, String address1, String address2, MultipartFile image, String imagepath) {
	super();
	this.id = id;
	this.pw = pw;
	this.name = name;
	this.phone = phone;
	this.phone1 = phone1;
	this.phone2 = phone2;
	this.email = email;
	this.post = post;
	this.address1 = address1;
	this.address2 = address2;
	this.image = image;
	this.imagepath = imagepath;
}
public MemberDTO() {
	super();
}
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getPw() {
	return pw;
}
public void setPw(String pw) {
	this.pw = pw;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getPhone() {
	return phone;
}
public void setPhone(String phone) {
	this.phone = phone;
}
public String getPhone1() {
	return phone1;
}
public void setPhone1(String phone1) {
	this.phone1 = phone1;
}
public String getPhone2() {
	return phone2;
}
public void setPhone2(String phone2) {
	this.phone2 = phone2;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getPost() {
	return post;
}
public void setPost(String post) {
	this.post = post;
}
public String getAddress1() {
	return address1;
}
public void setAddress1(String address1) {
	this.address1 = address1;
}
public String getAddress2() {
	return address2;
}
public void setAddress2(String address2) {
	this.address2 = address2;
}
public MultipartFile getImage() {
	return image;
}
public void setImage(MultipartFile image) {
	this.image = image;
}
public String getImagepath() {
	return imagepath;
}
public void setImagepath(String imagepath) {
	this.imagepath = imagepath;
}
public MemberDTO(String id, String name, String phone, String phone1, String phone2, String email, String post,
		String address1, String address2, String imagepath) {
	super();
	this.id = id;
	this.name = name;
	this.phone = phone;
	this.phone1 = phone1;
	this.phone2 = phone2;
	this.email = email;
	this.post = post;
	this.address1 = address1;
	this.address2 = address2;
	this.imagepath = imagepath;
}



}
