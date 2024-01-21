package bo;

import java.util.ArrayList;

import Bean.AdminXacNhanbean;
import dao.chitiethoadondao;

public class chitiethoadonbo {
	chitiethoadondao ctdao=  new chitiethoadondao();
	public int Them(String MaSach,long SoLuongMua, long MaHoaDon) throws Exception{
		return ctdao.Them(MaSach, SoLuongMua, MaHoaDon);
	}
	
	public ArrayList<AdminXacNhanbean> getXacNhan() throws Exception {
		return ctdao.getXacNhan();
	}
	
	public int CapNhat(long MaCTHD) throws Exception {
		return ctdao.CapNhat(MaCTHD);
	}
}
