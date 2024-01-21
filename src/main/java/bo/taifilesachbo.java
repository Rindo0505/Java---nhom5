package bo;

import java.util.ArrayList;

import Bean.Filebean;
import dao.taifilesachdao;

public class taifilesachbo {
	taifilesachdao tfdao = new taifilesachdao();
	public ArrayList<Filebean> getfilesach() throws Exception{
		return tfdao.getfilesach();
}
	public int Add(String masach, String tensach, String tacgia, int sotap, Long soluong, Long gia, String anh, String ngaynhap, String maloai) {
		
		return tfdao.Add(masach, tensach, tacgia, sotap, soluong, gia, anh, ngaynhap, maloai); 
	}
		
}
