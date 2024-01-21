package bo;

import java.util.ArrayList;

import Bean.khachhangbean;
import Bean.loaibean;
import dao.khachhangdao;
import dao.loaidao;

public class khachhangbo {
	khachhangdao khdao= new khachhangdao();
	public khachhangbean getkhachhang(String un, String passs) throws Exception{
		return khdao.getkhachhang(un,passs);
	}
	
	public int Themtaikhoan(String hoten, String diachi, String sodt, String email, String tendn, String pass) throws Exception{
		return khdao.ThemTaiKhoan(hoten, diachi, sodt, email, tendn, pass);
	}
	
	
	public static void main(String[] args) {
		khachhangbo k = new khachhangbo();
		try {
			System.out.println(k.getkhachhang("nkchung", "123"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}



}
