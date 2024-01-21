package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Bean.AdminXacNhanbean;
import Bean.sachbean;

public class AdminXacNhan {

	public ArrayList<AdminXacNhanbean> getXacNhan() throws Exception {
		ArrayList<AdminXacNhanbean> ds = new ArrayList<AdminXacNhanbean>();

		KetNoi kn = new KetNoi();
		kn.ketnoi();
		// b2: tạo câu lệnh sql
		String sql = "select *from VAminXacNhan";
		// b3: tạo câu lệnh
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		// b4: truyền tham số vào câu lệnh nếu có
		// b5: thực hiện câu lệnh
		ResultSet rs = cmd.executeQuery();
		// duyệt rs
		while (rs.next()) {
			long MaChiTietHD=rs.getLong("MachiTietHD");
			String hoten=rs.getString("hoten");
			String tensach =rs.getString("tesach");
			long gia=rs.getLong("gia");
			long SoLuongMua=rs.getLong("SoLuongMua");
			long thanhtien=rs.getLong("thanhtien");
			boolean damua=rs.getBoolean("DaMua");
			// Date ngaynhap = rs.getDate("NgayNhap");

			ds.add(new AdminXacNhanbean(MaChiTietHD, hoten, tensach, gia, SoLuongMua, thanhtien, damua));
		}
		// b7: đóng các đối tượng
		rs.close();
		kn.cn.close();
		return ds;
	}
}
