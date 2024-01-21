package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import Bean.AdminXacNhanbean;

public class chitiethoadondao {
	public int Them(String MaSach, long SoLuongMua, long MaHoaDon) throws Exception {
		KetNoi kn = new KetNoi();
		kn.ketnoi();

		String sql = "insert into ChiTietHoaDon(MaSach,SoLuongMua,MaHoaDon,damua) values (?,?,?,0)";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, MaSach);
		cmd.setLong(2, SoLuongMua);
		cmd.setLong(3, MaHoaDon);

		int kq = cmd.executeUpdate();
		cmd.close();

		kn.cn.close();
		return kq;
	}

	public ArrayList<AdminXacNhanbean> getXacNhan() throws Exception {
		ArrayList<AdminXacNhanbean> ds = new ArrayList<AdminXacNhanbean>();

		KetNoi kn = new KetNoi();
		kn.ketnoi();
		// b2: tạo câu lệnh sql
		String sql = "select *from VAdminXacNhan";
		// b3: tạo câu lệnh
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		// b4: truyền tham số vào câu lệnh nếu có
		// b5: thực hiện câu lệnh
		ResultSet rs = cmd.executeQuery();
		// duyệt rs
		while (rs.next()) {
			long MaChiTietHD=rs.getLong("MaChiTietHD");
			String hoten=rs.getString("hoten");
			String tensach =rs.getString("tensach");
			long gia=rs.getLong("gia");
			long SoLuongMua=rs.getLong("SoLuongMua");
			long thanhtien=rs.getLong("thanhtien");
			boolean damua=rs.getBoolean("damua");
			// Date ngaynhap = rs.getDate("NgayNhap");

			ds.add(new AdminXacNhanbean(MaChiTietHD, hoten, tensach, gia, SoLuongMua, thanhtien, damua));
		}
		// b7: đóng các đối tượng
		rs.close();
		kn.cn.close();
		return ds;
	}
	
	public int CapNhat(long MaCTHD) throws Exception {
		KetNoi kn = new KetNoi();
		kn.ketnoi();

		String sql = "update ChiTietHoaDon set damua=1 where MaChiTietHD=?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setLong(1, MaCTHD);
		int kq = cmd.executeUpdate();
		cmd.close();

		kn.cn.close();
		return kq;
	}
}
